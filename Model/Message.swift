//
//  Message.swift
//  InspoBox
//
//  Created by Lisa J on 4/19/18.
//  Copyright © 2018 Lisa J. All rights reserved.
//

import Foundation

class Message {
    let inspoMessage: String
   // var timestamp: Double = Date.timeIntervalSinceReferenceDate
    init(message: String) {
        self.inspoMessage = message
    }
    
    init(dict: [String: Any]) {
        inspoMessage = dict["inspoMessage"] as? String ?? ""
    }
}

