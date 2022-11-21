//
//  UserDBManager.swift
//  SalonGo
//
//  Created by Yago Marques on 21/11/22.
//

import Foundation

protocol UserDBManager {
    @discardableResult
    func createUser(with user: User) throws -> CDUserEntity
    func fetchUser() throws -> [CDUserEntity]
    func updateUser(user: User) throws
    func deleteUser() throws
}
