//
//  Extensions.swift
//  Demo
//
//  Created by Rajanikant Hole on 9/7/19.
//  Copyright © 2019 Demo. All rights reserved.
//

import AVFoundation
import UIKit

/**
 Extension UIView
 */
extension UIView {
    
    /// This will show view with shadow and radius
    func setAsCardBackground() {
        layer.cornerRadius = 2.0
        layer.shadowColor = UIColor.gray.cgColor
        layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
        layer.shadowRadius = 2.0
        layer.shadowOpacity = 0.7
    }
}



