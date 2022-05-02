//
//  RealmAppApp.swift
//  RealmApp
//
//  Created by Simran Preet Singh Narang on 2022-04-27.
//

import SwiftUI

@main
struct RealmAppApp: App {
    var body: some Scene {
        WindowGroup {
//            TodoListView()
            CountriesListView()
                .onAppear {
                    print(FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.path ?? "No Path available")
                    UserDefaults.standard.set(false, forKey: "_UIConstraintBasedLayoutLogUnsatisfiable")
                }
        }
    }
}
