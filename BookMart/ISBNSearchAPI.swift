//
//  ISBNSearchAPI.swift
//  BookMart
//
//  Created by Sita Mulomudi on 3/30/16.
//  Copyright © 2016 CodePathFinders. All rights reserved.
//

import Foundation
import Alamofire

class ISBNSearchAPI {
    
    static let urlString = "http://www.isbnsearch.org/isbn/";
    
    // assumes valid ISBN (error handling done in CameraVC)
    class func getInfo(ISBN: String, success: (NSURLRequest?, NSHTTPURLResponse?, NSData?) -> (), failure: (NSError?)->()) {
        let URL = urlString + ISBN;
        Alamofire.request(.GET, URL).response { (request, response, data, error) in
            if let error = error {
                failure(error)
            } else {
                success(request, response, data)
            }
        }
    }
}
