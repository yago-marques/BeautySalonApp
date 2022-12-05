//
//  RegistrationViewController.swift
//  SalonGo
//
//  Created by Milena Lima de Alcântara on 30/11/22.
//

import UIKit

protocol RegistrationControllerDelegate: AnyObject {
    func showRegistration()
    func didTapConfirmButton()
}

final class RegistrationController: UIViewController {
    private weak var viewDelegate: RegistrationViewDelegate?
    private var presenter: RegistrationPresenting

    init(
        registrationView: RegistrationView,
        presenter: RegistrationPresenting
    ) {
        self.viewDelegate = registrationView
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
        self.view = registrationView
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) { nil }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.setupView()

        presenter.showOnboardingIfNeeded()
    }
}

private extension RegistrationController {
    func setupView() {
        self.presenter.controller = self
        self.presenter.router.navigation = self.navigationController
    }
}

extension RegistrationController: RegistrationControllerDelegate {
    func didTapConfirmButton() {

    }

    func showRegistration() {
        viewDelegate?.showRegistration()
    }
}
