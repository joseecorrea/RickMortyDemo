//
//  HomeData.swift
//  RickMortyDemo
//
//  Created by Jose E on 10/7/23.
//

import Foundation

// MARK: - HomeData
struct HomeData: Codable {
    let title, description, image, trailerURL: String?
    let imdbURL, imdbRating: String?
    let categories, creators: [String]?
}
