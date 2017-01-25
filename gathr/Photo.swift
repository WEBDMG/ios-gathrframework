//
//  Photo.swift
//  PlayMe
//
//  Created by Richard Robinson on 9/1/16.
//  Copyright © 2016 WEBDMG. All rights reserved.
//

import Foundation

public class Photo {
    var title:String = String()
    var url:String = String()
    var source:String = String()
    
    init(data: NSDictionary){
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
    
    init(dictionary: NSDictionary){
        if dictionary.valueForKey("title") != nil {
            self.title = dictionary.valueForKey("title") as! String
        }
        if dictionary.valueForKey("url") != nil{
            self.url = dictionary.valueForKey("url") as! String
        }
        if dictionary.valueForKey("source") != nil{
            self.source = dictionary.valueForKey("source") as! String
        }

    }
    
    func toDictionary() -> NSDictionary {
        let photosDictionary = [
            "title":self.title,
            "excerpt":self.url,
            "source":self.source,
        ]
        return photosDictionary
    }
}
