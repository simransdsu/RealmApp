//
//  CitiesView.swift
//  RealmApp
//
//  Created by Simran Preet Singh Narang on 2022-05-02.
//

import SwiftUI
import RealmSwift

struct CitiesView: View {
    
    @ObservedRealmObject var country: Country
    @State private var name = ""
    
    var body: some View {
        VStack {
            HStack {
                TextField("Enter city name", text: $name)
                    .textFieldStyle(.roundedBorder)
                Spacer()
                Button {
                    let newCity = City(name: name)
                    $country.cities.append(newCity)
                    name = ""
                } label: {
                    Image(systemName: "plus.circle.fill")
                }.disabled(name.isEmpty)
            }
            .padding()
            
            List {
                ForEach(country.cities) { city in
                    Text(city.name)
                }.onDelete(perform: $country.cities.remove)
                    .onMove(perform: $country.cities.move)
                    .listRowSeparator(.hidden)
            }
            .listStyle(.plain)
        }
        .navigationTitle(Text(country.name))
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                EditButton()
            }
        }
    }
}

struct CitiesView_Previews: PreviewProvider {
    static var previews: some View {
        CitiesView(country: Country(name: "Canada"))
    }
}
