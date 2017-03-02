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
    
    public struct Key{
        public static let TOKEN = "TOKEN"
        public static let BASE_URL = "BASE_URL"
        public static let PLAYMEAPPTOKEN = "PLAYMEAPPTOKEN"
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

}
