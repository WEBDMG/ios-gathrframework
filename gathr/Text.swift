//
//  Text.swift
//  PlayMe
//
//  Created by Richard Robinson on 9/5/16.
//  Copyright © 2016 WEBDMG. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class Text {
    var textid:String = String()
    var title:String = String()
    var text:String = String()
    var author:String = String()
    var type:String = String()
    var date:String = String()
    
    
    init(data: NSDictionary){
        if data["textid"] != nil {
            self.textid = String(data["textid"] as! String)
        }
        if data["title"] != nil {
            self.title = String(data["title"] as! String)
        }
        if data["text"] != nil {
            self.text = String(data["text"] as! String)
        }
        if data["author"] != nil {
            self.author = String(data["author"] as! String)
        }
        if data["type"] != nil{
            self.type = String(data["type"] as! String)
        }
        if data["date"] != nil {
            self.date = String(data["date"] as! String)
        }
    }
    
    init(dictionary: NSDictionary){
        if dictionary.valueForKey("textid") != nil {
            self.textid = dictionary.valueForKey("textid") as! String
        }
        if dictionary.valueForKey("title") != nil {
            self.title = dictionary.valueForKey("title") as! String
        }
        if dictionary.valueForKey("text") != nil {
            self.text = dictionary.valueForKey("text") as! String
        }
        if dictionary.valueForKey("author") != nil {
            self.author = dictionary.valueForKey("author") as! String
        }
        if dictionary.valueForKey("type") != nil{
            self.type = dictionary.valueForKey("type") as! String
        }
        if dictionary.valueForKey("date") != nil {
            self.date = dictionary.valueForKey("date") as! String
        }

    }
    
    func toDictionary() -> NSDictionary {
        let itemDictionary = [
            "textid":self.textid,
            "title":self.title,
            "text":self.text,
            "author":self.author,
            "type":self.type,
            "date":self.date
        ]
        return itemDictionary
    }
}