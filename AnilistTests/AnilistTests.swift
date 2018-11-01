//
//  AnilistTests.swift
//  AnilistTests
//
//  Created by NaotoIto on 2018/10/21.
//  Copyright © 2018 NaotoIto. All rights reserved.
//

import XCTest
@testable import Anilist

class AnilistTests: XCTestCase {
    
    let mediaSearchModel = MediaSearchModel()

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let expectation = self.expectation(description: "Fetch Media")
        mediaSearchModel.fetch(page: 1, seasonYear: 2018, season: .spring) { [weak self] mediaList in
            guard let `self` = self else {return}
            guard let first = mediaList?.media?.first else {return}
            expectation.fulfill()
            XCTAssertEqual(first?.fragments.mediaDetail.title?.native, "ハイスコアガール", "first item is \(String(describing: first?.fragments.mediaDetail.title?.native))")
        }
        self.waitForExpectations(timeout: 5, handler: nil)
        
//        wait(for: exception, timeout: 0.5)

    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
