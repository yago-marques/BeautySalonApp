//
//  StoreViewController.swift
//  SalonGo
//
//  Created by Davi Capistrano on 28/11/22.
//

import UIKit

class StoreViewController: UIViewController {

    var screen: StoreScreen?

    override func loadView() {
        self.screen = StoreScreen()
        self.view = self.screen
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "lightGrayColor")
    }

    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
}
