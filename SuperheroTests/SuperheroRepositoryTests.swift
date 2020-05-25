//
//  SuperheroRepositoryTests.swift
//  SuperheroTests
//
//  Created by Innocent Magagula on 2020/05/23.
//  Copyright © 2020 Innocent Magagula. All rights reserved.
//

import XCTest
import Nimble
import Moya
@testable import Superhero

class SuperheroRepositoryTests: XCTestCase {

    let repository = RepositoryMock()
    override class func setUp() {
        super.setUp()
    }

    func testSearchWhenResponseIsSuccess() {
        waitUntil { done in
            let mock = self.repository.mockNetworkResponse(statusCode: 200, filename: "SuccessResponse")
            let repository = self.repository.mockRepository(mock: mock)
            repository.searchSuperhero(name: "many") { results in
                switch results {
                case .success(let response):
                    expect(response).to(beAnInstanceOf([Superhero].self))
                case .failure:
                    fail("Expected a successful response")
                }
                done()
            }
        }
    }

    func testSearchWhenThereIsNoSearchResults() {
        waitUntil { done in
            let mock = self.repository.mockNetworkResponse(statusCode: 200, filename: "NoSearchResults")
            let repository = self.repository.mockRepository(mock: mock)
            repository.searchSuperhero(name: "many") { results in
                switch results {
                case .success:
                    fail("Expected a error response")
                case .failure(let error):
                     expect(error).to(beAnInstanceOf(ApiError.self))
                     switch error {
                     case .known(let message):
                        expect(message).to(equal("no character found for search"))
                     case .unknown:
                        fail("Expected a know error response")
                     }
                }
                done()
            }
        }
    }

    func testSearchWhenThereIsApiError() {
        waitUntil { done in
            let mock = self.repository.mockNetworkResponse(statusCode: 500, filename: "")
            let repository = self.repository.mockRepository(mock: mock)
            repository.searchSuperhero(name: "many") { results in
                switch results {
                case .success:
                    fail("Expected a error response")
                case .failure(let error):
                     expect(error).to(beAnInstanceOf(ApiError.self))
                     switch error {
                     case .known:
                        fail("Expected a unknown error response")
                     case .unknown(let error):
                        expect(error?.localizedDescription).to(equal("The data couldn’t be read because it isn’t in the correct format."))
                     }
                }
                done()
            }
        }
    }

    func testSearchWhenThereIsNetworkError() {
        waitUntil { done in
            let mock = self.repository.mockErrorResponse(errorCode: 449)
            let repository = self.repository.mockRepository(mock: mock)
            repository.searchSuperhero(name: "many") { results in
                switch results {
                case .success:
                    fail("Expected a error response")
                case .failure(let error):
                     expect(error).to(beAnInstanceOf(ApiError.self))
                     switch error {
                     case .known:
                        fail("Expected a unknown error response")
                     case .unknown(let error):
                       expect(error?.localizedDescription).to(equal("mock error"))
                     }
                }
                done()
            }
        }
    }
}
