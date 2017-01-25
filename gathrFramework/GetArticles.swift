//
//  GetNews.swift
//  WEBDMG
//
//  Created by Richard Robinson on 6/6/16.
//  Copyright © 2016 WEBDMG. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class GetArticles : NSObject{
     var articles:[Articles] = [Articles]()
    
    //Create a singleton
    class var sharedInstance: GetArticles {
        struct Static {
            static var instance: GetArticles?
            static var token: dispatch_once_t = 0
        }
        
        dispatch_once(&Static.token) {
            Static.instance = GetArticles()
        }
        
        return Static.instance!
    }
    func getAllArticles(blogURL:String, completion: ([Articles]?) -> Void) {
        Alamofire.request(
            .GET,
            blogURL + "/wp-json/posts?filter[posts_per_page]=13&filter[order]=DESC",
            parameters: nil,
            encoding: .URL)
            .validate()
            .responseJSON { (response) -> Void in
                self.articles = [Articles]()
                let data = JSON(response.result.value!)
                if let newsItems = data.array{
                    for newsData in newsItems {
                        let newsDict = newsData.dictionaryObject! as NSDictionary
                        let newNews = Articles(data: newsDict)
                        self.articles.append(newNews)
                    }}
                completion(self.articles)
        }
    }
    
}