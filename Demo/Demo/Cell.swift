//
//  Cell.swift
//  Demo
//
//  Created by Rajanikant Hole on 9/7/19.
//  Copyright © 2019 Demo. All rights reserved.
//

import UIKit

//class Cell: UITableViewCell {
//
//    override func awakeFromNib() {
//        super.awakeFromNib()
//        // Initialization code
//    }
//
//    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//
//        // Configure the view for the selected state
//    }
//
//}


let cellIdentifier = "cell"


 class Cell: UITableViewCell {
    
    let backView = UIView()
    let photoView = UIImageView()
    let lblTitle = UILabel()
    let lblDesc = UILabel()
    override func awakeFromNib() {
        super.awakeFromNib()
      
        
    }
    
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.contentView.addSubview(backView)
        backView.translatesAutoresizingMaskIntoConstraints = false
        
        backView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor).isActive = true
        backView.topAnchor.constraint(equalTo: self.contentView.topAnchor).isActive = true
        backView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor).isActive = true
        backView.bottomAnchor.constraint(equalTo:self.contentView.bottomAnchor).isActive = true
       
        backView.backgroundColor = .red
        
        photoView.translatesAutoresizingMaskIntoConstraints = false
        backView.addSubview(photoView)
        
        photoView.leadingAnchor.constraint(equalTo: backView.leadingAnchor).isActive = true
        photoView.topAnchor.constraint(equalTo: backView.topAnchor,constant: 8).isActive = true
        photoView.trailingAnchor.constraint(equalTo: backView.trailingAnchor,constant: 8).isActive = true
        photoView.contentMode = .scaleAspectFit
        
        photoView.heightAnchor.constraint(equalToConstant: 59.0).isActive = true
        photoView.backgroundColor = .yellow
        photoView.image = UIImage(named: imgPlaceholder)!
        
        lblTitle.translatesAutoresizingMaskIntoConstraints = false
        backView.addSubview(lblTitle)
        lblTitle.leadingAnchor.constraint(equalTo: backView.leadingAnchor).isActive = true
        lblTitle.topAnchor.constraint(equalTo: photoView.bottomAnchor,constant: 8).isActive = true
        lblTitle.numberOfLines = 0
        lblTitle.trailingAnchor.constraint(equalTo: backView.trailingAnchor,constant: 8).isActive = true
        //lblTitle.bottomAnchor.constraint(equalTo:backView.bottomAnchor).isActive = true
        //photoView.bottomAnchor.constraint(equalTo:lblTitle.topAnchor).isActive = true
        lblTitle.backgroundColor = .gray
        lblTitle.text = "111 dfomAnchor.constraint(equalTo:lblTitle.topAn.topAnchor).efg"
        
        lblDesc.translatesAutoresizingMaskIntoConstraints = false
        backView.addSubview(lblDesc)
        lblDesc.leadingAnchor.constraint(equalTo: backView.leadingAnchor).isActive = true
        lblDesc.topAnchor.constraint(equalTo: lblTitle.bottomAnchor,constant: 8).isActive = true
        lblDesc.trailingAnchor.constraint(equalTo: backView.trailingAnchor,constant: 8).isActive = true
         lblDesc.numberOfLines = 0
        lblDesc.bottomAnchor.constraint(equalTo:backView.bottomAnchor).isActive = true
        //photoView.bottomAnchor.constraint(equalTo:lblTitle.topAnchor).isActive = true
        lblDesc.backgroundColor = .gray
        lblDesc.text = "222 dfomAnchor.cons.constraint(equalTolbl.constraint(equalTolbl.constraint(equalTolbltraint(equalTolblTitle.topAn.topAnchorlblTitle.topAn.topAnchor:lblTitle.tople.topAnchor).efg"
        
        
        self.layoutIfNeeded()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
}
