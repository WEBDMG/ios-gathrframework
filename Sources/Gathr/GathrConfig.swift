//
//  Config.swift
//  PlayMe
//
//  Created by Richard Robinson on 8/29/16.
//  Copyright © 2016 WEBDMG. All rights reserved.
//

import UIKit
import Alamofire

open class GathrConfig : NSObject{
    
    open var config: Config!
    
    public static let sharedInstance = GathrConfig()
    
    public override init() {
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
        let apikey = "\(GathrConfiguration.sharedInstance.APIKEY()!)"
        let header:HTTPHeaders = ["X-API-KEY":apikey]
        let url = "\(GathrConfiguration.sharedInstance.BASE_URL()!)" + "config/config/token/" + "\(GathrConfiguration.sharedInstance.PLAYMEAPPTOKEN()!)"
        Alamofire.request(url, headers: header)
            .validate()
            .responseJSON { response in
                let data = response.result.value as! NSDictionary
                self.config = Config(response: data)!
                GathrNotifications().postNotification(name: "GathrConfigLoaded")
                completion(self.config)
        }
    }
    
    
}
