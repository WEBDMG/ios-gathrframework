//
//  File.swift
//  Gathr
//
//  Created by Richard Robinson on 9/27/25.
//

import Foundation

/// Gathr audio object
open class GathrCategory {
    //MARK: - Properties
    /// Audio id assigned by Gathr
    public var id = UUID()
    /// Title of audio file set by user on upload
    public var name:String?
    /// ???
    public var playmetoken:String?
    /// Video URL
    public var playmeapptoken:String?
    /// URL to audio file
    
    //MARK: - Init method
    
    /// Init method
    /// - Parameter data: json data set to a dictionary
    public init(data: NSDictionary){
        self.id = UUID()
        if let lead = data["name"] {
            self.name = lead as! String
        }
        if let lead1 = data["playmetoken"] {
            self.playmetoken = lead1 as! String
        }
        if let lead2 = data["playmeapptoken"] {
            self.playmeapptoken = lead2 as! String
        }
    }
    
    /// If data is already a dictionary and you need to convert it to an audio object
    /// - Parameter dictionary: NSDictionary data to be passed in.
    public init(dictionary: NSDictionary){
        if dictionary.value(forKey: "id") != nil {
            self.id = dictionary.value(forKey: "id") as! UUID
        }
        if dictionary.value(forKey: "name") != nil {
            self.name = dictionary.value(forKey: "name") as! String
        }
        if dictionary.value(forKey: "playmetoken") != nil {
            self.playmetoken = dictionary.value(forKey: "playmetoken") as! String
        }
        if dictionary.value(forKey: "playmeapptoken") != nil {
            self.playmeapptoken = dictionary.value(forKey: "playmeapptoken") as! String
        }
    }
    
    //MARK: - To Method
    /// Convert Object to Dictionary
    open func toDictionary() -> NSDictionary {
        let newsDictionary = [
            "id":self.id,
            "name":self.name,
            "playmetoken":self.playmetoken,
            "playmeapptoken":self.playmeapptoken,
        ] as [String : Any]
        return newsDictionary as NSDictionary
    }
}
