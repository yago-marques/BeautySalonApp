//
//  File.swift
//  SalonGo
//
//  Created by Yago Marques on 08/11/22.
//

import Foundation
import CloudKit

struct CKUser: Codable, CKStructProtocol {
    let id: String
    let name: String
    let image: Data
    let appointments: [String]
    let ratings: [String]
    let createdAt: Date
    let updatedAt: Date

    func makeValues() -> [Any] {
        return [
            self.id,
            self.name,
            self.image,
            self.appointments,
            self.ratings,
            self.createdAt,
            self.updatedAt
        ]
    }

    static func makeWithRecord(record: CKRecord) -> CKStructProtocol? {
        if
            let id = record["id"] as? String,
            let name = record["name"] as? String,
            let image = record["image"] as? Data,
            let appointments = record["appointments"] as? [String],
            let ratings = record["ratings"] as? [String],
            let createdAt = record["createdAt"] as? Date,
            let updatedAt = record["updatedAt"] as? Date
        {
            return CKUser(
                id: id,
                name: name,
                image: image,
                appointments: appointments,
                ratings: ratings,
                createdAt: createdAt,
                updatedAt: updatedAt
            )
        } else { return nil }
    }
}
