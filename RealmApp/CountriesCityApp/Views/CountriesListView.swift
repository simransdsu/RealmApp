//
//  CountriesCity.swift
//  RealmApp
//
//  Created by Simran Preet Singh Narang on 2022-05-02.
//

import SwiftUI
import RealmSwift

struct CountriesListView: View {
    
    @ObservedResults(Country.self) var countries
//    @FocusState private var isFocused: Bool?
    
    var body: some View {
        NavigationView {
            VStack {
                if countries.isEmpty {
                    
                    Text("Tap on the \(Image(systemName: "plus.circle.fill")) button above to create a new country")
                    
                } else {
                    
                    List {
                        ForEach(countries) { country in
                            CountryRowView(country: country)
                        }
                        .listRowSeparator(.hidden)
                    }
                    
                    .listStyle(.plain)
                    
                }
                Spacer()
            }.navigationTitle("Countries")
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button {
                            $countries.append(Country())
                        } label: {
                            Image(systemName: "plus.circle.fill")
                                .font(.title2)
                        }
                    }
                    
//                    ToolbarItemGroup(placement: .keyboard) {
//                        HStack {
//                            Spacer()
//                            Button {
//                                isFocused = nil
//                            } label: {
//                                Image(systemName: "keyboard.chevron.compact.down")
//                            }
//
//                        }
//                    }
                }
        }
    }
}

struct CountriesCity_Previews: PreviewProvider {
    static var previews: some View {
        CountriesListView()
    }
}
