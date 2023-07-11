//
//  SearchCharacterUseCaseProtocol.swift
//  RickMortyDemo
//
//  Created by Jose E on 5/7/23.
//

import Foundation

protocol SearchCharacterUseCaseProtocol {
    func execute(forName name: String) async -> Result<Characters, CustomError>
    func isNextPageAvailableSearch() -> Bool
    func clearSearch()
}
