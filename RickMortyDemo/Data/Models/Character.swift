//
//  Character.swift
//  RickMortyDemo
//
//  Created by Jose E on 4/7/23.
//

import Foundation

// MARK: - Characters
typealias Characters = [Character]

// MARK: - Character
struct Character: Codable, Identifiable, Hashable {
    
    static func == (lhs: Character, rhs: Character) -> Bool {
        rhs.id == lhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(self.id)
    }
    
    let id: Int?
    let name: String?
    let status: Status?
    let species: String?
    let type: String?
    let gender: Gender?
    let origin, location: Location?
    let image: String?
    let episode: [String]?
    let url: String?
    let created: String?
}

// MARK: - Location
struct Location: Codable {
    let name: String?
    let url: String?
}

enum Gender: String, Codable {
    case male = "Male"
    case female = "Female"
    case genderLess = "Genderless"
    case unknown = "unknown"
}

enum Status: String, Codable {
    case alive = "Alive"
    case dead = "Dead"
    case unknown = "unknown"
}
