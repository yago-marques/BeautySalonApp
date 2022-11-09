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
}
