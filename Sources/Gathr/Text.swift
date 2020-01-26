//
//  Text.swift
//  PlayMe
//
//  Created by Richard Robinson on 9/5/16.
//  Copyright © 2016 WEBDMG. All rights reserved.
//

import Foundation

/// Gathr Text object
open class Text {
    /// Text id assigned by Gathr
    public var textid:String = String()
    /// String title of Text. Set by the user.
    public var title:String = String()
    /// Body of the text. Set by the user.
    public var text:String = String()
    /// The name of the person or persons that wrote the test. Set by the user.
    public var author:String = String()
    /// Can be quote or atricle. Set by the user.
    public var type:String = String()
    /// Date created
    public var date:String = String()
    
    //MARK: - Init method
    /// Init to create Text object
     /// - Parameter data: json data set to a dictionary
    public init(data: NSDictionary){
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

    /// If data is already a dictionary and you need to convert it to an Text object
    /// - Parameter dictionary: NSDictionary data to be passed in.
   public init(dictionary: NSDictionary){
        if dictionary.value(forKey: "textid") != nil {
            self.textid = dictionary.value(forKey: "textid") as! String
        }
        if dictionary.value(forKey: "title") != nil {
            self.title = dictionary.value(forKey: "title") as! String
        }
        if dictionary.value(forKey: "text") != nil {
            self.text = dictionary.value(forKey: "text") as! String
        }
        if dictionary.value(forKey: "author") != nil {
            self.author = dictionary.value(forKey: "author") as! String
        }
        if dictionary.value(forKey: "type") != nil{
            self.type = dictionary.value(forKey: "type") as! String
        }
        if dictionary.value(forKey: "date") != nil {
            self.date = dictionary.value(forKey: "date") as! String
        }
        
    }
    
    //MARK: - To method
    /// Convert Object to Dictionary
    open func toDictionary() -> NSDictionary {
        let itemDictionary = [
            "textid":self.textid,
            "title":self.title,
            "text":self.text,
            "author":self.author,
            "type":self.type,
            "date":self.date
        ]
        return itemDictionary as NSDictionary
    }
}
