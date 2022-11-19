//
//  Keychain.swift
//  SalonGo
//
//  Created by Yago Marques on 19/11/22.
//

import Foundation

public struct KeychainResult {
    /// The status code of a fetch action
    public let status: OSStatus
    /// The result object of a fetch action
    public let queryResult: AnyObject?
}

public class Keychain: KeychainProtocol {

    public init() { }

    /// Add an item in the keychain that matches a certain dictionary
    ///
    /// - Parameter dictionary: The dictionary for the item we want to add
    /// - Returns: A result code
    public func add(_ dictionary: [String: AnyObject]) -> OSStatus {
        return SecItemAdd(dictionary as CFDictionary, nil)
    }

    /// Fetch all the items that matches a certain query
    ///
    /// - Parameter query: The query for the items we want to fetch
    /// - Returns: An object that contains a result code and an optional object
    public func fetch(_ query: [String: AnyObject]) -> KeychainResult {

        var queryResult: AnyObject?
        let status = withUnsafeMutablePointer(to: &queryResult) {
            SecItemCopyMatching(query as CFDictionary, UnsafeMutablePointer($0))
        }

        return KeychainResult(status: status, queryResult: queryResult)
    }

    /// Update all the items that matches a certain query
    ///
    /// - Parameters:
    ///   - query: The query for the items we want to update
    ///   - attributes: The attributes that we want to update
    /// - Returns: A result code
    public func update(_ query: [String: AnyObject], with attributes: [String: AnyObject]) -> OSStatus {
        return SecItemUpdate(query as CFDictionary, attributes as CFDictionary)
    }

    /// Delete all the items that matches a certain query
    ///
    /// - Parameter query: The query for the items we want to update
    /// - Returns: A result code
    public func delete(_ query: [String: AnyObject]) -> OSStatus {
        return SecItemDelete(query as CFDictionary)
    }
}
