//
//  RegistrationFactory.swift
//  SalonGo
//
//  Created by Milena Lima de Alcântara on 30/11/22.
//

import Foundation
import UIKit

struct RegistrationFactory {
    static func make() -> UIViewController {
        let view = RegistrationView(frame: UIScreen.main.bounds)
        let presenter = RegistrationPresenter(router: RegistrationRouter())
        let registration = RegistrationController(registrationView: view, presenter: presenter)
//        view.controller = registration
        return registration
    }
}

/*

 struct OnboardingFactory {
     static func make() -> UIViewController {
         let view = OnboardingView(frame: UIScreen.main.bounds)
         let presenter = OnboardingPresenter(router: OnboardingRouter())
         let onboarding = OnboardingController(onboardingView: view, presenter: presenter)
         view.controller = onboarding

         return onboarding
     }
 }

 */
