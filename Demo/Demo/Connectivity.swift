//
//  Connectivity.swift
//  Demo
//
//  Created by Rajanikant Hole on 9/7/19.
//  Copyright © 2019 Demo. All rights reserved.
//

import Foundation
import Alamofire

class Connectivity {
    
    /**
     NetworkConnectivity Check.
     */
    
    /// Check newtwork if reachable return true else false
    ///
    /// - Returns: bool
    class func isConnectedToInternet() ->Bool {
        if let manager = NetworkReachabilityManager() {
            return manager.isReachable
        }else {
            return false
        }
    }
}
