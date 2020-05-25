//
//  SearchManagerTest.swift
//  SuperheroTests
//
//  Created by Innocent Magagula on 2020/05/22.
//  Copyright © 2020 Innocent Magagula. All rights reserved.
//

import XCTest
@testable import Superhero

class SearchManagerTest: XCTestCase {

    let manager = DefaultSearchManager()

    func testDebounceCallback() {
        let results = expectation(description: "Schedule work and runs the callback closure")
        manager.debounce(forSearch: "Superhero") {
            results.fulfill()
        }
        waitForExpectations(timeout: 1) { error in
            if let error = error {
                XCTFail("waitForExpectationsWithTimeout errored: \(error)")
            }
        }
    }

    func testDebounceShouldOnlyExecuteCallbackOnce() {
        let results = expectation(description: "Schedule work and runs the callback closure")
        results.expectedFulfillmentCount = 1
        manager.debounce(forSearch: "Superhero") {
            results.fulfill()
        }
        manager.debounce(forSearch: "Superhero") {
            results.fulfill()
        }
        waitForExpectations(timeout: 1) { error in
            if let error = error {
                XCTFail("waitForExpectationsWithTimeout errored: \(error)")
            }
        }
    }

    func testDebounceShouldNotFulfillIfWaitingTimeIsLessThanDebounceTime() {
        let manager = DefaultSearchManager(delay: .seconds(2), queue: .main)
        let results = expectation(description: "Schedule work and runs the callback closure")
        results.expectedFulfillmentCount = 1
        results.fulfill()
        manager.debounce(forSearch: "Superhero") {
            results.fulfill()
        }
        waitForExpectations(timeout: 1) { error in
            if let error = error {
                XCTFail("waitForExpectationsWithTimeout errored: \(error)")
            }
        }
    }
}
