//
//  Event.swift
//  PlayMe
//
//  Created by Richard Robinson on 9/3/16.
//  Copyright © 2016 WEBDMG. All rights reserved.
//

import Foundation

public class Event{
    var eventid:String = String()
    var venuename:String = String()
    var address:String = String()
    var date:String = String()
    var time:String = String()
    var notes:String = String()
    var ticketlink:String = String()
    var marketinglink:String = String()
    var image:String = String()
    
    init(data: NSDictionary){
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
    
    init(dictionary: NSDictionary){
        if dictionary.valueForKey("eventid") != nil {
            self.eventid = dictionary.valueForKey("eventid") as! String
        }
        if dictionary.valueForKey("venuename") != nil {
            self.venuename = dictionary.valueForKey("venuename") as! String
        }
        if dictionary.valueForKey("address") != nil {
            self.address = dictionary.valueForKey("address") as! String
        }
        if dictionary.valueForKey("date") != nil {
            self.date = dictionary.valueForKey("date") as! String
        }
        if dictionary.valueForKey("time") != nil{
            self.time = dictionary.valueForKey("time") as! String
        }
        if dictionary.valueForKey("notes") != nil {
            self.notes = dictionary.valueForKey("notes") as! String
        }
        if dictionary.valueForKey("ticketlink") != nil {
            self.ticketlink = dictionary.valueForKey("ticketlink") as! String
        }
        if dictionary.valueForKey("marketinglink") != nil {
            self.marketinglink = dictionary.valueForKey("marketinglink") as! String
        }
        if dictionary.valueForKey("image") != nil {
            self.image = dictionary.valueForKey("image") as! String
        }
    }
    
    func toDictionary() -> NSDictionary {
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
        return newsDictionary
    }
    
}
