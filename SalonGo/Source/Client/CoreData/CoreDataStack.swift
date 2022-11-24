//
//  CoreDataStack.swift
//  SalonGo
//
//  Created by Yago Marques on 21/11/22.
//

import Foundation
import CoreData

struct CoreDataStack {
    static var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "SalonGo")
        container.loadPersistentStores { (_, error) in
            if let error = error {
                fatalError("Loading of store failed \(error)")
            }
        }

        return container
    }()
}
