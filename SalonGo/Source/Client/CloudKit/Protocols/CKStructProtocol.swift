//
//  GettingValuesProtocol.swift
//  SalonGo
//
//  Created by Yago Marques on 08/11/22.
//

import Foundation
import CloudKit

protocol CKStructProtocol {
    func makeValues() -> [Any]
    static func makeWithRecord(record: CKRecord) -> CKStructProtocol?
}
