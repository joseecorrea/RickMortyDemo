//
//  RickMortyDemoTests.swift
//  RickMortyDemoTests
//
//  Created by Jose E on 7/8/23.
//

import XCTest

final class RickMortyDemoServiceTests: XCTestCase {
    
    var service: Service!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        let configuration = URLSessionConfiguration.ephemeral
        configuration.protocolClasses = [MockURLProtocol.self]
        let urlSession = URLSession.init(configuration: configuration)
        service = Service(urlSession: urlSession)
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testMakeRequest() async {
        let urlString = "https://www.google.com"
        let queryItems: [String : String]? = [
            "name": "Test1"
        ]
        let result: Result<URLRequest, CustomError> = service.makeRequest(urlString: urlString, queryItems: queryItems)
        switch result {
        case .success(let request):
            XCTAssertEqual(request.url?.absoluteString, "\(urlString)?name=Test1")
        case .failure(_):
            XCTFail()
        }
    }
    
    func testParseResponse() async throws {
        guard let jsonData = Utils.readLocalJSONFile(forName: Constants.FileName.homeData) else {
            return
        }
        do {
            let parseJson: HomeData = try service.parseResponse(data: jsonData)
            XCTAssertEqual(parseJson.title, "Rick and Morty")
            XCTAssertEqual(parseJson.creators?.count ?? 0, 2)
        } catch(_) {
            XCTFail()
        }
    }
    
    func testDoRequest() async throws {
        guard let jsonData = Utils.readLocalJSONFile(forName: Constants.FileName.homeData) else {
            return
        }
        
        MockURLProtocol.requestHandler = { request in
            guard let url = request.url else {
                throw CustomError.badRequest
            }
            
            let response = HTTPURLResponse(url: url, statusCode: 200, httpVersion: nil, headerFields: nil)!
            return (response, jsonData)
        }
        
        let result: Result<HomeData,CustomError> = await service.doRequest(urlString: "https://www.google.com")
        switch result {
        case .success(let response):
            XCTAssertEqual(response.title, "Rick and Morty")
            XCTAssertEqual(response.creators?.count ?? 0, 2)
        case .failure(_):
            XCTFail()
        }
    }

}
