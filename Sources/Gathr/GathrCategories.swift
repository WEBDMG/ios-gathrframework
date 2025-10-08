//
//  GathrCategory.swift
//  Gathr
//
//  Created by Richard Robinson on 9/27/25.
//  Copyright © 2025 WEBDMG. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

/// Get Gathr Videos from API
open class GathrCategories: NSObject{
    
    /// Array of Gathr Video objects
    public var gcategories:[GathrCategory] = [GathrCategory]()
    
    public var gcat:[GathrCategory] = [GathrCategory]()
    /// Create a singleton
    public static let sharedInstance = GathrCategories()
    
    public override init() {
        super.init()
        self.getAllCategory({ (events) in
            self.gcategories = events!
        })
    }
    
    
    open func getAllCategory(_ completion: @escaping ([GathrCategory]?) -> Void) {
        let apikey = "\(GathrConfiguration.sharedInstance.APIKEY()!)"
        let header:HTTPHeaders = ["X-API-KEY":apikey]
        let string = "\(GathrConfiguration.sharedInstance.BASE_URL()!)login/categories/token/\(GathrConfiguration.sharedInstance.TOKEN()!)/apptoken/\(GathrConfiguration.sharedInstance.PLAYMEAPPTOKEN()!)"
        //print(string)
        Alamofire.request(string,headers:header)
            .validate()
            .responseJSON { (response) -> Void in
                self.gcategories = [GathrCategory]()
                let data = JSON(response.result.value!)
                if let photoItems = data.array{
                    for photoData in photoItems {
                        
                        let photoDict = photoData.dictionaryObject! as NSDictionary
                        let newPhoto = GathrCategory(data: photoDict)
                        self.gcategories.append(newPhoto)
                    }}
                GathrNotifications().postNotification(name: "GathrVideoLoaded")
                //print(response.result.value!)
                completion(self.gcategories)
        }
    }

    open func getAllCategoryType(_ completion: @escaping ([GathrCategory]?) -> Void) {
        let apikey = "\(GathrConfiguration.sharedInstance.APIKEY()!)"
        let header:HTTPHeaders = ["X-API-KEY":apikey]
        let string = "\(GathrConfiguration.sharedInstance.BASE_URL()!)login/categories/token/\(GathrConfiguration.sharedInstance.TOKEN()!)/apptoken/\(GathrConfiguration.sharedInstance.PLAYMEAPPTOKEN()!)"
//        print(string)
        Alamofire.request(string,headers:header)
            .validate()
            .responseJSON { (response) -> Void in
                self.gcategories = [GathrCategory]()
                let data = JSON(response.result.value!)
                if let photoItems = data.array{
                    for photoData in photoItems {
                        
                        let photoDict = photoData.dictionaryObject! as NSDictionary
                        let newPhoto = GathrCategory(data: photoDict)
                        if newPhoto.name != "featured"{
                            let cleanedName = newPhoto.name?
                                .replacingOccurrences(of: "_flare", with: "")
                                .replacingOccurrences(of: "_icon", with: "")
                                .trimmingCharacters(in: .whitespacesAndNewlines)
                                .removingPercentEncoding ?? newPhoto.name
                            newPhoto.name = cleanedName
                            self.gcategories.append(newPhoto)
                            let uniquePhotos = Array(Dictionary(grouping: self.gcategories, by: \.name).values.compactMap(\.first))
                            self.gcat = uniquePhotos
                        }
                    }}
                GathrNotifications().postNotification(name: "GathrVideoLoaded")
//                print(response.result.value!)
                completion(self.gcat)
        }
    }
}

