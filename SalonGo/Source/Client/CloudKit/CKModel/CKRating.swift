//
//  Rating.swift
//  SalonGo
//
//  Created by Yago Marques on 08/11/22.
//

import Foundation

struct CKRating: Codable, CKStructProtocol {
    let id: String
    let companyId: String
    let score: Int
    let message: String
    let createdAt: Date
    let updatedAt: Date

    func makeValues() -> [Any] {
        return [
            self.id,
            self.companyId,
            self.score,
            self.message,
            self.createdAt,
            self.updatedAt
        ]
    }
}
