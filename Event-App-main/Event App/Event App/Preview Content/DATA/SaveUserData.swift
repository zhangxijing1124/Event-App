//
//  SaveUserData.swift
//  Event App
//
//  Created by xikai qian on 4/25/22.
//

import Foundation
import CoreData

//func addUser(UserName: String, UserEventName: String, UserEventType: String,UserEventPeopleNum : Int,UserEventAddress : String) {
///*
//     code here would be using Core Data structure
//     do not copy paste, only used as reference
//*/
//    let newUser = User(context: context)
//    newUser.firstName = firstName
//    newUser.lastName = lastName
//    newUser.age = age
//    
//    do {
//        try context.save()
//        print("Successfully saved to Core Data.")
//    } catch {
//        print(error.localizedDescription)
//    }
//    
//}

func addUser<T: Codable>(named: String, object: T) {
    do {
        let fileURL = try FileManager.default
            .url(for: .applicationSupportDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
            .appendingPathComponent(named)
        let encoder = try JSONEncoder().encode(object)

        try encoder.write(to: fileURL)
    } catch {
        print("JSONSave error of \(error)")
    }
}
