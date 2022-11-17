//
//  Appointment.swift
//  SalonGo
//
//  Created by Yago Marques on 08/11/22.
//

import Foundation
import CloudKit

struct CKAppointment: Codable, CKStructProtocol {
    let id: String
    let date: Date
    let wasMade: Bool
    let wasCanceled: Bool
    let createdAt: Date
    let updatedAt: Date

    func makeValues() -> [Any] {
        return [
            self.id,
            self.date,
            self.wasMade,
            self.wasCanceled,
            self.createdAt,
            self.updatedAt
        ]
    }

    static func makeWithRecord(record: CKRecord) -> CKStructProtocol? {
        if
            let id = record["id"] as? String,
            let date = record["date"] as? Date,
            let wasMade = record["wasMade"] as? Int,
            let wasCanceled = record["wasCanceled"] as? Int,
            let createdAt = record["createdAt"] as? Date,
            let updatedAt = record["updatedAt"] as? Date
        {
            return CKAppointment(
                id: id,
                date: date,
                wasMade: wasMade == 1 ? true : false,
                wasCanceled: wasCanceled == 1 ? true : false,
                createdAt: createdAt,
                updatedAt: updatedAt
            )
        } else { return nil }
    }
}
