//
//  RegisterPresenterMock.swift
//  SalonGoTests
//
//  Created by Yago Marques on 06/12/22.
//

import Foundation
@testable import SalonGo

final class OnboardingPresenterSpy: OnboardingPresenting {
    func getCellViewModel(row: Int) -> SalonGo.OnboardingViewModel {
        .init(animation: "", title: "", subtitle: "")
    }

    enum Message: Equatable {
        case showOnboardingIfNeeded
        case verifyCapturedAction(direction: OnboardingDirection)
    }

    var router: OnboardingRouting
    var controller: OnboardingControllerDelegate?

    private(set) var receivedMessages = [Message]()

    init(router: OnboardingRouting, controller: OnboardingControllerDelegate? = nil) {
        self.router = router
        self.controller = controller
    }

    func showOnboardingIfNeeded() {
        receivedMessages.append(.showOnboardingIfNeeded)
    }

    func verifyCapturedAction(direction: OnboardingDirection) {
        receivedMessages.append(.verifyCapturedAction(direction: direction))
    }

}
