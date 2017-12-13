//
//  Menu.swift
//  WeddingAppMaster
//
//  Created by jwilson on 10/12/17.
//  Copyright © 2017 jwilson. All rights reserved.
//

import Foundation

struct Menu {
    let name: String
    let switchboard: Int
    let context: String
    let imageURL: URL
    let originalURL: URL
    
    init(name: String, switchboard: Int, context: String, imageURL: URL, originalURL: URL) {
        self.name = name
        self.switchboard = switchboard
        self.context = context
        self.imageURL = imageURL
        self.originalURL = originalURL
    }
    
    init(dictionary: [String: Any]) {
        let name = dictionary["name"] as! String
        let switchboard = dictionary["switchboard"] as! Int
        let context = dictionary["context"] as! String
        let imageURLString = dictionary["imageURL"] as! String
        let originalURLString = dictionary["originalURL"] as? String
        
        let imageURL = URL(string: imageURLString)!
        let originalURL = URL(string: originalURLString ?? "https://www.apple.com")
        
        let backupURL = URL(string: "https://www.apple.com")!
        
        self.init(name: name, switchboard: switchboard, context: context, imageURL: imageURL, originalURL: originalURL ?? backupURL)
    }
    
}
