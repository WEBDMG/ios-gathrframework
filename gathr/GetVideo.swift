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

public class GetVideo: NSObject{
    public var video:[Video] = [Video]()
    
    //Create a singleton
    class var sharedInstance: GetVideo {
        struct Static {
            static var instance: GetVideo?
            static var token: dispatch_once_t = 0
        }
        
        dispatch_once(&Static.token) {
            Static.instance = GetVideo()
        }
        
        return Static.instance!
    }
    public func getAllVideos(completion: ([Video]?) -> Void) {
        var config: NSDictionary?
        
        if let path = NSBundle.mainBundle().pathForResource("PlayMe", ofType: "plist") {
            config = NSDictionary(contentsOfFile: path)
        }
        if let dict = config {
            Alamofire.request(
                .GET,
                "\(dict.valueForKey("BASE_URL")!)"+"videos/token/"+"\(dict.valueForKey("PLAYMEAPPTOKEN")!)",
                parameters: nil,
                encoding: .URL)
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
