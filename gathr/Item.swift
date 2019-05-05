//
//  Item.swift
//  PlayMe
//
//  Created by Richard Robinson on 9/3/16.
//  Copyright © 2016 WEBDMG. All rights reserved.
//

import Foundation

open class Item{
    public var id:String = String()
    public var name:String = String()
    public var desc:String = String()
    public var price:String = String()
    public var image:String = String()
    public var status:String = String()
    public var inventory:String = String()
    
    
   public init(data: NSDictionary){
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
    
    public init(dictionary: NSDictionary){
        if dictionary.value(forKey: "id") != nil {
            self.id = dictionary.value(forKey: "id") as! String
        }
        if dictionary.value(forKey: "name") != nil {
            self.name = dictionary.value(forKey: "name") as! String
        }
        if dictionary.value(forKey: "desc") != nil {
            self.desc = dictionary.value(forKey: "desc") as! String
        }
        if dictionary.value(forKey: "price") != nil {
            self.price = dictionary.value(forKey: "price") as! String
        }
        if dictionary.value(forKey: "image") != nil{
            self.image = dictionary.value(forKey: "image") as! String
        }
        if dictionary.value(forKey: "status") != nil {
            self.status = dictionary.value(forKey: "status") as! String
        }
        if dictionary.value(forKey: "inventory") != nil {
            self.inventory = dictionary.value(forKey: "inventory") as! String
        }
    }
    
    open func toDictionary() -> NSDictionary {
        let itemDictionary = [
            "id":self.id,
            "name":self.name,
            "desc":self.desc,
            "price":self.price,
            "image":self.image,
            "status":self.status,
            "inventory":self.inventory
        ]
        return itemDictionary as NSDictionary
    }
}
