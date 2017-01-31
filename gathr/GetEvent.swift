//
//  GetEvent.swift
//  PlayMe
//
//  Created by Richard Robinson on 9/3/16.
//  Copyright © 2016 WEBDMG. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

open class GetEvent : NSObject{
    
    var event:[Event] = [Event]()
    
    //Create a singleton
    open static let sharedInstance: GetEvent = {
        let instance = GetEvent()
        // setup code
        return instance
    }()
    
    open func getAllEvents(_ completion: @escaping ([Event]?) -> Void) {
        var config: NSDictionary?
        
        if let path = Bundle.main.path(forResource: "PlayMe", ofType: "plist") {
            config = NSDictionary(contentsOfFile: path)
        }
        if let dict = config {
            let token = "\(dict.value(forKey: "TOKEN")!)"
            let header = ["X-API-KEY":token]
            let url =  "\(dict.value(forKey: "BASE_URL")!)" + "events/token/" + "\(dict.value(forKey: "PLAYMEAPPTOKEN")!)"
            Alamofire.request(url,headers:header)
                .validate()
                .responseJSON { (response) -> Void in
                    self.event = [Event]()
                    let data = JSON(response.result.value!)
                    if let photoItems = data["events"].array{
                        for photoData in photoItems {
                            
                            let photoDict = photoData.dictionaryObject! as NSDictionary
                            let newPhoto = Event(data: photoDict)
                            self.event.append(newPhoto)
                        }}
                    completion(self.event)
            }
        }
    }
}
