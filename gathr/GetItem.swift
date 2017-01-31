//
//  GetItem.swift
//  PlayMe
//
//  Created by Richard Robinson on 9/3/16.
//  Copyright © 2016 WEBDMG. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

open class GetItem:NSObject{
    
    var item:[Item] = [Item]()
    
    //Create a singleton
    open static let sharedInstance: GetItem = {
        let instance = GetItem()
        // setup code
        return instance
    }()
    
    
    open func getAllItems(_ completion: @escaping ([Item]?) -> Void) {
        var config: NSDictionary?
        
        if let path = Bundle.main.path(forResource: "PlayMe", ofType: "plist") {
            config = NSDictionary(contentsOfFile: path)
        }
        if let dict = config {
            let token = "\(dict.value(forKey: "TOKEN")!)"
            let header = ["X-API-KEY":token]
            let url =   "\(dict.value(forKey: "BASE_URL")!)" + "items/token/" + "\(dict.value(forKey: "PLAYMEAPPTOKEN")!)"
            Alamofire.request(url,header:header)
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
}
