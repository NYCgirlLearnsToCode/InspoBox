//
//  DatabaseService + Add.swift
//  InspoBox
//
//  Created by Lisa J on 4/19/18.
//  Copyright © 2018 Lisa J. All rights reserved.
//

import Foundation
import FirebaseDatabase

extension DatabaseService {
    public func addMessage(messageToSave: Message) {
        let ref = messagesRef.childByAutoId()
        ref.setValue(["inspoMessage" : messageToSave.inspoMessage])
        { (error, dbRef) in
            if let error = error {
                //TODO: delegates for letting the user know fail/success saving event
                print(error)
            } else {
                print("Event added @ database reference: \(dbRef)")
            }
        }
    }
}
