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

open class GathrItem:NSObject{
    
    var item:[Item] = [Item]()
    
    //Create a singleton
    open static let sharedInstance = GathrItem()
    
    override init() {
        super.init()
        self.getAllItems({ (items) in
            self.item = items!
        })
    }
    
    open func getAllItems(_ completion: @escaping ([Item]?) -> Void) {
        let token = "\(GathrConfiguration.sharedInstance.TOKEN()!)"
        let headers:HTTPHeaders = ["X-API-KEY":token]
        let url =   "\(GathrConfiguration.sharedInstance.BASE_URL()!)" + "items/token/" + "\(GathrConfiguration.sharedInstance.PLAYMEAPPTOKEN()!)"
        Alamofire.request(url, headers: headers)
            .validate()
            .responseJSON { (response) -> Void in
                self.item = [Item]()
                let data = JSON(response.result.value!)
                if let photoItems = data["items"].array{
                    for photoData in photoItems {
                        
                        let photoDict = photoData.dictionaryObject! as NSDictionary
                        let newPhoto = Item(data: photoDict)
                        self.item.append(newPhoto)
                    }}
                completion(self.item)
                
        }
    }
}
