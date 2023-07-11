//
//  CharacterDetailViewModel.swift
//  RickMortyDemo
//
//  Created by Jose E on 6/7/23.
//

import Foundation

@MainActor
class CharacterDetailViewModel: ObservableObject {
    
    private let getEpisodesDetail: GetEpisodesDetailUseCaseProtocol = GetEpisodesDetailUseCase()
    @Published var episodesDetail: EpisodeList = []
    @Published var errorHappend: Bool = false
 
    
    func getEpisodesDetail(forCharacter character: Character) {
        Task {
            let ids: [Int] = character.episode?.compactMap({ Int($0.split(separator: "/").last ?? Substring(stringLiteral: Constants.OptionalUnwrap.basic)) }) ?? []
            let result = await getEpisodesDetail.execute(forIDs:ids)
            switch result {
            case .success(let episodesDetail):
                self.episodesDetail = episodesDetail
            case .failure(let error):
                errorHappend = true
                debugPrint(error)
            }
        }
    }
    
}
