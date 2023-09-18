//
//  CharacterService.swift
//  RickMortyDemo
//
//  Created by Jose E on 4/7/23.
//

import Foundation

class CharacterService: Service, CharacterServiceProtocol {
    
    override init(urlSession: URLSession = URLSession.shared, baseUrl: String = Constants.Urls.character) {
        super.init(urlSession: urlSession, baseUrl: baseUrl)
    }
    
    private var nextPage: String?
    private var previusPage: String?
    
    func getPage() async -> Result<Characters, CustomError> {
        if let nextPage { baseUrl = nextPage }
        let result: Result<CharacterList,CustomError> = await doRequest()
        return evaluateResult(result: result)
    }
    
    func searchCharacter(byName name: String) async -> Result<Characters, CustomError> {
        if let nextPage { baseUrl = nextPage }
        let result: Result<CharacterList,CustomError> = await doRequest(queryItems: nextPage != nil ? nil : [Constants.Strings.name:name])
        return evaluateResult(result: result)
    }
    
    private func evaluateResult(result: Result<CharacterList, CustomError>) -> Result<Characters, CustomError> {
        switch result {
        case .success(let list):
            nextPage = list.info?.next
            previusPage = list.info?.prev
            return .success(list.characters ?? [])
        case .failure(let failure):
            return .failure(failure)
        }
    }
    
    func isNextPageAvailable() -> Bool {
        nextPage != nil
    }
    
    func clearSearch() {
        previusPage = nil
        nextPage = nil
    }
    
}
