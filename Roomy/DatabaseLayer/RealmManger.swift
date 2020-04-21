//
//  RealmManger.swift
//  Roomy
//
//  Created by Mahmoud on 4/21/20.
//  Copyright © 2020 Mahmoud. All rights reserved.
//

import Foundation
import RealmSwift
class RealmManager {
    
    private static let realm = try! Realm()
    
    static func saveRooms(rooms: [RoomsModel]) {
        try! realm.write {
            realm.add(rooms)
            print("Realm \(realm.configuration.fileURL?.absoluteString)")
        }
    }
    
    static func fetchRooms() -> [RoomsModel] {
        let posts = realm.objects(RoomsModel.self)
        var postsArray = [RoomsModel]()
        for post in posts {
            postsArray.append(post)
        }
        return postsArray
}
}
