//
//  TagsModel.swift
//  Mazaady
//
//  Created by Aya Baghdadi on 4/12/25.
//

import Foundation

// Tag Model
struct Tag: Codable {
    let id: Int
    let name: String
}

// Response Model that holds the array of tags
struct ResponseModel: Codable {
    let tags: [Tag]
}
