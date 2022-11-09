//
//  TestsConstants.swift
//  SalonGoTests
//
//  Created by Yago Marques on 08/11/22.
//

import Foundation
@testable import SalonGo

struct EntityMocks {
    static func getAccount(id: String) -> CKAccount {
        .init(
            userId: id,
            email: "",
            password: "",
            isCompany: true,
            createdAt: Date(),
            updatedAt: Date()
        )
    }
}
