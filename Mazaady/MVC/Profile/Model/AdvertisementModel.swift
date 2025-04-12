//
//  AdvertisementModel.swift
//  Mazaady
//
//  Created by Aya Baghdadi on 4/12/25.
//

import Foundation

// Advertisement Model
struct Advertisement: Codable {
    let id: Int
    let image: String
}

// Advertisements Response Model
struct AdvertisementsResponse: Codable {
    let advertisements: [Advertisement]
}
