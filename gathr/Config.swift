//
//  Config.swift
//  PlayMe
//
//  Created by Richard Robinson on 8/30/16.
//  Copyright © 2016 WEBDMG. All rights reserved.
//

import Foundation

open class Config:NSObject{
    public var blogurl = ""
    public var playmeappappleid = ""
    public var playmeappfacebookurl = ""
    public var playmeapphomeurl = ""
    public var playmeappid = ""
    public var playmeappinstagramurl = ""
    public var playmeappkeywords = ""
    public var playmeapplandingpageactive = ""
    public var playmeappname = ""
    public var playmeappnameformatted = ""
    public var playmeappstoreurl = ""
    public var playmeapptoken = ""
    public var playmeapptwitterurl = ""
    public var playmetoken = ""
    
    public init?(response:NSDictionary) {
        self.blogurl = (((response.value(forKey: "config") as AnyObject).value(forKey: "blogurl") as AnyObject).object(at: 0)) as! String
        self.playmeappappleid = (((response.value(forKey: "config") as AnyObject).value(forKey: "playmeappappleid") as AnyObject).object(at: 0)) as! String
        self.playmeappfacebookurl = (((response.value(forKey: "config") as AnyObject).value(forKey: "playmeappfacebookurl") as AnyObject).object(at: 0)) as! String
        self.playmeapphomeurl = (((response.value(forKey: "config") as AnyObject).value(forKey: "playmeapphomeurl") as AnyObject).object(at: 0)) as! String
        self.playmeappid = (((response.value(forKey: "config") as AnyObject).value(forKey: "playmeappid") as AnyObject).object(at: 0)) as! String
        self.playmeappinstagramurl = (((response.value(forKey: "config") as AnyObject).value(forKey: "playmeappinstagramurl") as AnyObject).object(at: 0)) as! String
        //self.playmeappkeywords = (response.valueForKey("config")?.valueForKey("playmeappkeywords")?.objectAtIndex(0))! as! String
        self.playmeapplandingpageactive = (((response.value(forKey: "config") as AnyObject).value(forKey: "playmeapplandingpageactive") as AnyObject).object(at: 0)) as! String
        self.playmeappname = (((response.value(forKey: "config") as AnyObject).value(forKey: "playmeappname") as AnyObject).object(at: 0)) as! String
        self.playmeappnameformatted = (((response.value(forKey: "config") as AnyObject).value(forKey: "playmeappnameformatted") as AnyObject).object(at: 0)) as! String
        self.playmeappstoreurl = (((response.value(forKey: "config") as AnyObject).value(forKey: "playmeappstoreurl") as AnyObject).object(at: 0)) as! String
        self.playmeapptoken = (((response.value(forKey: "config") as AnyObject).value(forKey: "playmeapptoken") as AnyObject).object(at: 0)) as! String
        self.playmeapptwitterurl = (((response.value(forKey: "config") as AnyObject).value(forKey: "playmeapptwitterurl") as AnyObject).object(at: 0)) as! String
        self.playmetoken = (((response.value(forKey: "config") as AnyObject).value(forKey: "playmetoken") as AnyObject).object(at: 0)) as! String
    }
    
    open func toDictionary() -> NSDictionary {
        let configDictionary = [
            "blogurl": self.blogurl,
            "playmeappappleid": self.playmeappappleid,
            "playmeappfacebookurl": self.playmeappfacebookurl,
            "playmeapphomeurl": self.playmeapphomeurl,
            "playmeappid": self.playmeappid,
            "playmeappinstagramurl": self.playmeappinstagramurl,
            "playmeappkeywords": self.playmeappkeywords,
            "playmeapplandingpageactive": self.playmeapplandingpageactive,
            "playmeappname": self.playmeappname,
            "playmeappnameformatted": self.playmeappnameformatted,
            "playmeappstoreurl": self.playmeappstoreurl,
            "playmeapptoken": self.playmeapptoken,
            "playmeapptwitterurl": self.playmeapptwitterurl,
            "playmetoken": self.playmetoken
        ]
        return configDictionary as NSDictionary
    }
}
