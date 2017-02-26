//
//  GathrNews.swift
//  WEBDMG
//
//  Created by Richard Robinson on 6/6/16.
//  Copyright © 2016 WEBDMG. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

open class GathrArticles : NSObject{
    var articles:[Articles] = [Articles]()
    var config:Config!
    
    open static let sharedInstance = GathrArticles()
    
    override init() {
        super.init()
        GathrConfig.sharedInstance.getConfigApi({ (config) in
            self.config = config
            
            self.getAllArticles(self.config.blogurl, completion: { (article) in
                self.articles = article!
            })
        })
    }
    
    open func getAllArticles(_ blogURL:String, completion: @escaping ([Articles]?) -> Void) {
        Alamofire.request(blogURL + "/wp-json/posts?filter[posts_per_page]=13&filter[order]=DESC")
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
