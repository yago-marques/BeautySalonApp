//
//  CoreDataStackFake.swift
//  SalonGoTests
//
//  Created by Yago Marques on 21/11/22.
//

import Foundation
import CoreData
@testable import SalonGo

struct CoreDataStackFake {
    static var persistentContainer: NSPersistentContainer = {
        let description = NSPersistentStoreDescription()
        description.url = URL(fileURLWithPath: "/dev/null")
        let container = NSPersistentContainer(name: "SalonGo")
        container.persistentStoreDescriptions = [description]
        container.loadPersistentStores { _, error in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        }
        return container
    }()
}
