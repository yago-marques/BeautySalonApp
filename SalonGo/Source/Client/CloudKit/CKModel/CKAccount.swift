//
//  Account.swift
//  SalonGo
//
//  Created by Yago Marques on 08/11/22.
//

import Foundation
import CloudKit

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

    static func makeWithRecord(record: CKRecord) -> CKStructProtocol? {
        if
            let userId = record["userId"] as? String,
            let email = record["email"] as? String,
            let password = record["password"] as? String,
            let isCompany = record["isCompany"] as? Int,
            let createdAt = record["createdAt"] as? Date,
            let updatedAt = record["updatedAt"] as? Date
        {
            return CKAccount(
                userId: userId,
                email: email,
                password: password,
                isCompany: isCompany == 1 ? true : false,
                createdAt: createdAt,
                updatedAt: updatedAt
            )
        } else { return nil }
    }
}
