//
//  Service.swift
//  SalonGo
//
//  Created by Yago Marques on 08/11/22.
//

import Foundation

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
}
