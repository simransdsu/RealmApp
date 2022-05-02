//
//  CountryRowView.swift
//  RealmApp
//
//  Created by Simran Preet Singh Narang on 2022-05-02.
//

import SwiftUI
import RealmSwift

struct CountryRowView: View {
    
    @ObservedRealmObject var country: Country
    
    
    var body: some View {
        HStack {
            TextField("New Country", text: $country.name)
                .textFieldStyle(.roundedBorder)
                .padding()
                .frame(height: 30)
            
            Text("\(country.cities.count) cities")
                .foregroundColor(.secondary)
        }
    }
}

struct CountryRowView_Previews: PreviewProvider {
    static var previews: some View {
        CountryRowView(country: Country(name: "🇨🇦 Canada"))
    }
}
