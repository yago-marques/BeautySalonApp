//
//  Rating.swift
//  SalonGo
//
//  Created by Yago Marques on 08/11/22.
//

import Foundation
import CloudKit

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

    static func makeWithRecord(record: CKRecord) -> CKStructProtocol? {
        if
            let id = record["id"] as? String,
            let companyId = record["companyId"] as? String,
            let score = record["score"] as? Int,
            let message = record["message"] as? String,
            let createdAt = record["createdAt"] as? Date,
            let updatedAt = record["updatedAt"] as? Date
        {
            return CKRating(
                id: id,
                companyId: companyId,
                score: score,
                message: message,
                createdAt: createdAt,
                updatedAt: updatedAt
            )
        } else { return nil }
    }
}
