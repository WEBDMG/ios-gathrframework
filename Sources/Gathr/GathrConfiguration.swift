//
//  GathrConfiguration.swift
//  GathrFramework
//
//  Created by Richard Robinson on 2/21/17.
//  Copyright © 2017 WEBDMG. All rights reserved.
//

import Foundation

/// Configuration set after reading in playme file.
public class GathrConfiguration: NSObject {
    
    /// creates singleton
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
    
    /// Configuration items stored as dictionary
    public var configDictionary : NSDictionary?
    
    //MARK: - Init Method
    
    /// Init Method
    public override init(){
        if let path = Bundle.main.path(forResource: "PlayMe", ofType: "plist") {
            self.configDictionary = NSDictionary(contentsOfFile: path)
        }else{
            print("PlayMe.plist File Not Found.")
        }
    }
    
    /// Gets token from configuration dictonary and returns it as a string.
    public func TOKEN()-> String?{
        return configDictionary?.object(forKey: Key.TOKEN) as? String
    }
    /// Gets base url for Gathr API with a default set to the lastest stable url from configuration dictonary and returns it as a string.
    public func BASE_URL()-> String?{
        if configDictionary?.object(forKey: Key.BASE_URL) != nil {
            return configDictionary?.object(forKey: Key.BASE_URL) as? String
        }else{
            return "https://api.gathr.me/v4/"
        }
    }
    /// Gets play me app token from configuration dictonary and returns it as a string.
    public func PLAYMEAPPTOKEN()-> String?{
        return configDictionary?.object(forKey: Key.PLAYMEAPPTOKEN) as? String
    }
    /// Gets users api key from configuration dictonary and returns it as a string.
    public func APIKEY()-> String?{
        return configDictionary?.object(forKey: Key.API_KEY) as? String
    }
    
}
