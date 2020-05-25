//
//  SuperheroResponse.swift
//  Superhero
//
//  Created by Innocent Magagula on 2020/05/22.
//  Copyright © 2020 Innocent Magagula. All rights reserved.
//

import Foundation

/// Structure responsible for mapping search response
struct SuperheroResponse {
    let response: String
    let characterName: String?
    let error: String?
    let results: [Superhero]?
}

extension SuperheroResponse: Decodable {
    enum CodingKeys: String, CodingKey {
        case response
        case error
        case characterName = "results-for"
        case results
    }
}
