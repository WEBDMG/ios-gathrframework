//
//  GetAudio.swift
//  PlayMe
//
//  Created by Richard Robinson on 9/2/16.
//  Copyright © 2016 WEBDMG. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

public class GetAudio : NSObject{
    public var audio:[Audio] = [Audio]()
    
    //Create a singleton
    public class var sharedInstance: GetAudio {
        struct Static {
            static var instance: GetAudio?
            static var token: dispatch_once_t = 0
        }
        
        dispatch_once(&Static.token) {
            Static.instance = GetAudio()
        }
        
        return Static.instance!
    }
    
    /// Get audio urls and meta data.
    ///
    /// - Parameter completion: Array of dictionaries.
    public func getAllSongs(completion: ([Audio]?) -> Void) {
        var config: NSDictionary?
        
        if let path = NSBundle.mainBundle().pathForResource("PlayMe", ofType: "plist") {
            config = NSDictionary(contentsOfFile: path)
        }
        if let dict = config {
            let token = "\(dict.valueForKey("TOKEN")!)"
            let header = ["X-API-KEY":token]
            Alamofire.request(
                .GET,
                "\(dict.valueForKey("BASE_URL")!)"+"songs/token/"+"\(dict.valueForKey("PLAYMEAPPTOKEN")!)",
                parameters: nil,
                encoding: .URL,
                headers:header)
                .validate()
                .responseJSON { (response) -> Void in
                    self.audio = [Audio]()
                    let data = JSON(response.result.value!)
                    if let photoItems = data["songs"].array{
                        for photoData in photoItems {
                            
                            let photoDict = photoData.dictionaryObject! as NSDictionary
                            let newPhoto = Audio(data: photoDict)
                            self.audio.append(newPhoto)
                        }}
                    completion(self.audio)
            }
        }
    }
    
}

