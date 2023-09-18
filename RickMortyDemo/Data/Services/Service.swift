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
    case unknownError
    
    init(error: Error) {
        if let customError = error as? CustomError {
            self = customError
        } else {
            self = .unknownError
        }
    }
}

class Service: ServiceProtocol {
    
    internal var urlSession: URLSession
    internal var baseUrl: String
    
    init(urlSession: URLSession = URLSession.shared, baseUrl: String = Constants.Strings.empty) {
        self.urlSession = urlSession
        self.baseUrl = baseUrl
    }
    
    func makeRequest(path: String? = nil, queryItems: [String : String]? = nil) -> Result<URLRequest, CustomError> {
        guard var urlComponents = URLComponents(string: baseUrl) else { return .failure(.badUrl) }
        if let path {
            urlComponents.path = path
        }
        if let queryItems {
            urlComponents.queryItems = queryItems.compactMap { URLQueryItem(name: $0.key, value: $0.value) }
        }
        guard let url = urlComponents.url else { return .failure(.badUrl) }
        return .success(URLRequest(url: url))
    }
    
    func parseResponse<T>(data: Data) throws -> T where T : Codable {
        return try JSONDecoder().decode(T.self, from: data)
    }
    
    func doRequest<T>(path: String? = nil, queryItems: [String : String]? = nil) async -> Result<T, CustomError> where T : Codable {
        let result: Result<URLRequest, CustomError> = makeRequest(path: path, queryItems: queryItems)
        switch result {
        case .success(let request):
            do {
                let (data, response) = try await urlSession.data(for: request)
                if (response as? HTTPURLResponse)?.statusCode == 200 {
                    return .success(try parseResponse(data: data)) 
                } else {
                    return .failure(.badRequest)
                }
            } catch(let customError) {
                return .failure(CustomError(error: customError))
            }
        case .failure(let failure):
            return .failure(failure)
        }
    }
    
}
