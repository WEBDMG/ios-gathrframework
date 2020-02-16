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
    public var title:String?
    /// Excerpt of article
    public var excerpt:String?
    /// Featured image of the article
    public var featuredImage:String?
    /// Link to article on the internet
    public var link:String?
    /// Main body content of the article post
    public var content:String?
    
    //MARK: - Init method
    /// Init to create Article object
    /// - Parameter data: json data set to a dictionary
    public init(data: NSDictionary){
        if let lead =  data["title"]{
            self.title = lead as? String
        }else{
            self.title = ""
        }
        if let shortLead = data["excerpt"]{
            self.excerpt = shortLead as? String
        }else{
            self.excerpt = ""
        }
        if let body = data["content"] {
            self.content = body as? String
        }else{
            self.content = ""
        }
        if let featured_image = data["featured_image"] as? NSDictionary{
            if let image = featured_image["source"] {
                self.featuredImage = image as? String
            }else{
                self.featuredImage = ""
            }
        }
        
        if let url = data["link"]{
            self.link = url as? String
        }else{
            self.link = ""
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
