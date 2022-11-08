//
//  ViewController.swift
//  SalonGo
//
//  Created by Milena Lima de Alcântara on 07/11/22.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        let cloudKit = CloudKitClient()
        cloudKit.create(.init(
            userId: "abc",
            email: "yago@gmail.com",
            password: "yago123",
            isCompany: true,
            createdAt: Date(),
            updatedAt: Date()
        )) { result in
            print(result)
        }

    }

}
