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

class GetEvent : NSObject{
    var event:[Event] = [Event]()
    
    //Create a singleton
    class var sharedInstance: GetEvent {
        struct Static {
            static var instance: GetEvent?
            static var token: dispatch_once_t = 0
        }
        
        dispatch_once(&Static.token) {
            Static.instance = GetEvent()
        }
        
        return Static.instance!
    }
    func getAllEvents(completion: ([Event]?) -> Void) {
        var config: NSDictionary?
        
        if let path = NSBundle.mainBundle().pathForResource("PlayMe", ofType: "plist") {
            config = NSDictionary(contentsOfFile: path)
        }
        if let dict = config {
            Alamofire.request(
                .GET,
                "\(dict.valueForKey("BASE_URL")!)"+"events/token/"+"\(dict.valueForKey("PLAYMEAPPTOKEN")!)",
                parameters: nil,
                encoding: .URL)
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