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
        let cloudKit = CloudKitClient(
            container: CKContainer.default().publicCloudDatabase
        )

        cloudKit.read(at: .account) { result in
            switch result {
            case .success(let success):
                print(success)
            case .failure(let failure):
                print(failure)
            }
        }
        // code to test end

    }

}
