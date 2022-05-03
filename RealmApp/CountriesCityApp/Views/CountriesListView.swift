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
    
//    @State private var presentAlert = false
    
    var body: some View {
        NavigationView {
            VStack {
                if countries.isEmpty {
                    
                    Text("Tap on the \(Image(systemName: "plus.circle.fill")) button above to create a new country")
                    
                } else {
                    
                    List {
                        ForEach(countries.sorted(byKeyPath: "name")) { country in
                            NavigationLink(destination: CitiesView(country: country)) {
                                CountryRowView(country: country)
                            }
                        }
                        .onDelete(perform: deleteCountry)
                        .listRowSeparator(.hidden)
                    }
                    
                    .listStyle(.plain)
                    
                }
                Spacer()
            }
            .animation(.default, value: countries)
            .navigationTitle("Countries")
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button {
                            $countries.append(Country())
                        } label: {
                            Image(systemName: "plus.circle.fill")
                                .font(.title2)
                        }
                    }
                }
        }
//        .alert("You must first delete all of the cities in this country first", isPresented: $presentAlert) { }
    }
    
    
    private func deleteCountry(indexSet: IndexSet) {
        guard let index = indexSet.first else { return }
        let selectedCountry = Array(countries.sorted(byKeyPath: "name"))[index]
        
        guard selectedCountry.cities.isEmpty else {
            
//            presentAlert.toggle()
            return
        }
        
        $countries.remove(selectedCountry)
    }
}

struct CountriesCity_Previews: PreviewProvider {
    static var previews: some View {
        CountriesListView()
    }
}
