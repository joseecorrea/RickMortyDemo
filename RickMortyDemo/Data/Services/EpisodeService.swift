//
//  EpisodeService.swift
//  RickMortyDemo
//
//  Created by Jose E on 6/7/23.
//

import Foundation

class EpisodeService: Service, EpisodeServiceProtocol {

    override init() {
        super.init()
        self.baseUrl = Constants.Urls.episodes
    }
    
    func getDetails(forIDs ids: [Int]) async -> Result<EpisodeList, CustomError> {
        let string = "\(baseUrl)/\(ids)".replacingOccurrences(of: Constants.Strings.emptySpace, with: Constants.Strings.empty)
        return await doRequest(urlString: string)
    }

}
