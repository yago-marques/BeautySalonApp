//
//  KeychainClient.swift
//  SalonGo
//
//  Created by Yago Marques on 19/11/22.
//

import Foundation

enum KeychainError: Error {
    case invalidItemFormat
    case unexpectedStatus(OSStatus)
}

final class KeychainClient: SafeStorage {

    private let (service, account): (service: String, account: String)
    private let keychain: KeychainProtocol
    lazy var queryManager = QueryManager(service: service, account: account)

    init(
        credentials: (service: String, account: String) = (
            Bundle.main.bundleIdentifier!,
            Bundle.main.bundleIdentifier!
        ),
        keychain: KeychainProtocol = Keychain()
    ) {
        self.service = credentials.service
        self.account = credentials.account
        self.keychain = keychain
    }

    func create(token: Data) throws {

        if self.hasToken() {

            do {
                try self.update(token: token)
            } catch {
                throw error
            }

        } else {
            let query = queryManager.getValueQuery(token)

            _ = keychain.add(query)
        }

    }

    func read() throws -> String? {
        let query = queryManager.getFinderQuery()

        let result = keychain.fetch(query)

        guard result.status == errSecSuccess else {
            throw KeychainError.unexpectedStatus(result.status)
        }

        guard let tokenData = result.queryResult as? Data else {
            throw KeychainError.invalidItemFormat
        }

        let token = String(data: tokenData, encoding: .utf8)

        return token
    }

    func delete() throws {
        let query = queryManager.getGenericQuery()

        let status = keychain.delete(query)

        guard status == errSecSuccess else {
            throw KeychainError.unexpectedStatus(status)
        }
    }
}

private extension KeychainClient {
    private func hasToken() -> Bool {
        do {
            _ = try self.read()

            return true
        } catch {
            return false
        }
    }

    private func update(token: Data) throws {
        let query = queryManager.getGenericQuery()

        let attributes: [String: AnyObject] = [
            kSecValueData as String: token as AnyObject
        ]

        let status = keychain.update(query, with: attributes)

        guard status == errSecSuccess else {
            throw KeychainError.unexpectedStatus(status)
        }
    }
}
