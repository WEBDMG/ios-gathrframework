//
//  Config.swift
//  PlayMe
//
//  Created by Richard Robinson on 8/29/16.
//  Copyright © 2016 WEBDMG. All rights reserved.
//

import UIKit
import Alamofire

open class GetConfig : NSObject{

    
open static let sharedInstance: GetConfig = {
        let instance = GetConfig()
        // setup code
        return instance
    }()
    
    
    /**
     Gets remote config data and passes it back as a dictionary.
     After reading Playme.plist to get the base url and user token.
     
     - parameter completion: NSDictionary of result
     */
    open func getConfigApi(_ completion: @escaping (NSDictionary) -> Void){
        var config: NSDictionary?
        
        if let path = Bundle.main.path(forResource: "PlayMe", ofType: "plist") {
            config = NSDictionary(contentsOfFile: path)
        }
        if let dict = config {
            let token = "\(dict.value(forKey: "TOKEN")!)"
            let header = ["X-API-KEY":token]
            let url = "\(dict.value(forKey: "BASE_URL")!)" + "config/config/token/" + "\(dict.value(forKey:"PLAYMEAPPTOKEN")!)" as! String
            Alamofire.request(url, headers: header)
                .validate()
                .responseJSON { response in
                    print(response.request)
                    print(response.response)
                    print(response.request)
                    completion(response.result.value as! NSDictionary)
            }
        }
    }
    
    
}
