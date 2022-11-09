//
//  RatingEntity.swift
//  SalonGo
//
//  Created by Yago Marques on 09/11/22.
//

import Foundation

struct RatingEntity: CKEntityProtocol {
    var type: CloudKitEntityTypes = .rating

    var body: Data = Data()

    init(rating: CKRating) {
        let data = try? JSONEncoder().encode(rating)
        if let data { self.body = data }
    }
}
