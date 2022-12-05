//
//  RegistrationViewController.swift
//  SalonGo
//
//  Created by Milena Lima de Alcântara on 30/11/22.
//

import UIKit

protocol RegistrationControllerDelegate: AnyObject {
    func registerIfIsPossible(name: String?, number: String?)
}

final class RegistrationController: UIViewController {
    private weak var myView: RegistrationView?

    init(
        registrationView: RegistrationView
    ) {
        self.myView = registrationView
        super.init(nibName: nil, bundle: nil)
        self.view = self.myView
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) { nil }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        setupController()
    }
}

private extension RegistrationController {
    func setupController() {
        self.navigationItem.hidesBackButton = true
        self.myView?.controllerDelegate = self
    }
}

extension RegistrationController: RegistrationControllerDelegate {
    func registerIfIsPossible(name: String?, number: String?) {

    }
}
