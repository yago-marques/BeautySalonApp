//
//  ServiceEntity.swift
//  SalonGo
//
//  Created by Yago Marques on 09/11/22.
//

import Foundation

struct ServiceEntity: CKEntityProtocol {
    var type: CloudKitEntityTypes = .service

    var body: Data = Data()

    init(service: CKService) {
        let data = try? JSONEncoder().encode(service)
        if let data { self.body = data }
    }
}
