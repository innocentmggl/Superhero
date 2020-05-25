//
//  SuperheroApi.swift
//  Superhero
//
//  Created by Innocent Magagula on 2020/05/22.
//  Copyright © 2020 Innocent Magagula. All rights reserved.
//

import Foundation
import Moya

enum SuperheroApi {
    case search(name: String)
}

// MARK: - TargetType Protocol Implementation 
extension SuperheroApi: TargetType {
    var baseURL: URL { return URL(string: "\(AppConfigurations.shared.apiBaseUrl)/\(AppConfigurations.shared.accessToken)")! }
    var path: String {
        switch self {
        case .search(let name):
            return "/search/\(name)"
        }
    }
    var method: Moya.Method {
        switch self {
        case .search:
            return .get
        }
    }
    var task: Task {
        switch self {
        case .search:
            return .requestPlain
       }
    }

    var sampleData: Data {
        switch self {
        case .search:
            return Data()
        }
    }
    var headers: [String: String]? {
        return ["Content-type": "application/json"]
    }
}
