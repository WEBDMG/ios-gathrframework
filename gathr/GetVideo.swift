//
//  GetVideo.swift
//  PlayMe
//
//  Created by Richard Robinson on 9/3/16.
//  Copyright © 2016 WEBDMG. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

open class GetVideo: NSObject{

    var video:[Video] = [Video]()
    
    //Create a singleton
    open static let sharedInstance: GetVideo = {
        let instance = GetVideo()
        // setup code
        return instance
    }()
    
    open func getAllVideos(_ completion: @escaping ([Video]?) -> Void) {
        var config: NSDictionary?
        
        if let path = Bundle.main.path(forResource: "PlayMe", ofType: "plist") {
            config = NSDictionary(contentsOfFile: path)
        }
        if let dict = config {
            let token = "\(dict.value(forKey: "TOKEN")!)"
            let header = ["X-API-KEY":token]
            Alamofire.request("\(dict.value(forKey: "BASE_URL")!)"+"videos/token/"+"\(dict.value(forKey: "PLAYMEAPPTOKEN")!)",headers:header)
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
    
}
