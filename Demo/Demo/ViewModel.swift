//
//  ViewModel.swift
//  Demo
//
//  Created by Rajanikant Hole on 9/7/19.
//  Copyright © 2019 Demo. All rights reserved.
//

import UIKit

class ViewModel: NSObject {

    var model : Model?
    
    ///  Get list API call.
    ///
    /// - Parameter completion: completion
    func getList(completion: @escaping () -> Void) {
        
        ApiClient.sharedInstance.fetApiRequest(url: url) { (result) in
            
            DispatchQueue.main.async {
                self.model = result
                completion()
            }
        }
        
    }
    
}
