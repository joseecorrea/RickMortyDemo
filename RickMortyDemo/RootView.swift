//
//  ContentView.swift
//  RickMortyDemo
//
//  Created by Jose E on 3/7/23.
//

import SwiftUI

struct RootView: View {
    var body: some View {
        TabView {
            HomeView()
            .tabItem {
                Label(Constants.Strings.home, systemImage: Constants.Symbols.home)
            }
            NavigationStack {
                CharacterListView()
                    .navigationTitle(Constants.Strings.characters)
            }
            .tabItem {
                Label(Constants.Strings.characters, systemImage: Constants.Symbols.person)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
    }
}
