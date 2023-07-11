//
//  CharacterList.swift
//  RickMortyDemo
//
//  Created by Jose E on 4/7/23.
//

import Foundation

// MARK: - CharacterList
struct CharacterList: Codable {
    let info: CharacterListInfo?
    let characters: Characters?
    
    enum CodingKeys: String, CodingKey {
            case info
            case characters = "results"
        }
}

// MARK: - Info
struct CharacterListInfo: Codable {
    let count, pages: Int?
    let next: String?
    let prev: String?
}
