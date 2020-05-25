//
//  RepositoryMock.swift
//  SuperheroTests
//
//  Created by Innocent Magagula on 2020/05/24.
//  Copyright © 2020 Innocent Magagula. All rights reserved.
//

import Foundation
import Moya
@testable import Superhero

class RepositoryMock {

    func mockRepository(mock: EndpointSampleResponse) -> SuperheroRepository {
        let endpointClosure = { (target: SuperheroApi) -> Endpoint in
          return Endpoint(url: URL(target: target).absoluteString,
                          sampleResponseClosure: { mock },
                          method: target.method,
                          task: target.task,
                          httpHeaderFields: target.headers)
        }
        let provider = MoyaProvider<SuperheroApi>(endpointClosure: endpointClosure, stubClosure: MoyaProvider.immediatelyStub)
        return SuperheroRepositoryImplementation(provider: provider)
    }

    func mockData(filename: String) -> Data {
        guard !filename.isEmpty else {
            return Data()
        }
        let bundle = Bundle(for: SuperheroRepositoryTests.self)
        let path = bundle.path(forResource: filename, ofType: "json")
        let url = URL(fileURLWithPath: path!)
        guard let data = try? Data(contentsOf: url) else {
            return Data()
        }
        return data
    }

    func mockNetworkResponse(statusCode: Int, filename: String) -> EndpointSampleResponse {
      return .networkResponse(statusCode, mockData(filename: filename))
    }

    func mockErrorResponse(errorCode: Int) -> EndpointSampleResponse {
        return .networkError(.init(domain: "com.innocent.Superhero", code: errorCode, userInfo: [NSLocalizedDescriptionKey : "mock error"]))
    }
}
