//
//  CloudKitClient.swift
//  SalonGo
//
//  Created by Yago Marques on 08/11/22.
//

import Foundation
import CloudKit

enum CloudKitError: Error {
    case invalidEntity
}

final class CloudKitClient: RemoteClient {

    let container: CKContainerProtocol

    init(container: CKContainerProtocol) {
        self.container = container
    }

    func create(_ entity: CKEntityProtocol, completion: @escaping (Error?) -> Void) {
        let record = makeRecord(values: entity.getValues(), keys: entity.getKeys())

        container.save(record) { (_, error) in
            completion(error)
        }
    }

}

private extension CloudKitClient {

    private func makeRecord<T: Sequence>(values: T, keys: [String]) -> CKRecord {
        let record = CKRecord(recordType: "Account")
        values.enumerated().forEach { (index, value) in
            record.setValue(value, forKey: keys[index])
        }

        return record
    }

}
