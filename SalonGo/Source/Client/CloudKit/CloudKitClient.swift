//
//  CloudKitClient.swift
//  SalonGo
//
//  Created by Yago Marques on 08/11/22.
//

import Foundation
import CloudKit

final class CloudKitClient {

    let container = CKContainer.default()

    func create(_ account: Account, completion: @escaping (Error?) -> Void) {
        let record = CKRecord(recordType: "Account")

        record.setValue(account.userId, forKey: "userId")
        record.setValue(account.email, forKey: "email")
        record.setValue(account.password, forKey: "password")
        record.setValue(account.isCompany ? 1 : 0, forKey: "isCompany")
        record.setValue(account.createdAt, forKey: "createdAt")
        record.setValue(account.updatedAt, forKey: "updatedAt")

        container.publicCloudDatabase.save(record) { (_, error) in
            completion(error)
        }
    }
}
