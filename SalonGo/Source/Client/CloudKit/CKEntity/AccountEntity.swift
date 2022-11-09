//
//  AccountEntity.swift
//  SalonGo
//
//  Created by Yago Marques on 09/11/22.
//

import Foundation

struct AccountEntity: CKEntityProtocol {
    var type: CloudKitEntityTypes = .account

    var body: Data = Data()

    init(account: CKAccount) {
        let data = try? JSONEncoder().encode(account)
        if let data { self.body = data }
    }
}
