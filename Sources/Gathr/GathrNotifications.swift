//
//  GathrNotifications.swift
//  Gathr
//
//  Created by Richard Robinson on 1/3/20.
//  Copyright © 2020 WEBDMG. All rights reserved.
//

import Foundation

open class GathrNotifications {
    let nc = NotificationCenter.default
    
    public func postNotification(name:String){
       nc.post(name: Notification.Name(name), object: nil)
    }
    
}
