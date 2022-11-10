//
//  CompanyEntity.swift
//  SalonGo
//
//  Created by Yago Marques on 09/11/22.
//

import Foundation

struct CompanyEntity: CKEntityProtocol {
    var type: CloudKitEntityTypes = .company

    var body: Data = Data()

    init(company: CKCompany) {
        let data = try? JSONEncoder().encode(company)
        if let data { self.body = data }
    }
}
