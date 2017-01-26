//
//  News.swift
//  WEBDMG
//
//  Created by Richard Robinson on 6/6/16.
//  Copyright © 2016 WEBDMG. All rights reserved.
//

import Foundation


/// Articles object.
public class Articles {
    public var title:String = String()
    public var excerpt:String = String()
    public var featuredImage:String = String()
    public var link:String = String()
    
    public init(data: NSDictionary){
        if data["title"] != nil {
            self.title = String(data["title"] as! String)
        }
        if data["excerpt"] != nil {
            self.excerpt = String(data["excerpt"] as! String)
        }
        if data["featured_image"]!["source"] != nil {
            self.featuredImage = String(data["featured_image"]!["source"] as! String)
        }
        if data["link"] != nil{
            self.link = String(data["link"] as! String)
        }
        
    }
    
    public init(dictionary: NSDictionary){
        if dictionary.valueForKey("title") != nil {
            self.title = dictionary.valueForKey("title") as! String
        }
        if dictionary.valueForKey("excerpt") != nil{
            self.excerpt = dictionary.valueForKey("excerpt") as! String
        }
        if dictionary.valueForKey("source") != nil{
            self.featuredImage = dictionary.valueForKey("featured_image") as! String
        }
        if dictionary.valueForKey("link") != nil{
            self.link = dictionary.valueForKey("link") as! String
        }
    }
    
    func toDictionary() -> NSDictionary {
        let newsDictionary = [
            "title":self.title,
            "excerpt":self.excerpt,
            "featuredImage":self.featuredImage,
            "link":self.link
        ]
        return newsDictionary
    }
}
