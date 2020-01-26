//
//  Photo.swift
//  PlayMe
//
//  Created by Richard Robinson on 9/1/16.
//  Copyright © 2016 WEBDMG. All rights reserved.
//

import Foundation

/// Gathr Photo object
open class Photo {
    //MARK: - Properties
    /// String title of the Photo. Set by the user.
    public var title:String = String()
    /// URL to the photo. Set by Gathr during image upload.
    public var url:String = String()
    /// can be uploaded or instagram. Set by Gathr
    public var source:String = String()
    /// Active or inactive flag.
    public var active:Bool?
    
    //MARK: - Init method
    /// Init to create Photo object
    /// - Parameter data: json data set to a dictionary
    public init(data: NSDictionary){
        if data["title"] != nil {
            self.title = String(data["title"] as! String)
        }
        if data["url"] != nil {
            self.url = String(data["url"] as! String)
        }
        if data["source"] != nil {
            self.source = String(data["source"] as! String)
        }
        if data["active"] != nil {
            self.active = String(data["active"] as! String).boolValue
        }
    }
        
    /// If data is already a dictionary and you need to convert it to an Photo object
    /// - Parameter dictionary: NSDictionary data to be passed in.
    public init(dictionary: NSDictionary){
        if dictionary.value(forKey: "title") != nil {
            self.title = dictionary.value(forKey: "title") as! String
        }
        if dictionary.value(forKey: "url") != nil{
            self.url = dictionary.value(forKey: "url") as! String
        }
        if dictionary.value(forKey: "source") != nil{
            self.source = dictionary.value(forKey: "source") as! String
        }
        if dictionary.value(forKey: "active") != nil{
            let active = dictionary.value(forKey: "active") as! String
            self.active = active.boolValue
        }
    }
        

    //MARK: - To method
    /// Convert Object to Dictionary
    open func toDictionary() -> NSDictionary {
        let photosDictionary = [
            "title":self.title,
            "excerpt":self.url,
            "source":self.source,
            "active":self.active!
            ] as [String : Any]
        return photosDictionary as NSDictionary
    }
}
