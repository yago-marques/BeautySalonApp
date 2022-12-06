//
//  OnboardingPresenter.swift
//  SalonGo
//
//  Created by Yago Marques on 25/11/22.
//

import Foundation

protocol OnboardingPresenting {
    var router: OnboardingRouting {get set}
    var controller: OnboardingControllerDelegate? {get set}
    func showOnboardingIfNeeded()
    func verifyCapturedAction(direction: OnboardingDirection)
}

enum OnboardingPage {
    case one, two, three
}

final class OnboardingPresenter: OnboardingPresenting {
    var router: OnboardingRouting
    weak var controller: OnboardingControllerDelegate?
    private let interactor: OnboardingInteracting

    init(
        router: OnboardingRouting,
        controller: OnboardingControllerDelegate? = nil,
        interactor: OnboardingInteracting
    ) {
        self.router = router
        self.controller = controller
        self.interactor = interactor
    }

    func showOnboardingIfNeeded() {
        print(interactor.userAlreadyExists())
        if interactor.userAlreadyExists() {
            router.toCatalog()
        } else {
            controller?.showOnboarding()
        }
    }

    func verifyCapturedAction(direction: OnboardingDirection) {
        guard let page = getCurrentyPage() else { return }
        switch page {
        case .one:
            controller?.displayScreen(at: 1)
            controller?.showPrevButton()
        case .two:
            switch direction {
            case .next:
                controller?.displayScreen(at: 2)
                controller?.setup(buttonTitle: "Entrar")
            case .prev:
                controller?.displayScreen(at: 0)
                controller?.hidePrevButton()
            case .invalid:
                print("show alert")
            }
        case .three:
            switch direction {
            case .next:
                router.toRegister()
            case .prev:
                controller?.displayScreen(at: 2)
                controller?.setup(buttonTitle: "Próximo")
            case .invalid:
                print("show alert")
            }
        }
    }
}

private extension OnboardingPresenter {
    func getCurrentyPage() -> OnboardingPage? {
        if let page = controller?.getPage() {
            if page == 0 {
                return .one
            }
            if page == 1 {
                return .two
            }
            if page == 2 {
                return .three
            }
        }

        return nil
    }
}
