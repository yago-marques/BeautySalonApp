//
//  safeStorage.swift
//  SalonGo
//
//  Created by Yago Marques on 19/11/22.
//

import Foundation

protocol SafeStorage {
    func create(token: Data) throws
    func read() throws -> String?
    func update(token: Data) throws
    func delete() throws
}
