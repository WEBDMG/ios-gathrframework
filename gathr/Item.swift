//
//  Item.swift
//  PlayMe
//
//  Created by Richard Robinson on 9/3/16.
//  Copyright © 2016 WEBDMG. All rights reserved.
//

import Foundation

class Item{
    var id:String = String()
    var name:String = String()
    var desc:String = String()
    var price:String = String()
    var image:String = String()
    var status:String = String()
    var inventory:String = String()

    
    init(data: NSDictionary){
        if data["id"] != nil {
            self.id = String(data["id"] as! String)
        }
        if data["name"] != nil {
            self.name = String(data["name"] as! String)
        }
        if data["desc"] != nil {
            self.desc = String(data["desc"] as! String)
        }
        if data["price"] != nil {
            self.price = String(data["price"] as! String)
        }
        if data["image"] != nil{
            self.image = String(data["image"] as! String)
        }
        if data["status"] != nil {
            self.status = String(data["status"] as! String)
        }
        if data["inventory"] != nil {
            self.inventory = String(data["inventory"] as! String)
        }
    }
    
    init(dictionary: NSDictionary){
        if dictionary.valueForKey("id") != nil {
            self.id = dictionary.valueForKey("id") as! String
        }
        if dictionary.valueForKey("name") != nil {
            self.name = dictionary.valueForKey("name") as! String
        }
        if dictionary.valueForKey("desc") != nil {
            self.desc = dictionary.valueForKey("desc") as! String
        }
        if dictionary.valueForKey("price") != nil {
            self.price = dictionary.valueForKey("price") as! String
        }
        if dictionary.valueForKey("image") != nil{
            self.image = dictionary.valueForKey("image") as! String
        }
        if dictionary.valueForKey("status") != nil {
            self.status = dictionary.valueForKey("status") as! String
        }
        if dictionary.valueForKey("inventory") != nil {
            self.inventory = dictionary.valueForKey("inventory") as! String
        }
    }
    
    func toDictionary() -> NSDictionary {
        let itemDictionary = [
            "id":self.id,
            "name":self.name,
            "desc":self.desc,
            "price":self.price,
            "image":self.image,
            "status":self.status,
            "inventory":self.inventory
        ]
        return itemDictionary
    }
}