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

open class GetArticles : NSObject{
    var articles:[Articles] = [Articles]()
    
    open static let sharedInstance: GetArticles = {
        let instance = GetArticles()
        // setup code
        return instance
    }()

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
