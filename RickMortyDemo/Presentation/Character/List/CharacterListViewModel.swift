//
//  CharacterListViewModel.swift
//  RickMortyDemo
//
//  Created by Jose E on 4/7/23.
//

import Foundation

@MainActor
class CharacterListViewModel: ObservableObject {
    
    private let getAllCharacters: GetAllCharactersUseCaseProtocol = GetAllCharactersUseCase()
    private let searchCharacters: SearchCharacterUseCaseProtocol = SearchCharacterUseCase()
    
    @Published var characters: Characters = []
    @Published var searchedCharacters: Characters = []
    @Published var isNextPageAvailable: Bool?
    @Published var isNextPageSearchAvailable: Bool?
    @Published var errorHappend: Bool = false
    
    func getCharacters() {
        Task {
            let result = await getAllCharacters.execute()
            switch result {
            case .success(let characters):
                self.characters += characters
                isNextPageAvailable = getAllCharacters.isNextPageAvailable()
            case .failure(let error):
                errorHappend = true
                debugPrint(error)
            }
        }
    }
    
    func searchCharacters(byName name: String, newSearch: Bool) {
        Task {
            let result = await searchCharacters.execute(forName: name)
            switch result {
            case .success(let characters):
                if newSearch {
                    self.searchedCharacters = characters
                } else {
                    self.searchedCharacters += characters
                }
                isNextPageSearchAvailable = searchCharacters.isNextPageAvailableSearch()
            case .failure(let error):
                errorHappend = true
                debugPrint(error)
            }
        }
    }
    
    func clearSearch() {
        searchCharacters.clearSearch()
    }
    
}
