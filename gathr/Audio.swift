//
//  Audio.swift
//  PlayMe
//
//  Created by Richard Robinson on 9/2/16.
//  Copyright © 2016 WEBDMG. All rights reserved.
//

import Foundation

class Audio {
    var sidid:String = String()
    var title:String = String()
    var songs:NSURL = NSURL()
    var video:String = String()
    var image:NSURL = NSURL()
    var aboutTrack:String = String()
    var writtenBy:String = String()
    var source:String = String()
    var artistName:String = String()
    var facebook:String = String()
    var twitter:String = String()
    
    init(data: NSDictionary){
        if data["sidid"] != nil {
            self.sidid = String(data["sidid"] as! String)
        }
        if data["title"] != nil {
            self.title = String(data["title"] as! String)
        }
        if data["songs"] != nil {
            self.songs = NSURL(string:data["songs"] as! String)!
        }
        if data["video"] != nil {
            self.video = String(data["video"] as! String)
        }
        if data["image"] != nil{
            self.image = NSURL(string:data["image"] as! String)!
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
        if dictionary.valueForKey("sidid") != nil {
            self.sidid = dictionary.valueForKey("sidid") as! String
        }
        if dictionary.valueForKey("title") != nil {
            self.title = dictionary.valueForKey("title") as! String
        }
        if dictionary.valueForKey("songs") != nil {
            self.songs = NSURL(string:dictionary.valueForKey("songs") as! String)!
        }
        if dictionary.valueForKey("video") != nil {
            self.video = dictionary.valueForKey("video") as! String
        }
        if dictionary.valueForKey("image") != nil{
            self.image = NSURL(string:dictionary.valueForKey("image") as! String)!
        }
        if dictionary.valueForKey("aboutTrack") != nil {
            self.aboutTrack = dictionary.valueForKey("aboutTrack") as! String
        }
        if dictionary.valueForKey("writtenBy") != nil {
            self.writtenBy = dictionary.valueForKey("writtenBy") as! String
        }
        if dictionary.valueForKey("source") != nil {
            self.source = dictionary.valueForKey("source") as! String
        }
        if dictionary.valueForKey("artistName") != nil {
            self.artistName = dictionary.valueForKey("artistName") as! String
        }
        if dictionary.valueForKey("facebook") != nil{
            self.facebook = dictionary.valueForKey("facebook") as! String
        }
        if dictionary.valueForKey("twitter") != nil{
            self.twitter = dictionary.valueForKey("twitter") as! String
        }
    }
    
    func toDictionary() -> NSDictionary {
        let newsDictionary = [
        "sidid":self.sidid,
        "title":self.title,
        "songs":self.songs,
        "video":self.video,
        "image":self.image,
        "aboutTrack":self.aboutTrack,
        "writtenBy":self.writtenBy,
        "source":self.source,
        "artistName":self.artistName,
        "facebook":self.facebook,
        "twitter":self.twitter
        ]
        return newsDictionary
    }
}