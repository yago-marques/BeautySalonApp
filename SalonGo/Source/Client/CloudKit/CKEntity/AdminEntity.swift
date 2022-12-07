//
//  AdminEntity.swift
//  SalonGo
//
//  Created by Yago Marques on 07/12/22.
//

import Foundation

struct AdminEntity: CKEntityProtocol {
    var type: CloudKitEntityTypes = .admin

    var body: Data = Data()

    init(admin: CKAdmin) {
        let data = try? JSONEncoder().encode(admin)
        if let data { self.body = data }
    }
}
