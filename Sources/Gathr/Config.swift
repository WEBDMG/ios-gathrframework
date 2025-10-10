//
//  File.swift
//  Gathr
//
//  Created by Richard Robinson on 10/9/25.
//

import Foundation

open class Config1 {
    //MARK: - Properties
    /// Audio id assigned by Gathr
    public var blogurl = String()
    /// Title of audio file set by user on upload
    public var playmeappappleid = String()
    /// ???
    public var playmeappfacebookurl:String?
    /// Video URL
    public var playmeapphomeurl:String?
    /// URL to audio file
    public var playmeappid = String()
    /// String description of the content of audio file. Set by the user.
    public var playmeappinstagramurl:String?
    /// Production credits for the person that wrote the content of the auiod file. Set by the user at upload.
    public var playmeappkeywords:String?
    /// Can be "uploaded" of "soundcloud"
    public var playmeapplandingpageactive:String?
    /// String name of person or persons that performed the audio. Set by the user at upload.
    public var playmeappname = String()
    /// Social media link to app owners social media. Set by the user at upload.
    public var playmeappnameformatted = String()
    /// Social media link to app owners social media. Set by the user at upload.
    public var playmeappstoreurl:String?
    /// Social media link to app owners social media. Set by the user at upload.
    public var playmeapptoken = String()
    public var playmeapptwitterurl:String?
    public var playmetoken = String()
    public var playmefeatures:String?

    public var playmeappyoutubeurl:String?

    //MARK: - Init method
    
    /// Init method
    /// - Parameter data: json data set to a dictionary
    public init(data: NSDictionary){
        if let sid = data["blogurl"] {
            self.blogurl = sid as! String
        }
        if let lead = data["playmeappappleid"] {
            self.playmeappappleid = lead as! String
        }
        if let playmeappfacebookurl = data["playmeappfacebookurl"] {
            self.playmeappfacebookurl = playmeappfacebookurl as! String
        }
        if let playmeapphomeurl = data["playmeapphomeurl"] {
            self.playmeapphomeurl = playmeapphomeurl as! String
        }
        if let playmeappid = data["playmeappid"] {
            self.playmeappid = playmeappid as! String
        }
        if let playmeappinstagramurl = data["playmeappinstagramurl"] {
            self.playmeappinstagramurl = playmeappinstagramurl as! String
        }
        if let playmeappkeywords = data["playmeappkeywords"] {
            self.playmeappkeywords = playmeappkeywords as! String
        }
        if let playmeapplandingpageactive = data["playmeapplandingpageactive"] {
            self.playmeapplandingpageactive = playmeapplandingpageactive as! String
        }
        if let playmeappname = data["playmeappname"] {
            self.playmeappname = playmeappname as! String
        }
        if let playmeappnameformatted = data["playmeappnameformatted"] {
            self.playmeappnameformatted = playmeappnameformatted as! String
        }
        if let playmeappstoreurl = data["playmeappstoreurl"] {
            self.playmeappstoreurl = playmeappstoreurl as! String
        }
        if let playmeapptoken = data["playmeapptoken"] {
            self.playmeapptoken = playmeapptoken as! String
        }
        if let playmeapptwitterurl = data["playmeapptwitterurl"] {
            self.playmeapptwitterurl = playmeapptwitterurl as! String
        }
        if let playmetoken = data["playmetoken"] {
            self.playmetoken = playmetoken as! String
        }
        if let playmefeatures = data["playmefeatures"] {
            self.playmefeatures = playmefeatures as! String
        }
        if let playmeappyoutubeurl = data["playmeappyoutubeurl"] {
            self.playmeappyoutubeurl = playmeappyoutubeurl as! String
        }
    }
    
    /// If data is already a dictionary and you need to convert it to an audio object
    /// - Parameter dictionary: NSDictionary data to be passed in.
    public init(dictionary: NSDictionary){
        if dictionary.value(forKey: "blogurl") != nil {
            self.blogurl = dictionary.value(forKey: "blogurl") as! String
        }
        if dictionary.value(forKey: "playmeappappleid") != nil {
            self.playmeappappleid = dictionary.value(forKey: "playmeappappleid") as! String
        }
        if dictionary.value(forKey: "playmeappfacebookurl") != nil {
            self.playmeappfacebookurl = dictionary.value(forKey: "playmeappfacebookurl") as! String
        }
        if dictionary.value(forKey: "playmeapphomeurl") != nil {
            self.playmeapphomeurl = dictionary.value(forKey: "playmeapphomeurl") as! String
        }
        if dictionary.value(forKey: "playmeappid") != nil{
            self.playmeappid = dictionary.value(forKey: "playmeappid") as! String
        }
        if dictionary.value(forKey: "playmeappinstagramurl") != nil {
            self.playmeappinstagramurl = dictionary.value(forKey: "playmeappinstagramurl") as! String
        }
        if dictionary.value(forKey: "playmeappkeywords") != nil {
            self.playmeappkeywords = dictionary.value(forKey: "playmeappkeywords") as! String
        }
        if dictionary.value(forKey: "playmeapplandingpageactive") != nil {
            self.playmeapplandingpageactive = dictionary.value(forKey: "playmeapplandingpageactive") as! String
        }
        if dictionary.value(forKey: "playmeappname") != nil {
            self.playmeappname = dictionary.value(forKey: "playmeappname") as! String
        }
        if dictionary.value(forKey: "playmeappnameformatted") != nil{
            self.playmeappnameformatted = dictionary.value(forKey: "playmeappnameformatted") as! String
        }
        if dictionary.value(forKey: "playmeappstoreurl") != nil{
            self.playmeappstoreurl = dictionary.value(forKey: "playmeappstoreurl") as! String
        }
        if dictionary.value(forKey: "playmeapptoken") != nil{
            self.playmeapptoken = dictionary.value(forKey: "playmeapptoken") as! String
        }
        if dictionary.value(forKey: "playmeapptwitterurl") != nil{
            self.playmeapptwitterurl = dictionary.value(forKey: "playmeapptwitterurl") as! String
        }
        if dictionary.value(forKey: "playmeappyoutubeurl") != nil{
            self.playmeappyoutubeurl = dictionary.value(forKey: "playmeappyoutubeurl") as! String
        }
        if dictionary.value(forKey: "playmetoken") != nil{
            self.playmetoken = dictionary.value(forKey: "playmetoken") as! String
        }
//        let two = dictionary.value(forKey:"config") as! NSArray
//        self.playmefeatures = two[1] as! String
    }
    
    //MARK: - To Method
    /// Convert Object to Dictionary
    open func toDictionary() -> NSDictionary {
        let newsDictionary = [
            "blogurl":self.blogurl,
            "playmeappappleid":self.playmeappappleid,
            "playmeappfacebookurl":self.playmeappfacebookurl,
            "playmeapphomeurl":self.playmeapphomeurl,
            "playmeappid":self.playmeappid,
            "playmeappinstagramurl":self.playmeappinstagramurl,
            "playmeappkeywords":self.playmeappkeywords,
            "playmeapplandingpageactive":self.playmeapplandingpageactive,
            "playmeappname":self.playmeappname,
            "playmeappnameformatted":self.playmeappnameformatted,
            "playmeappstoreurl":self.playmeappstoreurl,
            "playmeapptoken":self.playmeapptoken,
            "playmeapptwitterurl":self.playmeapptwitterurl,
            "playmeappyoutubeurl":self.playmeappyoutubeurl,
            "playmetoken":self.playmetoken
            
        ]
        return newsDictionary as NSDictionary
    }
}
