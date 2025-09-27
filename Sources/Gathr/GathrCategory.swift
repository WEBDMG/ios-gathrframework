//
//  GathrCategory.swift
//  Gathr
//
//  Created by Richard Robinson on 9/27/25.
//  Copyright © 2025 WEBDMG. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

/// Get Gathr Videos from API
open class GathrCategory: NSObject{
    
    /// Array of Gathr Video objects
    public var video:[Video] = [Video]()
    
    open func getAllVideosByCategory(category:String, completion: @escaping ([Video]?) -> Void) {
        let apikey = "\(GathrConfiguration.sharedInstance.APIKEY()!)"
        let header:HTTPHeaders = ["X-API-KEY":apikey]
        Alamofire.request("\(GathrConfiguration.sharedInstance.BASE_URL()!)"+"video/find/category/\(category)/token/"+"\(GathrConfiguration.sharedInstance.PLAYMEAPPTOKEN()!)",headers:header)
            .validate()
            .responseJSON { (response) -> Void in
                self.video = [Video]()
                let data = JSON(response.result.value!)
                if let photoItems = data["videos"].array{
                    for photoData in photoItems {
                        
                        let photoDict = photoData.dictionaryObject! as NSDictionary
                        let newPhoto = Video(data: photoDict)
                        self.video.append(newPhoto)
                    }}
                GathrNotifications().postNotification(name: "GathrVideoLoaded")
                completion(self.video)
        }
    }
    
}
