//
//  GathrConfiguration.swift
//  GathrFramework
//
//  Created by Richard Robinson on 2/21/17.
//  Copyright © 2017 WEBDMG. All rights reserved.
//

import Foundation

public class GathrConfiguration: NSObject {
    
    public static let sharedInstance = GathrConfiguration()
    /// Playme Tokens
    public struct Key{
        /// User token
        public static let TOKEN = "TOKEN"
        /// Base url to api
        public static let BASE_URL = "BASE_URL"
        /// Token to identify app
        public static let PLAYMEAPPTOKEN = "PLAYMEAPPTOKEN"
        /// API Key to auth to API
        public static let API_KEY = "API_KEY"
    }
    
    public var configDictionary : NSDictionary?
    
    public override init(){
        if let path = Bundle.main.path(forResource: "PlayMe", ofType: "plist") {
            self.configDictionary = NSDictionary(contentsOfFile: path)
        }else{
            print("PlayMe.plist File Not Found.")
        }
    }
    
    public func TOKEN()-> String?{
        return configDictionary?.object(forKey: Key.TOKEN) as? String
    }
    public func BASE_URL()-> String?{
        if configDictionary?.object(forKey: Key.BASE_URL) != nil {
            return configDictionary?.object(forKey: Key.BASE_URL) as? String
        }else{
            return "http://api.gathr.me/v4/"
        }
        
        
    }
    public func PLAYMEAPPTOKEN()-> String?{
        return configDictionary?.object(forKey: Key.PLAYMEAPPTOKEN) as? String
    }
    public func APIKEY()-> String?{
        return configDictionary?.object(forKey: Key.API_KEY) as? String
    }
    
}
