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
    class func isConnectedToInternet() ->Bool {
        if let manager = NetworkReachabilityManager() {
            return manager.isReachable
        }else {
            return false
        }
    }
}
