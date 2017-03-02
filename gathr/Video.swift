//
//  Video.swift
//  PlayMe
//
//  Created by Richard Robinson on 9/3/16.
//  Copyright © 2016 WEBDMG. All rights reserved.
//

import Foundation

open class Video{
    public var sidvid:String = String()
    public var title:String = String()
    public var video:String = String()
    public var videoM:String = String()
    public var image:String = String()
    public var type:String = String()
    
    
    init(data: NSDictionary){
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
    
    init(dictionary: NSDictionary){
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
    }
    
    open func toDictionary() -> NSDictionary {
        let videoDictionary = [
            "sidvid":self.sidvid,
            "title":self.title,
            "videoM":self.videoM,
            "image":self.image,
            "type":self.type
        ]
        return videoDictionary as NSDictionary
    }
}
