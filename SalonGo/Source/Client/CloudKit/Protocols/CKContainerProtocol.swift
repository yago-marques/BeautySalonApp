//
//  CKContainer.swift
//  SalonGo
//
//  Created by Yago Marques on 08/11/22.
//

import Foundation
import CloudKit

protocol CKContainerProtocol {
    func save(_ record: CKRecord, completionHandler: @escaping (CKRecord?, Error?) -> Void)
}
