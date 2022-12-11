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
    func getCellViewModel(row: Int) -> OnboardingViewModel
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
        if interactor.userAlreadyExists() {
            router.toCatalog()
        } else {
            controller?.showOnboarding()
        }
    }

    func getCellViewModel(row: Int) -> OnboardingViewModel {
        switch row {
        case 0:
            return .init(
                animation: "welcomeHandle",
                title: "Seja bem vindo(a)",
                subtitle: "Encontre sua melhor versão"
            )
        case 1:
            return .init(
                animation: "appointment",
                title: "O melhor horário",
                subtitle: "Nós vamos te ajudar a encontrar o melhor horário no salão, para sua melhor experiência"
            )
        case 2:
            return .init(
                animation: "beautifulGirl",
                title: "Melhores serviços",
                subtitle: "Disponibilizamos um catálogo com vários serviços diversificados"
            )
        default: return .init(animation: "", title: "", subtitle: "")
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
                controller?.setup(buttonTitle: "Cadastro")
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
