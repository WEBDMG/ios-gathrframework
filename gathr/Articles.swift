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
        if let featured_image = data["featured_image"] as? NSDictionary{
            if featured_image["source"] != nil {
                self.featuredImage = String(featured_image["source"] as! String)
            }
        }
        
        if data["link"] != nil{
            self.link = String(data["link"] as! String)
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
