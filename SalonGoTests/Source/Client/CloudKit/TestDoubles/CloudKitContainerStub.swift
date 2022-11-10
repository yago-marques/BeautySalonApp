//
//  CloudKitContainerStub.swift
//  SalonGoTests
//
//  Created by Yago Marques on 08/11/22.
//

import Foundation
import CloudKit
@testable import SalonGo

final class CloudKitContainerStub: CKContainerProtocol {
    var records = [CKRecord]()

    func save(_ record: CKRecord, completionHandler: @escaping (CKRecord?, Error?) -> Void) {
        records.append(record)
        completionHandler(record, nil)
    }

    func fetch(
        withQuery query: CKQuery,
        completionHandler: @escaping (
            Result<(
                matchResults: [(CKRecord.ID, Result<CKRecord, Error>)],
                queryCursor: CKQueryOperation.Cursor?
            ), Error>
        ) -> Void) {
        var matchResults: [(CKRecord.ID, Result<CKRecord, any Error>)] = []
        for record in records
        where record.recordType == query.recordType {
            matchResults.append((record.recordID, .success(record)))
        }

        let result: (
            matchResults: [(CKRecord.ID, Result<CKRecord, any Error>)],
            queryCursor: CKQueryOperation.Cursor?) = (
                matchResults: matchResults,
                queryCursor: nil
            )

        completionHandler(.success(result))
    }
}
