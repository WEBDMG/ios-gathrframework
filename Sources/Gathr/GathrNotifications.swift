//
//  GathrNotifications.swift
//  Gathr
//
//  Created by Richard Robinson on 1/3/20.
//  Copyright © 2020 WEBDMG. All rights reserved.
//

import Foundation

/// Notification center notifications that run through the framework.
open class GathrNotifications {
    /// init default notifications center
    let nc = NotificationCenter.default
    
    /// Convenience method for posting notifications in the framework
    /// - Parameter name: name of notification to be sent.
    public func postNotification(name:String){
       nc.post(name: Notification.Name(name), object: nil)
    }
    
}
