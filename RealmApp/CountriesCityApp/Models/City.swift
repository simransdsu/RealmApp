//
//  City.swift
//  RealmApp
//
//  Created by Simran Preet Singh Narang on 2022-05-02.
//

import Foundation
import RealmSwift

class City: Object, ObjectKeyIdentifiable {
    
    @Persisted(primaryKey: true) var id: ObjectId
    @Persisted var name: String
    
    convenience init(name: String) {
        self.init()
        self.name = name
    }
}
