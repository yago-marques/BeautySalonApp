//
//  RegistrationRouter.swift
//  SalonGo
//
//  Created by Milena Lima de Alcântara on 30/11/22.
//

import Foundation
import UIKit

protocol RegistrationRouting {
    var navigation: UINavigationController? { get set }
    func toCatalog()
}

final class RegistrationRouter: RegistrationRouting {
    var navigation: UINavigationController?

    init(navigation: UINavigationController? = nil) {
        self.navigation = navigation
    }

    func toCatalog() {
        navigation?.pushViewController(ViewController(), animated: true)
    }
}
