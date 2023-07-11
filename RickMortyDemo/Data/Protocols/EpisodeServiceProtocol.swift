//
//  EpisodeServiceProtocol.swift
//  RickMortyDemo
//
//  Created by Jose E on 6/7/23.
//

import Foundation

protocol EpisodeServiceProtocol: ServiceProtocol {
    func getDetails(forIDs ids: [Int]) async -> Result<EpisodeList, CustomError>
}
