//
//  Audio.swift
//  PlayMe
//
//  Created by Richard Robinson on 9/2/16.
//  Copyright © 2016 WEBDMG. All rights reserved.
//

import Foundation

/// Gathr audio object
open class Audio {
    //MARK: - Properties
    /// Audio id assigned by Gathr
    public var sidid:String?
    /// Title of audio file set by user on upload
    public var title:String?
    /// ???
    public var songs:String?
    /// Video URL
    public var video:String?
    /// URL to audio file
    public var link:String?
    /// String description of the content of audio file. Set by the user.
    public var aboutTrack:String?
    /// Production credits for the person that wrote the content of the auiod file. Set by the user at upload.
    public var writtenBy:String?
    /// Can be "uploaded" of "soundcloud"
    public var source:String?
    /// String name of person or persons that performed the audio. Set by the user at upload.
    public var artistName:String?
    /// Social media link to app owners social media. Set by the user at upload.
    public var facebook:String?
    /// Social media link to app owners social media. Set by the user at upload.
    public var twitter:String?
    /// Social media link to app owners social media. Set by the user at upload.
    public var image:String?
    public var producedBy:String?
    public var episode:String?
    
    /// Episode number as an Int computed from the `episode` string.
    /// Getting: Parses the `episode` string (after trimming whitespace) into an Int.
    /// Setting: Updates the underlying `episode` string from the provided Int.
    public var episodeInt: Int? {
        get {
            guard let ep = episode?.trimmingCharacters(in: .whitespacesAndNewlines), !ep.isEmpty else { return nil }
            return Int(ep)
        }
        set {
            if let value = newValue {
                episode = String(value)
            } else {
                episode = nil
            }
        }
    }
    
    //MARK: - Init method
    
    /// Init method
    /// - Parameter data: json data set to a dictionary
    public init(data: NSDictionary){
        if let sid = data["sidid"] {
            self.sidid = sid as! String
        }
        if let lead = data["title"] {
            self.title = lead as! String
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
        if data["producedBy"] != nil{
            self.producedBy = String(data["producedBy"] as! String)
        }
        if data["episode"] != nil{
            self.episode = String(data["episode"] as! String)
        }
        
    }
    
    /// If data is already a dictionary and you need to convert it to an audio object
    /// - Parameter dictionary: NSDictionary data to be passed in.
    public init(dictionary: NSDictionary){
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
        if dictionary.value(forKey: "producedBy") != nil{
            self.producedBy = dictionary.value(forKey: "producedBy") as! String
        }
        if dictionary.value(forKey: "episode") != nil{
            self.episode = dictionary.value(forKey: "episode") as! String
        }
    }
    
    //MARK: - To Method
    /// Convert Object to Dictionary
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
            "image":self.image,
            "producedBy":self.producedBy,
            "episode":self.episode
        ]
        return newsDictionary as NSDictionary
    }
}

