//
//  KeychainClient.swift
//  SalonGo
//
//  Created by Yago Marques on 19/11/22.
//

import Foundation

enum KeychainError: Error {
    case itemNotFound
    case duplicateItem
    case invalidItemFormat
    case unexpectedStatus(OSStatus)
}

final class KeychainClient: SafeStorage {

    private let (service, account): (service: String, account: String)

    init(
        credentials: (service: String, account: String) = (
            Bundle.main.bundleIdentifier!,
            Bundle.main.bundleIdentifier!
        )
    ) {
        self.service = credentials.service
        self.account = credentials.account
    }

    func create(token: Data) throws {

        if self.hasToken() {

            do {
                try self.update(token: token)
            } catch {
                throw error
            }

        } else {
            let query: [String: AnyObject] = [
                kSecAttrService as String: service as AnyObject,
                kSecAttrAccount as String: account as AnyObject,
                kSecClass as String: kSecClassGenericPassword,
                kSecValueData as String: token as AnyObject,
            ]

            let status = SecItemAdd(query as CFDictionary, nil)

            if status == errSecDuplicateItem {
                throw KeychainError.duplicateItem
            }

            guard status == errSecSuccess else {
                throw KeychainError.unexpectedStatus(status)
            }

        }

    }

    func read() throws -> String? {
        let query: [String: AnyObject] = [
            kSecAttrService as String: self.service as AnyObject,
            kSecAttrAccount as String: self.account as AnyObject,
            kSecClass as String: kSecClassGenericPassword,
            kSecMatchLimit as String: kSecMatchLimitOne,
            kSecReturnData as String: kCFBooleanTrue
        ]

        var itemCopy: AnyObject?
        let status = SecItemCopyMatching(query as CFDictionary, &itemCopy)

        guard status != errSecItemNotFound else {
            throw KeychainError.itemNotFound
        }

        guard status == errSecSuccess else {
            throw KeychainError.unexpectedStatus(status)
        }

        guard let tokenData = itemCopy as? Data else {
            throw KeychainError.invalidItemFormat
        }

        let token = String(data: tokenData, encoding: .utf8)

        return token
    }

    func update(token: Data) throws {
        let query: [String: AnyObject] = [
            kSecAttrService as String: self.service as AnyObject,
            kSecAttrAccount as String: self.account as AnyObject,
            kSecClass as String: kSecClassGenericPassword
        ]

        let attributes: [String: AnyObject] = [
            kSecValueData as String: token as AnyObject
        ]

        let status = SecItemUpdate(
            query as CFDictionary,
            attributes as CFDictionary
        )

        guard status != errSecItemNotFound else {
            throw KeychainError.itemNotFound
        }

        guard status == errSecSuccess else {
            throw KeychainError.unexpectedStatus(status)
        }
    }

    func delete() throws {

        let query: [String: AnyObject] = [
            kSecAttrService as String: self.service as AnyObject,
            kSecAttrAccount as String: self.account as AnyObject,
            kSecClass as String: kSecClassGenericPassword
        ]

        let status = SecItemDelete(query as CFDictionary)

        guard status == errSecSuccess else {
            throw KeychainError.unexpectedStatus(status)
        }

    }
}

private extension KeychainClient {
    private func hasToken() -> Bool {
        do {
            let _ = try self.read()

            return true
        } catch {
            return false
        }
    }
}
