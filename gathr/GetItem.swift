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

public class GetItem:NSObject{
   public var item:[Item] = [Item]()
    
    //Create a singleton
    class var sharedInstance: GetItem {
        struct Static {
            static var instance: GetItem?
            static var token: dispatch_once_t = 0
        }
        
        dispatch_once(&Static.token) {
            Static.instance = GetItem()
        }
        
        return Static.instance!
    }
    public func getAllItems(completion: ([Item]?) -> Void) {
        var config: NSDictionary?
        
        if let path = NSBundle.mainBundle().pathForResource("PlayMe", ofType: "plist") {
            config = NSDictionary(contentsOfFile: path)
        }
        if let dict = config {
            Alamofire.request(
                .GET,
                "\(dict.valueForKey("BASE_URL")!)"+"items/token/"+"\(dict.valueForKey("PLAYMEAPPTOKEN")!)",
                parameters: nil,
                encoding: .URL)
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
