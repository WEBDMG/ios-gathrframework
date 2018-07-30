//
//  Audio.swift
//  PlayMe
//
//  Created by Richard Robinson on 9/2/16.
//  Copyright © 2016 WEBDMG. All rights reserved.
//

import Foundation

open class Audio {
    public var sidid:String = String()
    public var title:String = String()
    public var songs:String = String()
    public var video:String = String()
    public var link:String = String()
    public var aboutTrack:String = String()
    public var writtenBy:String = String()
    public var source:String = String()
    public var artistName:String = String()
    public var facebook:String = String()
    public var twitter:String = String()
    public var image:String = String()
    
    init(data: NSDictionary){
        if data["sidid"] != nil {
            self.sidid = String(data["sidid"] as! String)
        }
        if data["title"] != nil {
            self.title = String(data["title"] as! String)
        }
        if data["image"] != nil {
            self.image = String(data["image"] as! String)
        }
        if data["songs"] != nil {
            self.songs = String(data["songs"] as! String)
        }
        if data["video"] != nil {
            self.video = String(data["video"] as! String)
        }
        if data["link"] != nil{
            self.link = String(data["link"] as! String)
        }
        if data["aboutTrack"] != nil {
            self.aboutTrack = String(data["aboutTrack"] as! String)
        }
        if data["writtenBy"] != nil {
            self.writtenBy = String(data["writtenBy"] as! String)
        }
        if data["source"] != nil {
            self.source = String(data["source"] as! String)
        }
        if data["artistName"] != nil {
            self.artistName = String(data["artistName"] as! String)
        }
        if data["facebook"] != nil{
            self.facebook = String(data["facebook"] as! String)
        }
        if data["twitter"] != nil{
            self.twitter = String(data["twitter"] as! String)
        }
        
    }
    
    init(dictionary: NSDictionary){
        if dictionary.value(forKey: "sidid") != nil {
            self.sidid = dictionary.value(forKey: "sidid") as! String
        }
        if dictionary.value(forKey: "title") != nil {
            self.title = dictionary.value(forKey: "title") as! String
        }
        if dictionary.value(forKey: "songs") != nil {
            self.songs = dictionary.value(forKey: "songs") as! String
        }
        if dictionary.value(forKey: "video") != nil {
            self.video = dictionary.value(forKey: "video") as! String
        }
        if dictionary.value(forKey: "link") != nil{
            self.link = dictionary.value(forKey: "link") as! String
        }
        if dictionary.value(forKey: "aboutTrack") != nil {
            self.aboutTrack = dictionary.value(forKey: "aboutTrack") as! String
        }
        if dictionary.value(forKey: "writtenBy") != nil {
            self.writtenBy = dictionary.value(forKey: "writtenBy") as! String
        }
        if dictionary.value(forKey: "source") != nil {
            self.source = dictionary.value(forKey: "source") as! String
        }
        if dictionary.value(forKey: "artistName") != nil {
            self.artistName = dictionary.value(forKey: "artistName") as! String
        }
        if dictionary.value(forKey: "facebook") != nil{
            self.facebook = dictionary.value(forKey: "facebook") as! String
        }
        if dictionary.value(forKey: "twitter") != nil{
            self.twitter = dictionary.value(forKey: "twitter") as! String
        }
        if dictionary.value(forKey: "image") != nil{
            self.twitter = dictionary.value(forKey: "image") as! String
        }
    }
    
    open func toDictionary() -> NSDictionary {
        let newsDictionary = [
            "sidid":self.sidid,
            "title":self.title,
            "songs":self.songs,
            "video":self.video,
            "link":self.link,
            "aboutTrack":self.aboutTrack,
            "writtenBy":self.writtenBy,
            "source":self.source,
            "artistName":self.artistName,
            "facebook":self.facebook,
            "twitter":self.twitter,
            "image":self.image
        ]
        return newsDictionary as NSDictionary
    }
}
