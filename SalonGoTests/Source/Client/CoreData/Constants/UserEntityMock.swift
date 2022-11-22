//
//  UserEntityMock.swift
//  SalonGoTests
//
//  Created by Yago Marques on 21/11/22.
//

import Foundation
@testable import SalonGo

struct UserEntityMock {
    static func getDefault(now: Date = Date()) -> User {
        .init(name: "yago", phoneNumber: "123", createdAt: now, updatedAt: now)
    }

    static func getUnique(withName: String) -> User {
        var user = UserEntityMock.getDefault()
        user.name = withName

        return user
    }
}
