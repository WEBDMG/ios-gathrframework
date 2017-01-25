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

class GetText: NSObject {
    var text:[Text] = [Text]()
    
    //Create a singleton
    class var sharedInstance: GetText {
        struct Static {
            static var instance: GetText?
            static var token: dispatch_once_t = 0
        }
        
        dispatch_once(&Static.token) {
            Static.instance = GetText()
        }
        
        return Static.instance!
    }
    func getAllTexts(completion: ([Text]?) -> Void) {
        var config: NSDictionary?
        
        if let path = NSBundle.mainBundle().pathForResource("PlayMe", ofType: "plist") {
            config = NSDictionary(contentsOfFile: path)
        }
        if let dict = config {
            Alamofire.request(
                .GET,
                "\(dict.valueForKey("BASE_URL")!)"+"texts/token/"+"\(dict.valueForKey("PLAYMEAPPTOKEN")!)",
                parameters: nil,
                encoding: .URL)
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