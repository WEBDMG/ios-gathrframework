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

/// Creates array of Gathr Audio objects
open class GathrAudio : NSObject{
    
    /// Gathr Audio Objects Array
    public var audio:[Audio] = [Audio]()
    
    /// Creates a singleton
    public static let sharedInstance = GathrAudio()
    
    //MARK: - Init method
    /// Init method
    public override init() {
        super.init()
        self.getAllSongs({ (tracks) in
            self.audio = tracks!
        })
    }
    
    /// gets all audio objects from Gathr Api that have an active status flag set to true.
    /// - Parameter completion: Return optional array of audio objects.
    open func getAllSongs(_ completion: @escaping ([Audio]?) -> Void) {
        let apikey = "\(GathrConfiguration.sharedInstance.APIKEY()!)"
        let header:HTTPHeaders = ["X-API-KEY":apikey]
        Alamofire.request("\(GathrConfiguration.sharedInstance.BASE_URL()!)"+"audio/songs/token/"+"\(GathrConfiguration.sharedInstance.PLAYMEAPPTOKEN()!)",headers:header)
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
                GathrNotifications().postNotification(name: "GathrAudioLoaded")
                completion(self.audio)
        }
    }
    
    open func getAllAudioByCategory(category:String, completion: @escaping ([Audio]?) -> Void) {
        let apikey = "\(GathrConfiguration.sharedInstance.APIKEY()!)"
        let header:HTTPHeaders = ["X-API-KEY":apikey]
        var string = "\(GathrConfiguration.sharedInstance.BASE_URL()!)audio/find/category/\(category)/token/\(GathrConfiguration.sharedInstance.PLAYMEAPPTOKEN()!)"
        Alamofire.request(string,headers:header)
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
                GathrNotifications().postNotification(name: "GathrVideoLoaded")
                completion(self.audio)
        }
    }
    
}

