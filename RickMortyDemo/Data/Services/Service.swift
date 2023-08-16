//
//  Service.swift
//  RickMortyDemo
//
//  Created by Jose E on 7/7/23.
//

import Foundation

enum CustomError: Error {
    case badRequest
    case requestFailed
    case badUrl
}

class Service: ServiceProtocol {
    
    private var urlSession: URLSession
    var baseUrl = Constants.Strings.empty
    
    init(urlSession: URLSession = URLSession.shared) {
        self.urlSession = urlSession
    }
    
    func makeRequest(urlString: String, queryItems: [String : String]? = nil) -> Result<URLRequest, CustomError> {
        guard var urlComponents = URLComponents(string: urlString) else { return .failure(.badUrl) }
        if let queryItems {
            urlComponents.queryItems = queryItems.compactMap { URLQueryItem(name: $0.key, value: $0.value) }
        }
        guard let url = urlComponents.url else { return .failure(.badUrl) }
        return .success(URLRequest(url: url))
    }
    
    func parseResponse<T>(data: Data) throws -> T where T : Codable {
        return try JSONDecoder().decode(T.self, from: data)
    }
    
    func doRequest<T>(urlString: String, queryItems: [String : String]? = nil) async -> Result<T, CustomError> where T : Codable {
        let result: Result<URLRequest, CustomError> = makeRequest(urlString: urlString, queryItems: queryItems)
        switch result {
        case .success(let request):
            do {
                let (data, response) = try await urlSession.data(for: request)
                if (response as? HTTPURLResponse)?.statusCode == 200 {
                    return .success(try parseResponse(data: data)) 
                } else {
                    return .failure(.requestFailed)
                }
            } catch(let customError) {
                if let customError = customError as? CustomError {
                    return .failure(customError)
                }
                return .failure(.badRequest)
            }
        case .failure(let failure):
            return .failure(failure)
        }
    }
    
    func setBaseUrl(url: String) {
        self.baseUrl = url
    }
    
}
