//
//  Photo.swift
//  PlayMe
//
//  Created by Richard Robinson on 9/1/16.
//  Copyright © 2016 WEBDMG. All rights reserved.
//

import Foundation

open class Photo {
    public var title:String = String()
    public var url:String = String()
    public var source:String = String()
    
    public init(data: NSDictionary){
        if data["title"] != nil {
            self.title = String(data["title"] as! String)
        }
        if data["url"] != nil {
            self.url = String(data["url"] as! String)
        }
        if data["source"] != nil {
            self.source = String(data["source"] as! String)
        }
        
    }
    
    public init(dictionary: NSDictionary){
        if dictionary.value(forKey: "title") != nil {
            self.title = dictionary.value(forKey: "title") as! String
        }
        if dictionary.value(forKey: "url") != nil{
            self.url = dictionary.value(forKey: "url") as! String
        }
        if dictionary.value(forKey: "source") != nil{
            self.source = dictionary.value(forKey: "source") as! String
        }
        
    }
    
    open func toDictionary() -> NSDictionary {
        let photosDictionary = [
            "title":self.title,
            "excerpt":self.url,
            "source":self.source,
            ]
        return photosDictionary as NSDictionary
    }
}
