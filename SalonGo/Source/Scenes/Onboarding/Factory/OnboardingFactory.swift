//
//  OnboardingFactory.swift
//  SalonGo
//
//  Created by Yago Marques on 25/11/22.
//

import UIKit

struct OnboardingFactory {
    static func make() -> UIViewController {
        let view = OnboardingView(frame: UIScreen.main.bounds)
        let presenter = OnboardingPresenter(
            router: OnboardingRouter(),
            interactor: OnboardingInteractor(
                coreData: CoreDataClient()
            )
        )
        let onboarding = OnboardingController(onboardingView: view, presenter: presenter)
        view.controller = onboarding

        return onboarding
    }
}
