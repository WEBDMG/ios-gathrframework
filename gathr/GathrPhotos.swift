//
//  GathrPhotos.swift
//  PlayMe
//
//  Created by Richard Robinson on 9/1/16.
//  Copyright © 2016 WEBDMG. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

open class GathrPhotos : NSObject{
    
    var photos:[Photo] = [Photo]()
    
    //Create a singleton
    open static let sharedInstance = GathrPhotos()
    
    override init() {
        super.init()
        self.getAllPhotos({ (photos) in
            self.photos = photos!
        })
    }
    
    open func getAllPhotos(_ completion: @escaping ([Photo]?) -> Void) {
        let token = "\(GathrConfiguration.sharedInstance.TOKEN()!)"
        let header:HTTPHeaders = ["X-API-KEY":token]
        Alamofire.request("\(GathrConfiguration.sharedInstance.BASE_URL()!)"+"photos/token/"+"\(GathrConfiguration.sharedInstance.PLAYMEAPPTOKEN()!)",headers:header)
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
