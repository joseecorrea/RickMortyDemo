//
//  CharacterListView.swift
//  RickMortyDemo
//
//  Created by Jose E on 4/7/23.
//

import SwiftUI

struct CharacterListView: View {
    
    @StateObject var viewModel: CharacterListViewModel = CharacterListViewModel()
    @State var searchText: String = Constants.Strings.empty
    
    var searchResults: Characters {
        if searchText.isEmpty {
            return viewModel.characters
        } else {
            return viewModel.searchedCharacters
        }
    }
    
    var body: some View {
        List(searchResults) { character in
            NavigationLink(value: character) {
                HStack {
                    CharacterAsyncImageView(urlString: character.image ?? Constants.OptionalUnwrap.basic, size: 60)
                    VStack(alignment: .leading, spacing: Constants.UI.Spacing._10) {
                        CharacterStatusView(status: character.status?.rawValue ?? Constants.OptionalUnwrap.notAvailable, dotSize: 7, font: .footnote)
                        Text(character.name ?? Constants.OptionalUnwrap.notAvailable)
                            .font(.headline)
                    }
                    Spacer()
                    Text(character.species ?? Constants.OptionalUnwrap.notAvailable)
                        .font(.footnote)
                }
            }
            .onAppear {
                if character.id == searchResults.last?.id  {
                    if searchText.isEmpty && viewModel.isNextPageAvailable ?? false {
                        viewModel.getCharacters()
                    } else if viewModel.isNextPageSearchAvailable ?? false {
                        viewModel.searchCharacters(byName: searchText, newSearch: false)
                    }
                }
            }
        }
        .customErrorAlert(isPresented: $viewModel.errorHappend) {
            viewModel.getCharacters()
        }
        .searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .always))
        .navigationDestination(for: Character.self) { character in
            CharacterDetailView(character: character)
        }
        .onChange(of: searchText) { newValue in
            viewModel.clearSearch()
            viewModel.searchCharacters(byName: newValue, newSearch: true)
        }
        .onAppear {
            if viewModel.characters.count <= 0 {
                viewModel.getCharacters()
            }
        }
    }
}

struct CharacterListView_Previews: PreviewProvider {
    static var previews: some View {
        CharacterListView()
    }
}
