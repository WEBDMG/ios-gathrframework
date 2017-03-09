//
//  GathrAudio.swift
//  PlayMe
//
//  Created by Richard Robinson on 9/2/16.
//  Copyright © 2016 WEBDMG. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

open class GathrAudio : NSObject{
    
    var audio:[Audio] = [Audio]()
    
    open static let sharedInstance = GathrAudio()
    
    override init() {
        super.init()
        self.getAllSongs({ (tracks) in
            self.audio = tracks!
        })
    }
    
    open func getAllSongs(_ completion: @escaping ([Audio]?) -> Void) {
        let apikey = "\(GathrConfiguration.sharedInstance.APIKEY()!)"
        let header:HTTPHeaders = ["X-API-KEY":apikey]
        Alamofire.request("\(GathrConfiguration.sharedInstance.BASE_URL()!)"+"audio/songs/token/"+"\(GathrConfiguration.sharedInstance.TOKEN()!)",headers:header)
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

