//
//  Company.swift
//  SalonGo
//
//  Created by Yago Marques on 08/11/22.
//

import Foundation

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
}
