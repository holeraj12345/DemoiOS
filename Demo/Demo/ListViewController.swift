//
//  ListViewController.swift
//  Demo
//
//  Created by Rajanikant Hole on 9/7/19.
//  Copyright © 2019 Demo. All rights reserved.
//

import UIKit
import AlamofireImage

extension NSObject {
    
    /// Method to get class name
    var className: String {
        return String(describing: type(of: self))
    }
    
    /// static method to get class name
    class var className: String {
        return String(describing: self)
    }
}

class ListViewController: UIViewController {
    static let annotationPadding: CGFloat = 4
    
    let lblTitle = UILabel()
    var refresher:UIRefreshControl = UIRefreshControl()
    var model : Model?
    var viewModel : ViewModel = ViewModel()
    var table = UITableView()
    var titleLbl: UILabel = {
        
        let label = UILabel()
        label.text = "Loading"
        label.textAlignment = NSTextAlignment.center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 20)
        return label
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.getData()
        //let nib = UINib(nibName: Cell.className, bundle: Bundle.main)
        //table.register(nib, forCellReuseIdentifier: Cell.className)
        table.register(Cell.self, forCellReuseIdentifier: "Cell")
        self.refresher.addTarget(self, action: #selector(loadData), for: .valueChanged)
        self.table.addSubview(refresher)

        lblTitle.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(lblTitle)
        lblTitle.leadingAnchor.constraint(equalTo: self.view.leadingAnchor,constant: 20).isActive = true
        lblTitle.topAnchor.constraint(equalTo: self.view.topAnchor,constant: 30).isActive = true
        lblTitle.numberOfLines = 0
        lblTitle.trailingAnchor.constraint(equalTo: self.view.trailingAnchor,constant: 20).isActive = true
        lblTitle.heightAnchor.constraint(equalToConstant: 70).isActive = true
        lblTitle.backgroundColor = .red
        //lblTitle.bottomAnchor.constraint(equalTo:backView.bottomAnchor).isActive = true
        //photoView.bottomAnchor.constraint(equalTo:lblTitle.topAnchor).isActive = true
        lblTitle.backgroundColor = .gray
        lblTitle.text = "Loading"
        
        table.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(table)
        table.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        table.topAnchor.constraint(equalTo:lblTitle.bottomAnchor,constant: 10).isActive = true
        table.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        table.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        table.dataSource = self
        table.separatorStyle = .none
        table.allowsSelection = false
        self.view.layoutIfNeeded()
        self.view.backgroundColor = .gray
    }
    func getData() {
        
        if Connectivity.isConnectedToInternet() {
            
            self.viewModel.getList {
                
                self.model = self.viewModel.model
                self.lblTitle.text = self.model?.title
                self.table.reloadData()
                self.refresher.endRefreshing()
            }
        }else {
            
            let alertController = UIAlertController(title: "Alert", message: "The Internet is not available", preferredStyle: .alert)
            
            alertController.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            present(alertController, animated: true, completion: nil)
            
        }
        
        
    }
    
    @objc func loadData() {
        self.getData()
    }
}
extension ListViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.model?.rows?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! Cell

        let object  = self.model?.rows? [indexPath.row]
        
        cell.lblTitle.text = object?.title
        cell.lblDesc.text = object?.description
        if let _ = object?.imageHref {
            let url = URL(string:(object?.imageHref)!)!
            let placeholderImage = UIImage(named: imgPlaceholder)!
            
            cell.photoView.af_setImage(withURL: url, placeholderImage: placeholderImage)
            
        }else {
            cell.photoView.image = UIImage(named: imgPlaceholder)!
        }
        cell.backView.backgroundColor = UIColor.white
        cell.backView.setAsCardBackground()
        return cell
    }
}

