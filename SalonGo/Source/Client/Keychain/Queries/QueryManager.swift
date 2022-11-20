//
//  DefaultQuery.swift
//  SalonGo
//
//  Created by Yago Marques on 19/11/22.
//

import Foundation

final class QueryManager: QueryProtocol {
    var query: [String: AnyObject]

    let service: String
    let account: String

    init(
        query: [String: AnyObject] = [:],
        service: String,
        account: String
    ) {
        self.query = query
        self.service = service
        self.account = account
    }

    func getGenericQuery() -> [String: AnyObject] {
        self.query = [
            kSecAttrService as String: self.service as AnyObject,
            kSecAttrAccount as String: self.account as AnyObject,
            kSecClass as String: kSecClassGenericPassword
        ]

        return self.query
    }

    func getValueQuery(_ value: Data) -> [String: AnyObject] {
        self.query = [
            kSecAttrService as String: self.service as AnyObject,
            kSecAttrAccount as String: self.account as AnyObject,
            kSecClass as String: kSecClassGenericPassword,
            kSecValueData as String: value as AnyObject
        ]

        return self.query
    }

    func getFinderQuery() -> [String: AnyObject] {
        self.query = [
            kSecAttrService as String: self.service as AnyObject,
            kSecAttrAccount as String: self.account as AnyObject,
            kSecClass as String: kSecClassGenericPassword,
            kSecMatchLimit as String: kSecMatchLimitOne,
            kSecReturnData as String: kCFBooleanTrue
        ]

        return query
    }
}
