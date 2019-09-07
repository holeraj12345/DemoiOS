//
//  ApiClient.swift
//  Demo
//
//  Created by Rajanikant Hole on 9/7/19.
//  Copyright © 2019 Demo. All rights reserved.
//

import Foundation
import Alamofire

class ApiClient: NSObject {
    static let sharedInstance = ApiClient()
    private override init() {
        
    }
    
    /**
     Get API  Call.
     */
    
    /// This is API call in response get list metadata in form of json
    ///
    /// - Parameters:
    ///   - url: url API
    ///   - completion: completion
    func fetApiRequest(url : String, completion:@escaping ( Model) -> () ) {
        Alamofire.request(url, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil)
            .validate(statusCode: 200..<600)
            .responseString { (jsonData) in
                do {    if let value = jsonData.result.value {
                    let data = Data(value.utf8)
                    let jsonDecoder = JSONDecoder()
                    let responseModel = try jsonDecoder.decode(Model.self, from: data)
                    completion(responseModel)
                    }
                }
                catch{
                    print("error")
                }
                
        }
        
    }
}

