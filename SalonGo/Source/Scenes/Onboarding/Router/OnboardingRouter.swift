//
//  OnboardingRouter.swift
//  SalonGo
//
//  Created by Yago Marques on 25/11/22.
//

import UIKit

protocol OnboardingRouting {
    var navigation: UINavigationController? { get set }
    func toCatalog()
}

final class OnboardingRouter: OnboardingRouting {
    var navigation: UINavigationController?

    init(navigation: UINavigationController? = nil) {
        self.navigation = navigation
    }

    func toCatalog() {
        navigation?.pushViewController(RegistrationFactory.make(), animated: true)
    }
}
