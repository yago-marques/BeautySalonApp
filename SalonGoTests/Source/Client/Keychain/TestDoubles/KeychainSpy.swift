//
//  KeychainMock.swift
//  SalonGoTests
//
//  Created by Yago Marques on 19/11/22.
//

import Foundation
@testable import SalonGo

class KeychainSpy: KeychainProtocol {
    enum Message {
        case add, fetch, update, delete
    }

    private(set) var receivedMessages = [Message]()
    private var firstAdded = false

    var osStatus: OSStatus = 0
    var keychainResult = KeychainResult(status: 10, queryResult: nil)

    func add(_ dictionary: [String: AnyObject]) -> OSStatus {
        receivedMessages.append(.add)
        firstAdded = true

        return osStatus
    }

    func fetch(_ query: [String: AnyObject]) -> KeychainResult {
        receivedMessages.append(.fetch)
        return firstAdded ?
        KeychainResult(status: errSecSuccess, queryResult: "123".data(using: .utf8) as AnyObject) :
        keychainResult
    }

    func update(_ query: [String: AnyObject], with attributes: [String: AnyObject]) -> OSStatus {
        receivedMessages.append(.update)
        return osStatus
    }

    func delete(_ query: [String: AnyObject]) -> OSStatus {
        receivedMessages.append(.delete)
        return osStatus
    }

    func addFirstToken() {
        firstAdded = true
    }
}
