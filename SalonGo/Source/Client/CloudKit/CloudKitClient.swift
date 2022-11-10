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

    let container: CKDatabase

    init(container: CKDatabase) {
        self.container = container
    }

    func create(_ entity: CKEntityProtocol, completion: @escaping (Error?) -> Void) {
        let record = makeRecord(values: entity.getValues(), keys: entity.getKeys())

        container.save(record) { (_, error) in
            completion(error)
        }
    }

    func read(
        at recordType: CloudKitEntityTypes,
        completion: @escaping (Result<CKStructProtocol, Error>) -> Void
    ) {
        let predicate = NSPredicate(value: true)
        let query = CKQuery(recordType: recordType.rawValue, predicate: predicate)

        container.fetch(withQuery: query) { result in
            switch result {
            case .success(let allResults):
                for matchResult in allResults.matchResults {
                    let recordInfo = matchResult.1
                    switch recordInfo {
                    case .success(let record):
                        if
                            let entity = self.getEntity(record: record, type: recordType)
                        {
                            completion(.success(entity))
                        } else {
                            completion(.failure(CloudKitError.invalidEntity))
                        }
                    case .failure(let failure):
                        completion(.failure(failure))
                    }
                }
            case .failure(let failure):
                completion(.failure(failure))
            }
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

    private func getEntity(
        record: CKRecord,
        type: CloudKitEntityTypes
    ) -> CKStructProtocol? {
        var result: CKStructProtocol?

        switch type {
        case .account:
            result = CKAccount.makeWithRecord(record: record)
        case .user:
            result = CKUser.makeWithRecord(record: record)
        case .company:
            result = CKCompany.makeWithRecord(record: record)
        case .rating:
            result = CKRating.makeWithRecord(record: record)
        case .service:
            result = CKService.makeWithRecord(record: record)
        case .appointment:
            result = CKAppointment.makeWithRecord(record: record)
        }

        return result
    }

}
