//
//  Company.swift
//  SalonGo
//
//  Created by Yago Marques on 08/11/22.
//

import Foundation
import CloudKit

struct CKCompany: Codable, CKStructProtocol {
    let id: String
    let appointments: [String]
    let services: [String]
    let createdAt: Date
    let updatedAt: Date

    func makeValues() -> [Any] {
        return [
            self.id,
            self.appointments,
            self.services,
            self.createdAt,
            self.updatedAt
        ]
    }

    static func makeWithRecord(record: CKRecord) -> CKStructProtocol? {
        if
            let id = record["id"] as? String,
            let appointments = record["appointments"] as? [String],
            let services = record["services"] as? [String],
            let createdAt = record["createdAt"] as? Date,
            let updatedAt = record["updatedAt"] as? Date
        {
            return CKCompany(
                id: id,
                appointments: appointments,
                services: services,
                createdAt: createdAt,
                updatedAt: updatedAt
            )
        } else { return nil }
    }
}
