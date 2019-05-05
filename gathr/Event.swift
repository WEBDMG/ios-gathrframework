//
//  Event.swift
//  PlayMe
//
//  Created by Richard Robinson on 9/3/16.
//  Copyright © 2016 WEBDMG. All rights reserved.
//

import Foundation

open class Event{
    public var eventid:String = String()
    public var venuename:String = String()
    public var address:String = String()
    public var date:String = String()
    public var time:String = String()
    public var notes:String = String()
    public var ticketlink:String = String()
    public var marketinglink:String = String()
    public var image:String = String()
    
    public init(data: NSDictionary){
        if data["eventid"] != nil {
            self.eventid = String(data["eventid"] as! String)
        }
        if data["venuename"] != nil {
            self.venuename = String(data["venuename"] as! String)
        }
        if data["address"] != nil {
            self.address = String(data["address"] as! String)
        }
        if data["date"] != nil {
            self.date = String(data["date"] as! String)
        }
        if data["time"] != nil{
            self.time = String(data["time"] as! String)
        }
        if data["notes"] != nil {
            self.notes = String(data["notes"] as! String)
        }
        if data["ticketlink"] != nil {
            self.ticketlink = String(data["ticketlink"] as! String)
        }
        if data["marketinglink"] != nil {
            self.marketinglink = String(data["marketinglink"] as! String)
        }
        if data["image"] != nil {
            self.image = String(data["image"] as! String)
        }
    }
    
    public init(dictionary: NSDictionary){
        if dictionary.value(forKey: "eventid") != nil {
            self.eventid = dictionary.value(forKey: "eventid") as! String
        }
        if dictionary.value(forKey: "venuename") != nil {
            self.venuename = dictionary.value(forKey: "venuename") as! String
        }
        if dictionary.value(forKey: "address") != nil {
            self.address = dictionary.value(forKey: "address") as! String
        }
        if dictionary.value(forKey: "date") != nil {
            self.date = dictionary.value(forKey: "date") as! String
        }
        if dictionary.value(forKey: "time") != nil{
            self.time = dictionary.value(forKey: "time") as! String
        }
        if dictionary.value(forKey: "notes") != nil {
            self.notes = dictionary.value(forKey: "notes") as! String
        }
        if dictionary.value(forKey: "ticketlink") != nil {
            self.ticketlink = dictionary.value(forKey: "ticketlink") as! String
        }
        if dictionary.value(forKey: "marketinglink") != nil {
            self.marketinglink = dictionary.value(forKey: "marketinglink") as! String
        }
        if dictionary.value(forKey: "image") != nil {
            self.image = dictionary.value(forKey: "image") as! String
        }
    }
    
    open func toDictionary() -> NSDictionary {
        let newsDictionary = [
            "eventid":self.eventid,
            "venuename":self.venuename,
            "address":self.address,
            "date":self.date,
            "time":self.time,
            "notes":self.notes,
            "ticketlink":self.ticketlink,
            "marketinglink":self.marketinglink,
            "image":self.image
        ]
        return newsDictionary as NSDictionary
    }
    
}
