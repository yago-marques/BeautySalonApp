//
//  OnboardingController.swift
//  SalonGo
//
//  Created by Yago Marques on 25/11/22.
//

import UIKit

protocol OnboardingControllerDelegate: AnyObject {
    func showOnboarding()
    func setup(buttonTitle: String)
    func getPage() -> Int
    func displayScreen(at index: Int)
    func isPossibleNext(_ newState: Bool)
    func showPrevButton()
    func hidePrevButton()
}

protocol OnboardingControlling {
    func capturedAction(direction: OnboardingDirection)
}

final class OnboardingController: UIViewController {
    private weak var viewDelegate: OnboardingViewDelegate?
    private var presenter: OnboardingPresenting

    init(
        onboardingView: OnboardingView,
        presenter: OnboardingPresenting
    ) {
        self.viewDelegate = onboardingView
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
        self.view = onboardingView
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) { nil }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.setupView()

        presenter.showOnboardingIfNeeded()
    }
}

private extension OnboardingController {
    func setupView() {
        self.presenter.controller = self
        self.presenter.router.navigation = self.navigationController
    }
}

extension OnboardingController: OnboardingControlling {
    func capturedAction(direction: OnboardingDirection) {
        presenter.verifyCapturedAction(direction: direction)
    }
}

extension OnboardingController: OnboardingControllerDelegate {
    func showOnboarding() {
        viewDelegate?.showOnboarding()
    }

    func setup(buttonTitle: String) {
        viewDelegate?.setup(buttonTitle: buttonTitle)
    }

    func getPage() -> Int {
        viewDelegate?.getPage() ?? 0
    }

    func displayScreen(at index: Int) {
        viewDelegate?.displayScreen(at: index)
    }

    func isPossibleNext(_ newState: Bool) {
        viewDelegate?.isPossibleNext(newState)
    }

    func showPrevButton() {
        viewDelegate?.showPrevButton()
    }

    func hidePrevButton() {
        viewDelegate?.hidePrevButton()
    }
}
