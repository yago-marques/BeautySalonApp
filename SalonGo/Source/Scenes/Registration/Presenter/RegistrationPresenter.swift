//
//  RegistrationPresenter.swift
//  SalonGo
//
//  Created by Milena Lima de Alcântara on 30/11/22.
//

import Foundation

protocol RegistrationPresenting {
    var router: RegistrationRouting {get set}
    var controller: RegistrationControllerDelegate? {get set}
    func showOnboardingIfNeeded()
//    func verifyCapturedAction(direction: OnboardingDirection)
}

final class RegistrationPresenter: RegistrationPresenting {

    var router: RegistrationRouting
    weak var controller: RegistrationControllerDelegate?

    init(
        router: RegistrationRouting,
        controller: RegistrationControllerDelegate? = nil
    ) {
        self.router = router
        self.controller = controller
    }

    func showOnboardingIfNeeded() {
        controller?.showRegistration()
    }
}
