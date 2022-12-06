//
//  RegistrationViewController.swift
//  SalonGo
//
//  Created by Milena Lima de Alcântara on 30/11/22.
//

import UIKit

protocol RegisterControllerDelegate: AnyObject {
    func registerIfIsPossible(name: String?, number: String?)
}

protocol RegisterControlling: AnyObject {
    func textFieldToRed(_ textField: TextFields)
}

final class RegisterController: UIViewController {
    private weak var myView: RegisterView?
    private let presenter: RegisterPresenting?

    init(
        registerView: RegisterView,
        presenter: RegisterPresenter
    ) {
        self.myView = registerView
        self.presenter = presenter
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

private extension RegisterController {
    func setupController() {
        self.navigationItem.hidesBackButton = true
        self.myView?.controllerDelegate = self
        self.presenter?.controller = self
        self.presenter?.router.navigation = self.navigationController
    }
}

extension RegisterController: RegisterControllerDelegate {
    func registerIfIsPossible(name: String?, number: String?) {
        presenter?.tryRegisterUser(name: name, phoneNumber: number)
    }
}

extension RegisterController: RegisterControlling {
    func textFieldToRed(_ textField: TextFields) {
        myView?.turnTextFieldRed(textField)
    }
}
