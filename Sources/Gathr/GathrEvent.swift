//
//  GathrEvent.swift
//  PlayMe
//
//  Created by Richard Robinson on 9/3/16.
//  Copyright © 2016 WEBDMG. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

open class GathrEvent : NSObject{
    
    public var event:[Event] = [Event]()
    
    //Create a singleton
    public static let sharedInstance = GathrEvent()
    
    override init() {
        super.init()
        self.getAllEvents({ (events) in
            self.event = events!
        })
    }
    
    open func getAllEvents(_ completion: @escaping ([Event]?) -> Void) {
        let apikey = "\(GathrConfiguration.sharedInstance.APIKEY()!)"
        let header:HTTPHeaders = ["X-API-KEY":apikey]
        let url =  "\(GathrConfiguration.sharedInstance.BASE_URL()!)" + "event/events/token/" + "\(GathrConfiguration.sharedInstance.PLAYMEAPPTOKEN()!)"
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
