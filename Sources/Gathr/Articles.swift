//
//  News.swift
//  WEBDMG
//
//  Created by Richard Robinson on 6/6/16.
//  Copyright © 2016 WEBDMG. All rights reserved.
//

import Foundation

/// Gathr articles object
open class Articles {
    //MARK: - Properties
    /// Title of the article
    public var title:String = String()
    /// Excerpt of article
    public var excerpt:String = String()
    /// Featured image of the article
    public var featuredImage:String = String()
    /// Link to article on the internet
    public var link:String = String()
    /// Main body content of the article post
    public var content:String = String()
    
    //MARK: - Init method
    /// Init to create Article object
    /// - Parameter data: json data set to a dictionary
    public init(data: NSDictionary){
        if data["title"] != nil {
            self.title = String(data["title"] as! String)
        }
        if data["excerpt"] != nil {
            self.excerpt = String(data["excerpt"] as! String)
        }
        if data["content"] != nil {
            self.content = String(data["content"] as! String)
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
    
    //MARK: - To Method
    /// Convert Object to Dictionary
    open func toDictionary() -> NSDictionary {
        let newsDictionary = [
            "title":self.title,
            "excerpt":self.excerpt,
            "content":self.content,
            "featuredImage":self.featuredImage,
            "link":self.link
        ]
        return newsDictionary as NSDictionary
    }
}
