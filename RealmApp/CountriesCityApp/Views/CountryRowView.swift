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
    @FocusState var isFocusedState: Bool?
    
    var body: some View {
        TextField("New Country", text: $country.name)
//            .focused($isFocusedState, equals: true)
            .textFieldStyle(.roundedBorder)
            .padding()
            .frame(height: 30)
    }
}

struct CountryRowView_Previews: PreviewProvider {
    static var previews: some View {
        CountryRowView(country: Country(name: "🇨🇦 Canada"))
    }
}
