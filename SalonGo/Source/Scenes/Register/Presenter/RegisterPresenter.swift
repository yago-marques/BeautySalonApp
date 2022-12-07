//
//  RegistrationPresenter.swift
//  SalonGo
//
//  Created by Yago Marques on 05/12/22.
//

import Foundation

protocol RegisterPresenting: AnyObject {
    var controller: RegisterControlling? { get set }
    var router: RegisterRouting { get set }
    func tryRegisterUser(name: String?, phone: String?)
}

final class RegisterPresenter: RegisterPresenting {
    weak var controller: RegisterControlling?
    private let interactor: RegisterInteracting?
    internal var router: RegisterRouting

    init(
        controller: RegisterControlling? = nil,
        interactor: RegisterInteracting,
        router: RegisterRouting
    ) {
        self.controller = controller
        self.interactor = interactor
        self.router = router
    }

    func tryRegisterUser(name: String?, phone: String?) {
        var isPossible: Bool = true

        if !nameIsValid(name) {
            controller?.textFieldToRed(.name)
            isPossible = false
        }

        if !phoneNumberIsVailid(phone) {
            controller?.textFieldToRed(.phone)
            isPossible = false
        }

        if isPossible {
            do {
                try saveUser(name: name, phone: phone)
                router.toCatalog()
            } catch {
                print(error)
            }
        }

    }

}

enum PresenterError: Error {
    case invalidParser
}

private extension RegisterPresenter {
    func saveUser(name: String?, phone: String?) throws {
        guard let name, let phone else {
            throw PresenterError.invalidParser
        }

        let user: User = .init(
            name: name,
            phoneNumber: phone,
            createdAt: Date(),
            updatedAt: Date()
        )

        do {
            try interactor?.saveUser(with: user)
        } catch {
            throw error
        }
    }

    func nameIsValid(_ name: String?) -> Bool {
        if let name, name.count >= 3 {
            return true
        } else {
            return false
        }

    }

    func phoneNumberIsVailid(_ phoneNumber: String?) -> Bool {
        if let phoneNumber, phoneNumber.count == 16 {
            return true
        } else {
            return false
        }
    }
}
