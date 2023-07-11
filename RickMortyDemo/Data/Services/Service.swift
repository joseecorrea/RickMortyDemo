//
//  Service.swift
//  RickMortyDemo
//
//  Created by Jose E on 7/7/23.
//

import Foundation

class Service: ServiceProtocol {
    
    internal var sharedSession: URLSession = URLSession.shared
    var baseUrl = Constants.Strings.empty
    
    func doRequest<T>(urlString: String, queryItems: [String : String]? = nil) async -> Result<T, CustomError> where T : Codable {
        guard var urlComponents = URLComponents(string: urlString) else { return .failure(.badUrl) }
        if let queryItems {
            urlComponents.queryItems = queryItems.compactMap { URLQueryItem(name: $0.key, value: $0.value) }
        }
        guard let url = urlComponents.url else { return .failure(.badUrl) }
        let request = URLRequest(url: url)
        do {
            let (data, response) = try await sharedSession.data(for: request)
            if (response as? HTTPURLResponse)?.statusCode == 200 {
                let list = try JSONDecoder().decode(T.self, from: data)
                return .success(list)
            } else {
                return .failure(.requestFailed)
            }
        } catch {
            return .failure(.badRequest)
        }
    }
    
    func setBaseUrl(url: String) {
        self.baseUrl = url
    }
    
}
