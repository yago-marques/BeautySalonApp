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

    static func getUser(id: String) -> CKUser {
        .init(
            id: id,
            name: "",
            image: Data(),
            appointments: [],
            ratings: [],
            createdAt: Date(),
            updatedAt: Date()
        )
    }

    static func getService(id: String) -> CKService {
        .init(
            id: id,
            name: "",
            description: "",
            price: 0.00,
            createdAt: Date(),
            updatedAt: Date()
        )
    }

    static func getCompany(id: String) -> CKCompany {
        .init(
            id: id,
            appointments: [],
            services: [],
            createdAt: Date(),
            updatedAt: Date()
        )
    }

    static func getRating(id: String) -> CKRating {
        .init(
            id: id,
            companyId: "",
            score: 0,
            message: "",
            createdAt: Date(),
            updatedAt: Date()
        )
    }

    static func getAppointment(id: String) -> CKAppointment {
        .init(id: id,
              date: Date(),
              wasMade: true,
              wasCanceled: true,
              createdAt: Date(),
              updatedAt: Date()
        )
    }

}
