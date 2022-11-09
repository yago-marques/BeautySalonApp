//
//  Account.swift
//  SalonGo
//
//  Created by Yago Marques on 08/11/22.
//

import Foundation

struct CKAccount: Codable, CKStructProtocol {
    let userId: String
    let email: String
    let password: String
    let isCompany: Bool
    let createdAt: Date
    let updatedAt: Date

    func makeValues() -> [Any] {
        return [
            self.userId,
            self.email,
            self.password,
            self.isCompany ? 1 : 0,
            self.createdAt,
            self.updatedAt
        ]
    }
}
