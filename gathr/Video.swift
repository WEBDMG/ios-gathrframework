//
//  Video.swift
//  PlayMe
//
//  Created by Richard Robinson on 9/3/16.
//  Copyright © 2016 WEBDMG. All rights reserved.
//

import Foundation

/// Video object.
public class Video{
    public var sidvid:String = String()
    public var title:String = String()
    public var video:String = String()
    public var videoM:String = String()
    public var image:String = String()
    public var type:String = String()
    
    
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
        
    }
    
    public init(dictionary: NSDictionary){
        if dictionary.valueForKey("sidvid") != nil {
            self.sidvid = dictionary.valueForKey("sidvid") as! String
        }
        if dictionary.valueForKey("title") != nil {
            self.title = dictionary.valueForKey("title") as! String
        }
        if dictionary.valueForKey("video") != nil {
            self.video = dictionary.valueForKey("video") as! String
        }
        if dictionary.valueForKey("videoM") != nil{
            self.videoM = dictionary.valueForKey("videoM") as! String
        }
        if dictionary.valueForKey("image") != nil {
            self.image = dictionary.valueForKey("image") as! String
        }
        if dictionary.valueForKey("type") != nil {
            self.type = dictionary.valueForKey("type") as! String
        }
    }
    
    func toDictionary() -> NSDictionary {
        let videoDictionary = [
            "sidvid":self.sidvid,
            "title":self.title,
            "videoM":self.videoM,
            "image":self.image,
            "type":self.type
        ]
        return videoDictionary
    }
}
