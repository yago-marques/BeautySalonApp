//
//  File.swift
//  SalonGo
//
//  Created by Yago Marques on 08/11/22.
//

import Foundation

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
}
