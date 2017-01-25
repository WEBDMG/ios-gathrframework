//
//  GetPhotos.swift
//  PlayMe
//
//  Created by Richard Robinson on 9/1/16.
//  Copyright © 2016 WEBDMG. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class GetPhotos : NSObject{
    var photos:[Photo] = [Photo]()
    
    //Create a singleton
    class var sharedInstance: GetPhotos {
        struct Static {
            static var instance: GetPhotos?
            static var token: dispatch_once_t = 0
        }
        
        dispatch_once(&Static.token) {
            Static.instance = GetPhotos()
        }
        
        return Static.instance!
    }
    func getAllPhotos(completion: ([Photo]?) -> Void) {
        var config: NSDictionary?
        
        if let path = NSBundle.mainBundle().pathForResource("PlayMe", ofType: "plist") {
            config = NSDictionary(contentsOfFile: path)
        }
        if let dict = config {
        Alamofire.request(
            .GET,
           "\(dict.valueForKey("BASE_URL")!)"+"photos/token/"+"\(dict.valueForKey("PLAYMEAPPTOKEN")!)",
            parameters: nil,
            encoding: .URL)
            .validate()
            .responseJSON { (response) -> Void in
                self.photos = [Photo]()
                let data = JSON(response.result.value!)
                if let photoItems = data["photos"].array{
                    for photoData in photoItems {
                        
                        let photoDict = photoData.dictionaryObject! as NSDictionary
                        let newPhoto = Photo(data: photoDict)
                        self.photos.append(newPhoto)
                    }}
                completion(self.photos)
            }
        }
    }
    
}
