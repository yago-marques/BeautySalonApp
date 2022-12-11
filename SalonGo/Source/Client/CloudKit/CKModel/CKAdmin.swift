//
//  AdminEntity.swift
//  SalonGo
//
//  Created by Yago Marques on 07/12/22.
//

import Foundation
import CloudKit

struct CKAdmin: Codable, CKStructProtocol {
    let hash: String

    func makeValues() -> [Any] {
        return [self.hash]
    }

    static func makeWithRecord(record: CKRecord) -> CKStructProtocol? {
        if
            let hash = record["hash"] as? String
        {
            return CKAdmin(hash: hash)
        } else { return nil }
    }
}
