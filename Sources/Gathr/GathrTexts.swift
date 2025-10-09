//
//  GathrText.swift
//  PlayMe
//
//  Created by Richard Robinson on 9/5/16.
//  Copyright © 2016 WEBDMG. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

/// Creates array of Gathr Photos Objects
open class GathrTexts: NSObject {
    
    /// Gathr Photos object
    public var text:[GathrText] = [GathrText]()
    
    ///Create a singleton
    public static let sharedInstance = GathrTexts()
    
    //MARK: - Init Method
    /// init method
    public override init() {
        super.init()
        self.getAllTexts({ (texts) in
            self.text = texts!
        })
    }
    
    /// Get all text objects from the Gathr API that have the active flag set to true
    /// - Parameter completion: Returns array of Gathr Text objects.
    open func getAllTexts(_ completion: @escaping ([GathrText]?) -> Void) {
        let apikey = "\(GathrConfiguration.sharedInstance.APIKEY()!)"
        let header:HTTPHeaders = ["X-API-KEY":apikey]
        Alamofire.request(
            "\(GathrConfiguration.sharedInstance.BASE_URL()!)"+"text/texts/token/"+"\(GathrConfiguration.sharedInstance.PLAYMEAPPTOKEN()!)",headers:header)
            .validate()
            .responseJSON { (response) -> Void in
                self.text = [GathrText]()
                guard let response = response.result.value else { return }
                let data = JSON(response)
                if let photoItems = data["text"].array{
                    for photoData in photoItems {
                        
                        let photoDict = photoData.dictionaryObject! as NSDictionary
                        let newPhoto = GathrText(data: photoDict)
                        self.text.append(newPhoto)
                    }}
                GathrNotifications().postNotification(name: "GathrTextLoaded")
                completion(self.text)
        }
    }
    
    open func getAllTextByCategory(category:String, completion: @escaping ([GathrText]?) -> Void) {
        let apikey = "\(GathrConfiguration.sharedInstance.APIKEY()!)"
        let header:HTTPHeaders = ["X-API-KEY":apikey]
        var string = "\(GathrConfiguration.sharedInstance.BASE_URL()!)text/find/category/\(category)/token/\(GathrConfiguration.sharedInstance.PLAYMEAPPTOKEN()!)"
        Alamofire.request(string,headers:header)
            .validate()
            .responseJSON { (response) -> Void in
                self.text = [GathrText]()
                guard let response = response.result.value else { return }
                let data = JSON(response)
                if let photoItems = data.array{
                    for photoData in photoItems {
                        
                        let photoDict = photoData.dictionaryObject! as NSDictionary
                        let newPhoto = GathrText(data: photoDict)
                        self.text.append(newPhoto)
                    }}
                GathrNotifications().postNotification(name: "GathrTextLoaded")
                completion(self.text)
        }
    }
    
}
