//
//  CrypoKitClient.swift
//  SalonGo
//
//  Created by Yago Marques on 07/12/22.
//

import Foundation
import CryptoKit

protocol CryptoProtocol: AnyObject {
    func makeHash(string: String) -> String
}

final class CryptoKitClient: CryptoProtocol {
    func makeHash(string: String) -> String {
        let inputData = Data(string.utf8)
        let hashed = SHA256.hash(data: inputData)
        return hashed.compactMap { String(format: "%02x", $0) }.joined()
    }
}
