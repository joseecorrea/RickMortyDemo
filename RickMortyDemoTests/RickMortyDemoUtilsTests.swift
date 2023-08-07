//
//  RickMortyDemoUtilsTests.swift
//  RickMortyDemoTests
//
//  Created by Jose E on 7/8/23.
//

import XCTest

final class RickMortyDemoUtilsTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func getCharacterTest() {
        let character = Utils.getCharacter()
        XCTAssertEqual(character.name, "Glockenspiel Morty")
    }
    
    func getEpisodeTest() {
        let episode = Utils.getEpisode()
        XCTAssertEqual(episode.name, "Pilot")
    }
    
    func readJSONTest() {
        let jsonData = Utils.readLocalJSONFile(forName: Constants.FileName.homeData)
        XCTAssertNotNil(jsonData)
    }
    
    func parseJSON() {
        guard let jsonData = Utils.readLocalJSONFile(forName: Constants.FileName.homeData) else {
            return
        }
        let parseJson: HomeData? = Utils.parseJSON(jsonData: jsonData)
        XCTAssertNotNil(jsonData)
        guard let parseJson else { return }
        XCTAssertEqual(parseJson.title, "Rick and Morty")
        XCTAssertEqual(parseJson.creators?.count ?? 0, 2)
    }

}
