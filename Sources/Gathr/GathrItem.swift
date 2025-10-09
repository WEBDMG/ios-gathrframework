//
//  GathrItem.swift
//  PlayMe
//
//  Created by Richard Robinson on 9/3/16.
//  Copyright © 2016 WEBDMG. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

/// Gathr Items Objects Arry
open class GathrItem:NSObject{
     
    /// Gathr Items Objects array
    public var item:[Item] = [Item]()
    
    ///Create a singleton
    public static let sharedInstance = GathrItem()
   
    //MARK: - Init Method
    
    /// init method
    public override init() {
        super.init()
        self.getAllItems({ (items) in
            self.item = items!
        })
    }
    
    /// Gets all items from the Gathr API that is set to active
    /// - Parameter completion: returns array of Gathr Item Objects
    open func getAllItems(_ completion: @escaping ([Item]?) -> Void) {
        let apikey = "\(GathrConfiguration.sharedInstance.APIKEY()!)"
        let header:HTTPHeaders = ["X-API-KEY":apikey]
        let url =   "\(GathrConfiguration.sharedInstance.BASE_URL()!)" + "item/items/token/" + "\(GathrConfiguration.sharedInstance.PLAYMEAPPTOKEN()!)"
        Alamofire.request(url, headers: header)
            .validate()
            .responseJSON { (response) -> Void in
                self.item = [Item]()
                guard let response = response.result.value else { return }
                let data = JSON(response)
                if let photoItems = data["items"].array{
                    for photoData in photoItems {
                        
                        let photoDict = photoData.dictionaryObject! as NSDictionary
                        let newPhoto = Item(data: photoDict)
                        self.item.append(newPhoto)
                    }}
                GathrNotifications().postNotification(name: "GathrItemsLoaded")
                completion(self.item)
                
        }
    }
}
