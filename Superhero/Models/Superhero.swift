//
//  Superhero.swift
//  Superhero
//
//  Created by Innocent Magagula on 2020/05/22.
//  Copyright © 2020 Innocent Magagula. All rights reserved.
//

import Foundation

struct Superhero {
    let id: String
    let name: String
    let powerStats: PowerStats
    let biography: Biography
    let image: Avatar
}

extension Superhero: Decodable {
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case powerStats = "powerstats"
        case biography
        case image
    }
}

extension Superhero: Hashable {
    static func == (lhs: Superhero, rhs: Superhero) -> Bool {
        return lhs.id == rhs.id
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}

struct PowerStats {
    let intelligence: String?
    let strength: String?
    let speed: String?
    let durability: String?
    let power: String?
    let combat: String?
}

extension PowerStats: Decodable {
    enum CodingKeys: String, CodingKey {
        case intelligence
        case strength
        case speed
        case durability
        case power
        case combat
    }
}

struct Biography {
    let fullName: String?
    let aliases: [String]
    let firstAppearance: String
}

extension Biography: Decodable {
    enum CodingKeys: String, CodingKey {
        case fullName = "full-name"
        case aliases
        case firstAppearance = "first-appearance"
    }
}

struct Avatar {
    let url: URL
}
extension Avatar: Decodable {
    enum AvatarCodingKeys: String, CodingKey {
        case url
    }
}
