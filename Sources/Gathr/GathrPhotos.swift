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
    
    public var photos:[Photo] = [Photo]()
    
    //Create a singleton
    public static let sharedInstance = GathrPhotos()
    
    override init() {
        super.init()
        self.getAllPhotos({ (photos) in
            self.photos = photos!
        })
    }
    
    open func getAllPhotos(_ completion: @escaping ([Photo]?) -> Void) {
        let apikey = "\(GathrConfiguration.sharedInstance.APIKEY()!)"
        let header:HTTPHeaders = ["X-API-KEY":apikey]
        Alamofire.request("\(GathrConfiguration.sharedInstance.BASE_URL()!)"+"photo/photos/token/"+"\(GathrConfiguration.sharedInstance.PLAYMEAPPTOKEN()!)",headers:header)
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
