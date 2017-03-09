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

open class GathrVideo: NSObject{
    
    var video:[Video] = [Video]()
    
    //Create a singleton
    open static let sharedInstance = GathrVideo()
    
    override init() {
        super.init()
        self.getAllVideos({ (videos) in
            self.video = videos!
        })
    }
    
    open func getAllVideos(_ completion: @escaping ([Video]?) -> Void) {
        let apikey = "\(GathrConfiguration.sharedInstance.APIKEY()!)"
        let header:HTTPHeaders = ["X-API-KEY":apikey]
        Alamofire.request("\(GathrConfiguration.sharedInstance.BASE_URL()!)"+"video/videos/token/"+"\(GathrConfiguration.sharedInstance.PLAYMEAPPTOKEN()!)",headers:header)
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
                completion(self.video)
        }
    }
    
}
