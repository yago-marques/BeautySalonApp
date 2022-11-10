//
//  Service.swift
//  SalonGo
//
//  Created by Yago Marques on 08/11/22.
//

import Foundation
import CloudKit

struct CKService: Codable, CKStructProtocol {
    let id: String
    let name: String
    let description: String
    let price: Double
    let createdAt: Date
    let updatedAt: Date

    func makeValues() -> [Any] {
        return [
            self.id,
            self.name,
            self.description,
            self.price,
            self.createdAt,
            self.updatedAt
        ]
    }

    static func makeWithRecord(record: CKRecord) -> CKStructProtocol? {
        if
            let id = record["id"] as? String,
            let name = record["name"] as? String,
            let description = record["description"] as? String,
            let price = record["price"] as? Double,
            let createdAt = record["createdAt"] as? Date,
            let updatedAt = record["updatedAt"] as? Date
        {
            return CKService(
                id: id,
                name: name,
                description: description,
                price: price,
                createdAt: createdAt,
                updatedAt: updatedAt
            )
        } else { return nil }
    }
}
