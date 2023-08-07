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
        service = Service()
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
        case .failure(let failure):
            XCTAssertEqual(failure, CustomError.badUrl)
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
        } catch(let customError) {
            XCTAssertNotNil(customError as? CustomError)
        }
    }

}
