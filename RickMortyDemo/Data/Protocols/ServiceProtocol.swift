//
//  ServiceProtocol.swift
//  RickMortyDemo
//
//  Created by Jose E on 7/7/23.
//

import Foundation

protocol ServiceProtocol {
    var sharedSession: URLSession { get }
    var baseUrl: String { get }
    func doRequest<T: Codable>(urlString: String, queryItems: [String:String]?) async -> Result<T, CustomError>
}
