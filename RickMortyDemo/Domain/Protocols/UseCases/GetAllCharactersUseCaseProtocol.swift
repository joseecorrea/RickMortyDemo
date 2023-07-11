//
//  GetAllCharactersUseCaseProtocol.swift
//  RickMortyDemo
//
//  Created by Jose E on 4/7/23.
//

import Foundation

protocol GetAllCharactersUseCaseProtocol {
    func execute() async -> Result<Characters, CustomError>
    func isNextPageAvailable() -> Bool
}
