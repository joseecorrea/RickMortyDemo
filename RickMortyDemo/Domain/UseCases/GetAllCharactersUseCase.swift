//
//  GetAllCharactersUseCase.swift
//  RickMortyDemo
//
//  Created by Jose E on 4/7/23.
//

import Foundation

class GetAllCharactersUseCase: GetAllCharactersUseCaseProtocol {

    private let service: CharacterServiceProtocol = CharacterService()

    func execute() async -> Result<Characters, CustomError> {
        await service.getPage()
    }
    
    func isNextPageAvailable() -> Bool {
        service.isNextPageAvailable()
    }

}
