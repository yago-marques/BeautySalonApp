//
//  ViewController.swift
//  SalonGo
//
//  Created by Milena Lima de Alcântara on 07/11/22.
//

import UIKit
import CloudKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        // code to test start
//        let coredata = CoreDataClient()
//
//        do {
//            try coredata.createUser(with: User(name: "yago", phoneNumber: "123", createdAt: Date(), updatedAt: Date()))

//            let user = try coredata.fetchUser()
//
//            print(user.count)
//            print(user.first?.name)
//            print(user.first?.phoneNumber)
//            print(user.first?.createdAt)
//            print(user.first?.updatedAt)

//            let newUser = User(name: "manuela", phoneNumber: "456", createdAt: Date(), updatedAt: Date())
//
//            try coredata.updateUser(user: newUser)
//
//            try coredata.deleteUser()
//        } catch {
//            print(error)
//        }
        // code to test end

    }

}
