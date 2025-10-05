//
//  Video.swift
//  PlayMe
//
//  Created by Richard Robinson on 9/3/16.
//  Copyright © 2016 WEBDMG. All rights reserved.
//

import Foundation

/// Gathr Video object
open class Video{
    //MARK: - Properties
    /// Video id assigned by Gathr
    public var sidvid:String = String()
    /// TItile of video. Set by the user.
    public var title:String = String()
    /// URL to youtube video.
    public var video:String = String()
    /// URL to video uploaded into the Gathr System.
    public var videoM:String = String()
    /// URL to poster image for video that was uploaded bu the user.
    public var image:String = String()
    /// Can only be Youtube or uploaded.
    public var type:String = String()
    /// Details or description for video content.
    public var details:String = String()
    public var category:String = String()
    
    //MARK: - Init method
    /// Init to create Video object
    /// - Parameter data: json data set to a dictionary
    public init(data: NSDictionary){
        if data["sidvid"] != nil {
            self.sidvid = String(data["sidvid"] as! String)
        }
        if data["title"] != nil {
            self.title = String(data["title"] as! String)
        }
        if data["video"] != nil {
            self.video = String(data["video"] as! String)
        }
        if data["videoM"] != nil{
            self.videoM = String(data["videoM"] as! String)
        }
        if data["image"] != nil {
            self.image = String(data["image"] as! String)
        }
        if data["type"] != nil {
            self.type = String(data["type"] as! String)
        }
        if data["details"] != nil {
            self.details = String(data["details"] as! String)
        }
        if data["category"] != nil {
            self.category = String(data["category"] as! String)
        }
        
    }
    
    /// If data is already a dictionary and you need to convert it to an Video object
    /// - Parameter dictionary: NSDictionary data to be passed in.
    public init(dictionary: NSDictionary){
        if dictionary.value(forKey: "sidvid") != nil {
            self.sidvid = dictionary.value(forKey: "sidvid") as! String
        }
        if dictionary.value(forKey: "title") != nil {
            self.title = dictionary.value(forKey: "title") as! String
        }
        if dictionary.value(forKey: "video") != nil {
            self.video = dictionary.value(forKey: "video") as! String
        }
        if dictionary.value(forKey: "videoM") != nil{
            self.videoM = dictionary.value(forKey: "videoM") as! String
        }
        if dictionary.value(forKey: "image") != nil {
            self.image = dictionary.value(forKey: "image") as! String
        }
        if dictionary.value(forKey: "type") != nil {
            self.type = dictionary.value(forKey: "type") as! String
        }
        if dictionary.value(forKey: "details") != nil {
            self.details = dictionary.value(forKey: "details") as! String
        }
        if dictionary.value(forKey: "category") != nil {
            self.category = dictionary.value(forKey: "category") as! String
        }
    }
    
    //MARK: - To method
    /// Convert Object to Dictionary
    open func toDictionary() -> NSDictionary {
        let videoDictionary = [
            "sidvid":self.sidvid,
            "title":self.title,
            "videoM":self.videoM,
            "image":self.image,
            "type":self.type,
            "details":self.details,
            "category":self.category
        ]
        return videoDictionary as NSDictionary
    }
}
