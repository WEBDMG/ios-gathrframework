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

/// Creates array of Gathr Event Objects
open class GathrEvent : NSObject{
    
     /// Gathr Event Objects Array
    public var event:[Event] = [Event]()
    
    ///Create a singleton
    public static let sharedInstance = GathrEvent()
//MARK: - Init Method
    
    /// Init method
    public override init() {
        super.init()
        self.getAllEvents({ (events) in
            self.event = events!
        })
    }
    
    /// Gets all events from the Gathr API that is set to active and the date for the event is not in the past.
    /// - Parameter completion: returns array of Gathr Event Objects
    open func getAllEvents(_ completion: @escaping ([Event]?) -> Void) {
        let apikey = "\(GathrConfiguration.sharedInstance.APIKEY()!)"
        let header:HTTPHeaders = ["X-API-KEY":apikey]
        let url =  "\(GathrConfiguration.sharedInstance.BASE_URL()!)" + "event/events/token/" + "\(GathrConfiguration.sharedInstance.PLAYMEAPPTOKEN()!)"
        Alamofire.request(url,headers:header)
            .validate()
            .responseJSON { (response) -> Void in
                self.event = [Event]()
                guard let response = response.result.value else { return }
                let data = JSON(response)
                if let photoItems = data["events"].array{
                    for photoData in photoItems {
                        
                        let photoDict = photoData.dictionaryObject! as NSDictionary
                        let newPhoto = Event(data: photoDict)
                        self.event.append(newPhoto)
                    }}
                GathrNotifications().postNotification(name: "GathrEventsLoaded")
                completion(self.event)
                
        }
    }
}
