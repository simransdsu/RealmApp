//
//  Todo.swift
//  RealmApp
//
//  Created by Simran Preet Singh Narang on 2022-04-27.
//

import Foundation
import RealmSwift
import SwiftUI

class Todo: Object, ObjectKeyIdentifiable {
    
    @Persisted(primaryKey: true) var id: ObjectId
    @Persisted var name: String
    @Persisted var completed = false
    @Persisted var urgency: Urgency = .neutral
    
    enum Urgency: Int, PersistableEnum {
        case trivial, neutral, urgent
        
        var text: String {
            switch self {
            case .trivial:
                return "Trivial"
            case .neutral:
                return "Neutral"
            case .urgent:
                return "Urgent"
            }
        }
        
        var color: Color {
            switch self {
            case .trivial:
                return Color.teal
            case .neutral:
                return Color.secondary
            case .urgent:
                return Color.red
            }
        }
    }
    
    convenience init(name: String) {
        self.init()
        self.name = name
    }
    
    func increment() -> Urgency {
        switch urgency {
        case .trivial:
            return .neutral
        case .neutral:
            return .urgent
        case .urgent:
            return .trivial
        }
    }
}
