//
//  GetText.swift
//  PlayMe
//
//  Created by Richard Robinson on 9/5/16.
//  Copyright © 2016 WEBDMG. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

open class GetText: NSObject {
    
    var text:[Text] = [Text]()
    
    //Create a singleton
    open static let sharedInstance: GetText = {
        let instance = GetText()
        // setup code
        return instance
    }()
    
    open func getAllTexts(_ completion: @escaping ([Text]?) -> Void) {
        var config: NSDictionary?
        
        if let path = Bundle.main.path(forResource: "PlayMe", ofType: "plist") {
            config = NSDictionary(contentsOfFile: path)
        }
        if let dict = config {
            let token = "\(dict.value(forKey: "TOKEN")!)"
            let header = ["X-API-KEY":token]
            Alamofire.request(
                "\(dict.value(forKey: "BASE_URL")!)"+"texts/token/"+"\(dict.value(forKey: "PLAYMEAPPTOKEN")!)",headers:header)
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
    
}
