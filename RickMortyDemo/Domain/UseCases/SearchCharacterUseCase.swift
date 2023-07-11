//
//  SearchCharacterUseCase.swift
//  RickMortyDemo
//
//  Created by Jose E on 5/7/23.
//

import Foundation

class SearchCharacterUseCase: SearchCharacterUseCaseProtocol {
    
    private let service: CharacterServiceProtocol = CharacterService()
     
    func execute(forName name: String) async -> Result<Characters, CustomError> {
        await service.searchCharacter(byName: name)
    }
    
    func isNextPageAvailableSearch() -> Bool {
        service.isNextPageAvailable()
    }
    
    func clearSearch() {
        service.clearSearch()
    }
    
}
