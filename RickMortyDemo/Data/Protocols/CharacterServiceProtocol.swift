//
//  CharacterServiceProtocol.swift
//  RickMortyDemo
//
//  Created by Jose E on 4/7/23.
//

import Foundation

protocol CharacterServiceProtocol: ServiceProtocol {
    func getPage() async -> Result<Characters, CustomError>
    func searchCharacter(byName name: String) async -> Result<Characters, CustomError>
    func isNextPageAvailable() -> Bool
    func clearSearch()
}
