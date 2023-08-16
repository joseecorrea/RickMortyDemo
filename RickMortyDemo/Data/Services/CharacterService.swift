//
//  CharacterService.swift
//  RickMortyDemo
//
//  Created by Jose E on 4/7/23.
//

import Foundation

class CharacterService: Service, CharacterServiceProtocol {
    
    override init(urlSession: URLSession = URLSession.shared) {
        super.init(urlSession: urlSession)
        self.baseUrl = Constants.Urls.character
    }
    
    private var nextPage: String?
    private var previusPage: String?
    
    func getPage() async -> Result<Characters, CustomError> {
        let string = previusPage == nil ? (nextPage != nil ? nextPage ?? Constants.OptionalUnwrap.basic : baseUrl) : nextPage ?? Constants.OptionalUnwrap.basic
        let result: Result<CharacterList,CustomError> = await doRequest(urlString: string)
        return evaluateResult(result: result)
    }
    
    func searchCharacter(byName name: String) async -> Result<Characters, CustomError> {
        let string = previusPage == nil ? (nextPage != nil ? nextPage ?? Constants.OptionalUnwrap.basic : baseUrl) : nextPage ?? Constants.OptionalUnwrap.basic
        let result: Result<CharacterList,CustomError> = await doRequest(urlString: string, queryItems: nextPage != nil ? nil : [Constants.Strings.name:name])
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
