//
//  GetEpisodesDetailUseCaseProtocol.swift
//  RickMortyDemo
//
//  Created by Jose E on 6/7/23.
//

import Foundation

protocol GetEpisodesDetailUseCaseProtocol {
    func execute(forIDs ids: [Int]) async -> Result<EpisodeList, CustomError>
}
