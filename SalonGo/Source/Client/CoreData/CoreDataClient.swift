//
//  CoreDataClient.swift
//  SalonGo
//
//  Created by Yago Marques on 21/11/22.
//

import Foundation
import CoreData

enum CoreDataError: Error {
    case userAlreadyExists
}

struct CoreDataClient {
    let persistentContainer: NSPersistentContainer

    init(persistentContainer: NSPersistentContainer = CoreDataStack.persistentContainer) {
        self.persistentContainer = persistentContainer
    }
}

extension CoreDataClient: UserDBManager {
    @discardableResult
    func createUser(with user: User) throws -> CDUserEntity {
        if let users = try? self.fetchUser(), users.isEmpty {
            let context = persistentContainer.viewContext
            let userEntity = CDUserEntity(context: context)

            userEntity.name = user.name
            userEntity.phoneNumber = user.phoneNumber
            userEntity.createdAt = user.createdAt
            userEntity.updatedAt = user.updatedAt

            do {
                try context.save()
                return userEntity
            } catch let error {
                throw error
            }
        } else {
            throw CoreDataError.userAlreadyExists
        }
    }

    func fetchUser() throws -> [CDUserEntity] {
        let context = persistentContainer.viewContext

        let fetchRequest = NSFetchRequest<CDUserEntity>(entityName: "CDUserEntity")
        fetchRequest.fetchLimit = 1

        do {
            let userEntity = try context.fetch(fetchRequest)
            return userEntity
        } catch let error {
            throw error
        }
    }

    func updateUser(user: User) throws {
        let context = persistentContainer.viewContext
        let userEntity = try? self.fetchUser().first
        userEntity?.name = user.name
        userEntity?.phoneNumber = user.phoneNumber
        userEntity?.updatedAt = Date()

        do {
            try context.save()
        } catch let error {
            throw error
        }
    }

    func deleteUser() throws {
        let context = persistentContainer.viewContext
        if let userEntity = try? self.fetchUser().first {
            context.delete(userEntity)
        }

        do {
            try context.save()
        } catch let error {
            throw error
        }
    }
}
