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

open class GathrText: NSObject {
    
    var text:[Text] = [Text]()
    
    //Create a singleton
    open static let sharedInstance = GathrText()
    override init() {
        super.init()
        self.getAllTexts({ (texts) in
            self.text = texts!
        })
    }
    open func getAllTexts(_ completion: @escaping ([Text]?) -> Void) {
        let token = "\(GathrConfiguration.sharedInstance.TOKEN()!)"
        let header:HTTPHeaders = ["X-API-KEY":token]
        Alamofire.request(
            "\(GathrConfiguration.sharedInstance.BASE_URL()!)"+"texts/token/"+"\(GathrConfiguration.sharedInstance.PLAYMEAPPTOKEN()!)",headers:header)
            .validate()
            .responseJSON { (response) -> Void in
                self.text = [Text]()
                let data = JSON(response.result.value!)
                if let photoItems = data["text"].array{
                    for photoData in photoItems {
                        
                        let photoDict = photoData.dictionaryObject! as NSDictionary
                        let newPhoto = Text(data: photoDict)
                        self.text.append(newPhoto)
                    }}
                completion(self.text)
        }
    }
    
}
