//
//  SearchViewModelTests.swift
//  SuperheroTests
//
//  Created by Innocent Magagula on 2020/05/22.
//  Copyright © 2020 Innocent Magagula. All rights reserved.
//

import XCTest
import Cuckoo
import Moya
import Nimble
@testable import Superhero

class SearchViewModelTests: XCTestCase {

    let searchManager = MockSearchManager()
    let mockOutputs: SearchViewModelOutput = MockSearchViewModelOutput()
    let repositoryMock = RepositoryMock()
    var service: DefaultSearchViewModel!

    override func setUp() {
        super.setUp()
        let apiSuccessMock = repositoryMock.mockNetworkResponse(statusCode: 200, filename: "SuccessResponse")
        setupMock(mock: apiSuccessMock)
    }

    private func setupMock(mock: EndpointSampleResponse) {
        let repository = repositoryMock.mockRepository(mock: mock)
        service = DefaultSearchViewModel(searchRespository: repository, searchManager: searchManager)
    }

    func testSearchShouldSetMessageToEmptyWhenQueryIsEmpty() {
        service.search(superhero: "")
        XCTAssertEqual(service.message.value, "")
        XCTAssertFalse(service.loading.value)
    }

    func testSearchShouldDebounceAllRequests() {
        stub(searchManager) {
            when($0.debounce(forSearch: anyString(), action: anyClosure())).thenDoNothing()
        }
        service.search(superhero: "Batman")

        verify(searchManager).debounce(forSearch: anyString(), action: anyClosure())
        XCTAssertEqual(service.message.value, "")
        XCTAssertFalse(service.loading.value)
    }

    func testSearchShouldSetSuperheroItemsOnApiSuccess() {
        let apiSuccessMock = repositoryMock.mockNetworkResponse(statusCode: 200, filename: "SuccessResponse")
        setupMock(mock: apiSuccessMock)
        waitUntil { done in
            self.service.performSearch(query: "Batman")
            expect(self.service.items.value.count) > 0
            XCTAssertEqual(self.service.message.value, "")
            XCTAssertFalse(self.service.loading.value)
            done()
        }
    }

    func testPerfomRequestShouldSetMessageOnKnownApiError() {
        let apiSuccessMock = repositoryMock.mockNetworkResponse(statusCode: 200, filename: "NoSearchResults")
        setupMock(mock: apiSuccessMock)
        waitUntil { done in
            self.service.performSearch(query: "Batman")
            expect(self.service.items.value.count) == 0
            XCTAssertEqual(self.service.message.value, "No character found for search")
            done()
        }
    }

    func testPerfomRequestShouldSetErrorOnWhenUnknownApiErrorHasError() {
        let apiSuccessMock = repositoryMock.mockErrorResponse(errorCode: -999)
        setupMock(mock: apiSuccessMock)
        waitUntil { done in
            self.service.performSearch(query: "Batman")
            expect(self.service.items.value.count) == 0
            XCTAssertEqual(self.service.error.value, "mock error")
            done()
        }
    }

    func testSelectedItemShouldSetRouteWithShowDetail() {
        let biography = Biography(fullName: "superheor", aliases: ["1", "2"], firstAppearance: "first appearance")
        let image = Avatar(url: URL(string: "https://www.google.com")!)
        let superhero = Superhero(id: "1", name: "mock", biography: biography, image: image)
        service.items.value = [superhero]
        service.selectedItem(at: 0)

        switch self.service.route.value {
        case .none:
            fail("Current route showuld be .showDetails")
        case .showDetails:
            //testing the obvious, i think it's an overkill for enums to confirm to equatable
            expect(self.service.items.value.count) > 0
        }
    }
}
