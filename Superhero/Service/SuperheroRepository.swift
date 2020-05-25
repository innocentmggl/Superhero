//
//  SuperheroRepository.swift
//  Superhero
//
//  Created by Innocent Magagula on 2020/05/22.
//  Copyright © 2020 Innocent Magagula. All rights reserved.
//

import Foundation
import Moya

enum ApiError: Error {
    case known(String?)
    case unknown(Error?)
}

/// This is a protocol that all superhero datasources  must conform to
protocol SuperheroRepository {
    var provider: MoyaProvider<SuperheroApi> { get }
    var requests: Box<[Cancellable]> {get}
    func searchSuperhero(name: String, completion: @escaping (Result<[Superhero], ApiError>) -> Void)
}

struct SuperheroRepositoryImplementation: SuperheroRepository {
    let provider: MoyaProvider<SuperheroApi>
    let requests: Box<[Cancellable]> = Box([Cancellable]())
    init(provider: MoyaProvider<SuperheroApi>) {
        self.provider = provider
    }
    func searchSuperhero(name: String, completion: @escaping (Result<[Superhero], ApiError>) -> Void) {
        let request = provider.request(.search(name: name)) { result in
            switch result {
            case .success(let response):
                let data = self.parseResponse(response: response)
                completion(data)
            case .failure(let moyaError):
                if !self.isCancelledRequestError(response: moyaError) {
                    completion(Result.failure(.unknown(moyaError)))
                }
            }
        }
        self.requests.value.append(request)
    }

    ///mapping of api response 
    private func parseResponse(response: Response) -> Result<[Superhero], ApiError> {
        do {
            let decoder = JSONDecoder()
            let res = try decoder.decode(SuperheroResponse.self, from: response.data)
            if let error = res.error {
                return Result.failure(.known(error))
            } else if let heros = res.results {
                return Result.success(heros)
            } else {
                return Result.failure(.unknown(nil))
            }
        } catch let error {
            return Result.failure(.unknown(error))
        }
    }

    /// check if request is cancelled
    private func isCancelledRequestError(response: MoyaError) -> Bool {
        switch response {
        case .underlying(let error, _):
            switch error.asAFError {
            case .explicitlyCancelled:
                return true
            default:
                return false
            }
        default:
            return false
        }
    }
}
