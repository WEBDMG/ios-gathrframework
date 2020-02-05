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

/// Creates array of Gathr Articles Objects
open class GathrArticles : NSObject{
    
    /// Gathr Article Objects array
    public var articles:[Articles] = [Articles]()
    
    /// Reference to Gathr Config object for base urls.
    var config:Config!
    
    /// Sets class as a singleton
    public static let sharedInstance = GathrArticles()
    
    //MARK: - Init method
    /// Init method
    public override init() {
        super.init()
        GathrConfig.sharedInstance.getConfigApi({ (config) in
            self.config = config
            
            self.getAllArticles(self.config.blogurl + "/wp-json/posts?filter[posts_per_page]=5&filter[order]=DESC", completion: { (article) in
                self.articles = article!
            })
        })
    }
    
    /// Gets all articles from the provided Wordpress URL.
    /// - Parameters:
    ///   - blogURL: URL to WP Blog. Base url to blog should be set in the config object pulled from Gathr.
    ///   - completion: returns array of article objects.
    open func getAllArticles(_ blogURL:String, completion: @escaping ([Articles]?) -> Void) {
        Alamofire.request(blogURL)
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
                GathrNotifications().postNotification(name: "GathrArticlesLoaded")
                completion(self.articles)
        }
    }
    
}
