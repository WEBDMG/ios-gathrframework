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

open class GetAudio : NSObject{
    
    var audio:[Audio] = [Audio]()
    
    open static let sharedInstance: GetAudio = {
        let instance = GetAudio()
        // setup code
        return instance
    }()
    
    open func getAllSongs(_ completion: @escaping ([Audio]?) -> Void) {
        var config: NSDictionary?
        
        if let path = Bundle.main.path(forResource: "PlayMe", ofType: "plist") {
            config = NSDictionary(contentsOfFile: path)
        }
        if let dict = config {
            let token = "\(dict.value(forKey: "TOKEN")!)"
            let header = ["X-API-KEY":token]
            Alamofire.request("\(dict.value(forKey: "BASE_URL")!)"+"songs/token/"+"\(dict.value(forKey: "PLAYMEAPPTOKEN")!)",headers:header)
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

