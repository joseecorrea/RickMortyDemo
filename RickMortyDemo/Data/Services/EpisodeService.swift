//
//  EpisodeService.swift
//  RickMortyDemo
//
//  Created by Jose E on 6/7/23.
//

import Foundation

class EpisodeService: Service, EpisodeServiceProtocol {

    override init(urlSession: URLSession = URLSession.shared, baseUrl: String = Constants.Urls.episodes) {
        super.init(urlSession: urlSession, baseUrl: baseUrl)
    }
    
    func getDetails(forIDs ids: [Int]) async -> Result<EpisodeList, CustomError> {
        let path = "\(ids)".replacingOccurrences(of: Constants.Strings.emptySpace, with: Constants.Strings.empty)
        return await doRequest(path: path)
    }

}
