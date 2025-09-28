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

/// Creates array of Gathr Photos Objects
open class GathrPhotos : NSObject{
    
    /// Gathr Photos object
    public var photos:[Photo] = [Photo]()
    
    ///Create a singleton
    public static let sharedInstance = GathrPhotos()
    
    //MARK: - Init Method
    /// init method
    public override init() {
        super.init()
        self.getAllPhotos({ (photos) in
            self.photos = photos!
        })
    }
    
    /// Gets all photo objects from images uploaded by the user that have active set to true.
    /// - Parameter completion: Returns array of photo objects.
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
                GathrNotifications().postNotification(name: "GathrPhotosLoaded")
                completion(self.photos)
                
        }
    }
    
    open func getAllPhotosByCategory(category:String, completion: @escaping ([Photo]?) -> Void) {
        let apikey = "\(GathrConfiguration.sharedInstance.APIKEY()!)"
        let header:HTTPHeaders = ["X-API-KEY":apikey]
        var string = "\(GathrConfiguration.sharedInstance.BASE_URL()!)photo/find/category/\(category)/token/\(GathrConfiguration.sharedInstance.PLAYMEAPPTOKEN()!)"
        Alamofire.request(string,headers:header)
            .validate()
            .responseJSON { (response) -> Void in
                self.photos = [Photo]()
                let data = JSON(response.result.value!)
                if let photoItems = data.array{
                    for photoData in photoItems {
                        
                        let photoDict = photoData.dictionaryObject! as NSDictionary
                        let newPhoto = Photo(data: photoDict)
                        self.photos.append(newPhoto)
                    }}
                GathrNotifications().postNotification(name: "GathrVideoLoaded")
                completion(self.photos)
        }
    }
    
}
