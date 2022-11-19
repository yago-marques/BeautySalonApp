//
//  KeychainProtocol.swift
//  SalonGo
//
//  Created by Yago Marques on 19/11/22.
//

import Foundation

public protocol KeychainProtocol {
    func add(_ dictionary: [String: AnyObject]) -> OSStatus
    func fetch(_ query: [String: AnyObject]) -> KeychainResult
    func update(_ query: [String: AnyObject], with attributes: [String: AnyObject]) -> OSStatus
    func delete(_ query: [String: AnyObject]) -> OSStatus
}
