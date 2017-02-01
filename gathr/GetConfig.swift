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
    open var config: Config!
    
    open static let sharedInstance: GetConfig = {
        let instance = GetConfig()
        // setup code
        
        return instance
    }()
    
    override init() {
        super.init()
       self.getConfigApi({ (config) in
            self.config = config
        })
    }
    
    /**
     Gets remote config data and passes it back as a dictionary.
     After reading Playme.plist to get the base url and user token.
     
     - parameter completion: NSDictionary of result
     */
    open func getConfigApi(_ completion: @escaping (Config) -> Void){
         var playme: NSDictionary?
        if let path = Bundle.main.path(forResource: "PlayMe", ofType: "plist") {
            playme = NSDictionary(contentsOfFile: path)
        }
        if let dict = playme {
            let token = "\(dict.value(forKey: "TOKEN")!)"
            let header:HTTPHeaders = ["X-API-KEY":token]
            let url = "\(dict.value(forKey: "BASE_URL")!)" + "config/config/token/" + "\(dict.value(forKey:"PLAYMEAPPTOKEN")!)"
            Alamofire.request(url, headers: header)
                .validate()
                .responseJSON { response in
                    let data = response.result.value as! NSDictionary
                    self.config = Config(response: data)!
                    completion(self.config)
            }
        }
    }
    
    
}
