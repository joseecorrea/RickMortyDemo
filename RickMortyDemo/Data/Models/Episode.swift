//
//  Episode.swift
//  RickMortyDemo
//
//  Created by Jose E on 6/7/23.
//

import Foundation

typealias EpisodeList = [Episode]

struct Episode: Codable, Identifiable {
    let id: Int?
    let name, airDate, episode: String?
    let characters: [String]?
    let url: String?
    let created: String?

    enum CodingKeys: String, CodingKey {
        case id, name
        case airDate = "air_date"
        case episode, characters, url, created
    }
}

