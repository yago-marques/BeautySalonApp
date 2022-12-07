//
//  EntityFields.swift
//  SalonGo
//
//  Created by Yago Marques on 08/11/22.
//

import Foundation

struct EntityFields {
    let account = [
        "userId",
        "email",
        "password",
        "isCompany",
        "createdAt",
        "updatedAt"
    ]

    let admin = ["hash"]

    let user = [
        "id",
        "name",
        "image",
        "appointments",
        "ratings",
        "createdAt",
        "updatedAt"
    ]

    let company = [
        "id",
        "appointments",
        "services",
        "createdAt",
        "updatedAt"
    ]

    let appointment = [
        "id",
        "date",
        "wasMade",
        "wasCanceled",
        "createdAt",
        "updatedAt"
    ]

    let rating = [
        "id",
        "companyId",
        "score",
        "message",
        "createdAt",
        "updatedAt"
    ]

    let service = [
        "id",
        "name",
        "description",
        "price",
        "createdAt",
        "updatedAt"
    ]
}
