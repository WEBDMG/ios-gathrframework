//
//  Config.swift
//  PlayMe
//
//  Created by Richard Robinson on 8/30/16.
//  Copyright © 2016 WEBDMG. All rights reserved.
//

import UIKit

class Config:NSObject{
    var blogurl = ""
    var playmeappappleid = ""
    var playmeappfacebookurl = ""
    var playmeapphomeurl = ""
    var playmeappid = ""
    var playmeappinstagramurl = ""
    var playmeappkeywords = ""
    var playmeapplandingpageactive = ""
    var playmeappname = ""
    var playmeappnameformatted = ""
    var playmeappstoreurl = ""
    var playmeapptoken = ""
    var playmeapptwitterurl = ""
    var playmetoken = ""
    var playmeapplayout = ""
    
    init?(response:NSDictionary) {
        self.blogurl = (response.valueForKey("config")?.valueForKey("blogurl")?.objectAtIndex(0))! as! String
        self.playmeappappleid = (response.valueForKey("config")?.valueForKey("playmeappappleid")?.objectAtIndex(0))! as! String
        self.playmeappfacebookurl = (response.valueForKey("config")?.valueForKey("playmeappfacebookurl")?.objectAtIndex(0))! as! String
        self.playmeapphomeurl = (response.valueForKey("config")?.valueForKey("playmeapphomeurl")?.objectAtIndex(0))! as! String
        self.playmeappid = (response.valueForKey("config")?.valueForKey("playmeappid")?.objectAtIndex(0))! as! String
        self.playmeappinstagramurl = (response.valueForKey("config")?.valueForKey("playmeappinstagramurl")?.objectAtIndex(0))! as! String
        //self.playmeappkeywords = (response.valueForKey("config")?.valueForKey("playmeappkeywords")?.objectAtIndex(0))! as! String
        self.playmeapplandingpageactive = (response.valueForKey("config")?.valueForKey("playmeapplandingpageactive")?.objectAtIndex(0))! as! String
        self.playmeappname = (response.valueForKey("config")?.valueForKey("playmeappname")?.objectAtIndex(0))! as! String
        self.playmeappnameformatted = (response.valueForKey("config")?.valueForKey("playmeappnameformatted")?.objectAtIndex(0))! as! String
        self.playmeappstoreurl = (response.valueForKey("config")?.valueForKey("playmeappstoreurl")?.objectAtIndex(0))! as! String
        self.playmeapptoken = (response.valueForKey("config")?.valueForKey("playmeapptoken")?.objectAtIndex(0))! as! String
        self.playmeapptwitterurl = (response.valueForKey("config")?.valueForKey("playmeapptwitterurl")?.objectAtIndex(0))! as! String
        self.playmetoken = (response.valueForKey("config")?.valueForKey("playmetoken")?.objectAtIndex(0))! as! String
        self.playmeapplayout = (response.valueForKey("config")?.valueForKey("playmeapplayout")?.objectAtIndex(0))! as! String
    }
        
    func toDictionary() -> NSDictionary {
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
         "playmetoken": self.playmetoken,
         "playmeapplayout":self.playmeapplayout
        ]
        return configDictionary
    }
}