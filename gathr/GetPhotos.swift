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

open class GetPhotos : NSObject{

    var photos:[Photo] = [Photo]()
    
    //Create a singleton
    open static let sharedInstance: GetPhotos = {
        let instance = GetPhotos()
        // setup code
        return instance
    }()
    
    open func getAllPhotos(_ completion: @escaping ([Photo]?) -> Void) {
        var config: NSDictionary?
        
        if let path = Bundle.main.path(forResource: "PlayMe", ofType: "plist") {
            config = NSDictionary(contentsOfFile: path)
        }
        if let dict = config {
            let token = "\(dict.value(forKey: "TOKEN")!)"
            let header = ["X-API-KEY":token]
            Alamofire.request("\(dict.value(forKey: "BASE_URL")!)"+"photos/token/"+"\(dict.value(forKey: "PLAYMEAPPTOKEN")!)",headers:header)
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
