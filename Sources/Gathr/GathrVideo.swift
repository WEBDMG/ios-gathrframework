//
//  GathrVideo.swift
//  PlayMe
//
//  Created by Richard Robinson on 9/3/16.
//  Copyright © 2016 WEBDMG. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

/// Get Gathr Videos from API
open class GathrVideo: NSObject{
    
    /// Array of Gathr Video objects
    public var video:[Video] = [Video]()
    
    /// Create a singleton
    public static let sharedInstance = GathrVideo()
    
    /// init method
    public override init() {
        super.init()
        self.getAllVideos({ (videos) in
            self.video = videos!
        })
    }
    
    /// Get all videos for a given token and playme app.
    /// - Parameter completion: returns array of video objects.
    open func getAllVideos(_ completion: @escaping ([Video]?) -> Void) {
        let apikey = "\(GathrConfiguration.sharedInstance.APIKEY()!)"
        let header:HTTPHeaders = ["X-API-KEY":apikey]
        Alamofire.request("\(GathrConfiguration.sharedInstance.BASE_URL()!)"+"video/videos/token/"+"\(GathrConfiguration.sharedInstance.PLAYMEAPPTOKEN()!)",headers:header)
            .validate()
            .responseJSON { (response) -> Void in
                self.video = [Video]()
                guard let response = response.result.value else { return }
                let data = JSON(response)
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
    
    open func getAllVideosByCategory(category:String, completion: @escaping ([Video]?) -> Void) {
        let apikey = "\(GathrConfiguration.sharedInstance.APIKEY()!)"
        let header:HTTPHeaders = ["X-API-KEY":apikey]
        var string = "\(GathrConfiguration.sharedInstance.BASE_URL()!)video/find/category/\(category)/token/\(GathrConfiguration.sharedInstance.PLAYMEAPPTOKEN()!)"
        //print(string)
        Alamofire.request(string,headers:header)
            .validate()
            .responseJSON { (response) -> Void in
                self.video = [Video]()
                guard let response = response.result.value else { return }
                let data = JSON(response)
                if let photoItems = data.array{
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
