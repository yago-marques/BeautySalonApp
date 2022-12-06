//
//  RegisterRouter.swift
//  SalonGo
//
//  Created by Milena Lima de Alcântara on 06/12/22.
//

import UIKit

protocol RegisterRouting {
    var navigation: UINavigationController? { get set }
    func toCatalog()
}

final class RegisterRouter: RegisterRouting {
    var navigation: UINavigationController?

    init(navigation: UINavigationController? = nil) {
        self.navigation = navigation
    }

    func toCatalog() {
        navigation?.pushViewController(ViewController(), animated: true)
    }
}
