//
//  ProductsModel.swift
//  Mazaady
//
//  Created by Aya Baghdadi on 4/12/25.
//

import Foundation

// Product Model
struct Product: Codable {
    let id: Int
    let name: String
    let image: String
    let price: Double
    let currency: String
    let offer: Double?
    let endDate: Double?

    enum CodingKeys: String, CodingKey {
        case id
        case name
        case image
        case price
        case currency
        case offer
        case endDate = "end_date"
    }
}
