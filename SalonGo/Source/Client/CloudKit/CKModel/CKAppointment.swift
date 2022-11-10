//
//  Appointment.swift
//  SalonGo
//
//  Created by Yago Marques on 08/11/22.
//

import Foundation

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
}
