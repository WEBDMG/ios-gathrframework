//
//  Config.swift
//  PlayMe
//
//  Created by Richard Robinson on 8/29/16.
//  Copyright © 2016 WEBDMG. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

/// Creates Gathr Config object
open class GathrConfig : NSObject{
    
    /// Config object
    open var config: Config!
    
    /// Creates singleton
    public static let sharedInstance = GathrConfig()
    
    //MARK: - Init method
    /// Init Method
    public override init() {
        super.init()
        self.getConfigApi({ (config) in
            self.config = config
        })
    }
    
    ///Gets remote config data and passes it back as a dictionary. After reading Playme.plist to get the base url and user token.
    /// - Parameter completion: NSDictionary of result
    open func getConfigApi(_ completion: @escaping (Config) -> Void){
        let apikey = "\(GathrConfiguration.sharedInstance.APIKEY()!)"
        let header:HTTPHeaders = ["X-API-KEY":apikey]
        let url = "\(GathrConfiguration.sharedInstance.BASE_URL()!)" + "config/config/token/" + "\(GathrConfiguration.sharedInstance.PLAYMEAPPTOKEN()!)"
        Alamofire.request(url, headers: header)
            .validate()
            .responseJSON { response in
                guard let response = response.result.value else { return }
                let data = JSON(response)
                self.config = Config(response: data.rawValue as! NSDictionary)!
                GathrNotifications().postNotification(name: "GathrConfigLoaded")
                completion(self.config)
        }
    }
    
    
}
