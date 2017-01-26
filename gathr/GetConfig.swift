//
//  Config.swift
//  PlayMe
//
//  Created by Richard Robinson on 8/29/16.
//  Copyright © 2016 WEBDMG. All rights reserved.
//

import UIKit
import Alamofire

public class GetConfig : NSObject{
        /// Create a singleton
   public class var sharedInstance: GetConfig {
        struct Static {
            static var instance: GetConfig?
            static var token: dispatch_once_t = 0
        }
        
        dispatch_once(&Static.token) {
            Static.instance = GetConfig()
        }
        
        return Static.instance!
    }
    
    /**
     Gets remote config data and passes it back as a dictionary.
     After reading Playme.plist to get the base url and user token.
     
     - parameter completion: NSDictionary of result
     */
    public func getConfigApi(completion: (NSDictionary) -> Void){
        var config: NSDictionary?
       
        if let path = NSBundle.mainBundle().pathForResource("PlayMe", ofType: "plist") {
            config = NSDictionary(contentsOfFile: path)
        }
        if let dict = config {
            let token = "\(dict.valueForKey("TOKEN")!)"
            let header = ["X-API-KEY":token]
            Alamofire.request(
                .GET,
                "\(dict.valueForKey("BASE_URL")!)"+"config/config/token/"+"\(dict.valueForKey("PLAYMEAPPTOKEN")!)",
                headers:header,
                encoding: .URLEncodedInURL)
                .validate()
                .responseJSON { response in
                    switch response.result {
                    case .Success:
                        completion(response.result.value as! NSDictionary)
                    case .Failure(let error):
                        print(error)
                    }
                }
            }
        }
}


