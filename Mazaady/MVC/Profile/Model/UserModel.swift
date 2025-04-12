//
//  UserModel.swift
//  Mazaady
//
//  Created by Aya Baghdadi on 4/12/25.
//

import Foundation

// User Model
struct User: Codable {
    let id: Int
    let name: String
    let image: String
    let userName: String
    let followingCount: Int
    let followersCount: Int
    let countryName: String
    let cityName: String

    // Decoding keys to map JSON keys to Swift property names
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case image
        case userName = "user_name"
        case followingCount = "following_count"
        case followersCount = "followers_count"
        case countryName = "country_name"
        case cityName = "city_name"
    }
}
