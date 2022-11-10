//
//  CKContainerHelper.swift
//  SalonGo
//
//  Created by Yago Marques on 08/11/22.
//

import Foundation
import CloudKit

final class CKContainerHelper: CKContainerProtocol {

    let database: CKDatabase

    init(database: CKDatabase) {
        self.database = database
    }

    func save(
        _ record: CKRecord,
        completionHandler: @escaping (CKRecord?, Error?) -> Void
    ) {
        database.save(record, completionHandler: completionHandler)
    }

    func fetch(
        withQuery query: CKQuery,
        completionHandler: @escaping (
            Result<
                (matchResults: [(CKRecord.ID, Result<CKRecord, Error>)],
                queryCursor: CKQueryOperation.Cursor?), Error>
        ) -> Void
    ) {
        database.fetch(
            withQuery: query,
            completionHandler: completionHandler
        )
    }

}
