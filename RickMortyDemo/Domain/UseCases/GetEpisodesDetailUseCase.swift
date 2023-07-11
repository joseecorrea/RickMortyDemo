//
//  GetEpisodesDetailUseCase.swift
//  RickMortyDemo
//
//  Created by Jose E on 6/7/23.
//

import Foundation

class GetEpisodesDetailUseCase: GetEpisodesDetailUseCaseProtocol {
    
    private let service: EpisodeServiceProtocol = EpisodeService()
    
    func execute(forIDs ids: [Int]) async -> Result<EpisodeList, CustomError> {
        await service.getDetails(forIDs: ids)
    }
    
}
