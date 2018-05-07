//
//  DatabaseService.swift
//  InspoBox
//
//  Created by Lisa J on 4/19/18.
//  Copyright © 2018 Lisa J. All rights reserved.
//

import Foundation
import FirebaseDatabase

class DatabaseService {
    static let manager = DatabaseService ()
    var rootRef: DatabaseReference!
    var messagesRef: DatabaseReference!
    
    init() {
        self.rootRef = Database.database().reference()
        self.messagesRef = self.rootRef.child("messages")
    }
    
    public func getDB()-> DatabaseReference { return rootRef }
}
