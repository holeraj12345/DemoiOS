//
//  Cell.swift
//  Demo
//
//  Created by Rajanikant Hole on 9/7/19.
//  Copyright © 2019 Demo. All rights reserved.
//

import UIKit



let cellIdentifier = "cell"
let padding = CGFloat(8)
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
        self.addSubview(backView)
        backView.translatesAutoresizingMaskIntoConstraints = false
        
        backView.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: padding).isActive = true
        backView.topAnchor.constraint(equalTo: self.topAnchor,constant: padding).isActive = true
        backView.trailingAnchor.constraint(equalTo: self.trailingAnchor,constant: -padding).isActive = true
        backView.bottomAnchor.constraint(equalTo:self.bottomAnchor,constant: -padding).isActive = true
       
        backView.backgroundColor = .white
        
        photoView.translatesAutoresizingMaskIntoConstraints = false
        backView.addSubview(photoView)
        
        photoView.leadingAnchor.constraint(equalTo: backView.leadingAnchor,constant: padding).isActive = true
        photoView.topAnchor.constraint(equalTo: backView.topAnchor,constant: padding).isActive = true
        photoView.trailingAnchor.constraint(equalTo: backView.trailingAnchor,constant: -padding).isActive = true
        photoView.contentMode = .scaleAspectFit
        
        photoView.heightAnchor.constraint(equalToConstant: 100.0).isActive = true
        photoView.image = UIImage(named: imgPlaceholder)!
        
        lblTitle.translatesAutoresizingMaskIntoConstraints = false
        backView.addSubview(lblTitle)
        lblTitle.leadingAnchor.constraint(equalTo: backView.leadingAnchor,constant: padding).isActive = true
        lblTitle.topAnchor.constraint(equalTo: photoView.bottomAnchor,constant: padding).isActive = true
        lblTitle.numberOfLines = 0
        lblTitle.trailingAnchor.constraint(equalTo: backView.trailingAnchor,constant: -padding).isActive = true
        
        lblDesc.translatesAutoresizingMaskIntoConstraints = false
        backView.addSubview(lblDesc)
        lblDesc.leadingAnchor.constraint(equalTo: backView.leadingAnchor,constant: padding).isActive = true
        lblDesc.topAnchor.constraint(equalTo: lblTitle.bottomAnchor,constant: padding).isActive = true
        lblDesc.trailingAnchor.constraint(equalTo: backView.trailingAnchor,constant: -padding).isActive = true
        lblDesc.numberOfLines = 0
        lblDesc.bottomAnchor.constraint(equalTo:backView.bottomAnchor,constant: -padding).isActive = true
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
