//
//  UserEntity.swift
//  SalonGo
//
//  Created by Yago Marques on 09/11/22.
//

import Foundation

struct UserEntity: CKEntityProtocol {
    var type: CloudKitEntityTypes = .user

    var body: Data = Data()

    init(user: CKUser) {
        let data = try? JSONEncoder().encode(user)
        if let data { self.body = data }
    }
}
