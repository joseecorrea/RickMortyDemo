//
//  Utils.swift
//  RickMortyDemo
//
//  Created by Jose E on 5/7/23.
//

import Foundation

class Utils {
    
    static private let character: Character = Character(id: 696, name: "Glockenspiel Morty", status: .dead, species: "Robot", type: "Decoy", gender: .male, origin: Location(name: "Earth (Replacement Dimension)", url: "https://rickandmortyapi.com/api/location/20"), location: Location(name: "Earth (Replacement Dimension)", url: "https://rickandmortyapi.com/api/location/20"), image: "https://rickandmortyapi.com/api/character/avatar/696.jpeg", episode:   ["https://rickandmortyapi.com/api/episode/43"], url: "https://rickandmortyapi.com/api/character/696", created: "2021-10-16T15:37:40.381Z")
    
    static private let episode: Episode = Episode(id: 1, name: "Pilot", airDate: "December 2, 2013", episode: "S01E01", characters: [], url: "https://rickandmortyapi.com/api/episode/1", created: "2017-11-10T12:56:33.798Z")
    
    static func getCharacter() -> Character {
        character
    }
    
    static func getEpisode() -> Episode {
        episode
    }
    
    static func readLocalJSONFile(forName name: String) -> Data? {
        do {
            if let filePath = Bundle.main.path(forResource: name, ofType: "json") {
                let fileUrl = URL(fileURLWithPath: filePath)
                let data = try Data(contentsOf: fileUrl)
                return data
            }
        } catch {
            print("error: \(error)")
        }
        return nil
    }
    
    static func parseJSON<T: Decodable>(jsonData: Data) -> T? {
        do {
            let decodedData = try JSONDecoder().decode(T.self, from: jsonData)
            return decodedData
        } catch {
            print("error: \(error)")
        }
        return nil
    }
    
}
