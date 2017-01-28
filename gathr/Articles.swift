//
//  News.swift
//  WEBDMG
//
//  Created by Richard Robinson on 6/6/16.
//  Copyright © 2016 WEBDMG. All rights reserved.
//

import Foundation


open class Articles {
    public var title:String = String()
    public var excerpt:String = String()
    public var featuredImage:String = String()
    public var link:String = String()
    
    init(data: NSDictionary){
        if data["title"] != nil {
            self.title = String(data["title"] as! String)
        }
        if data["excerpt"] != nil {
            self.excerpt = String(data["excerpt"] as! String)
        }
        if data["featured_image.source"] != nil {
            self.featuredImage = String(data["featured_image.source"] as! String)
        }
        if data["link"] != nil{
            self.link = String(data["link"] as! String)
        }
        
    }
    
    init(dictionary: NSDictionary){
        if dictionary.value(forKey: "title") != nil {
            self.title = dictionary.value(forKey: "title") as! String
        }
        if dictionary.value(forKey: "excerpt") != nil{
            self.excerpt = dictionary.value(forKey: "excerpt") as! String
        }
        if dictionary.value(forKey: "source") != nil{
            self.featuredImage = dictionary.value(forKey: "featured_image") as! String
        }
        if dictionary.value(forKey: "link") != nil{
            self.link = dictionary.value(forKey: "link") as! String
        }
    }
    
    open func toDictionary() -> NSDictionary {
        let newsDictionary = [
            "title":self.title,
            "excerpt":self.excerpt,
            "featuredImage":self.featuredImage,
            "link":self.link
        ]
        return newsDictionary as NSDictionary
    }
}
