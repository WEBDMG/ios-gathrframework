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
    public static let sharedInstance = GathrItem()
    
    override init() {
        super.init()
        self.getAllItems({ (items) in
            self.item = items!
        })
    }
    
    open func getAllItems(_ completion: @escaping ([Item]?) -> Void) {
        let apikey = "\(GathrConfiguration.sharedInstance.APIKEY()!)"
        let header:HTTPHeaders = ["X-API-KEY":apikey]
        let url =   "\(GathrConfiguration.sharedInstance.BASE_URL()!)" + "item/items/token/" + "\(GathrConfiguration.sharedInstance.PLAYMEAPPTOKEN()!)"
        Alamofire.request(url, headers: header)
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
