//
//  RegistrationPresenter.swift
//  SalonGo
//
//  Created by Yago Marques on 05/12/22.
//

import Foundation

protocol RegisterPresenting: AnyObject {
    var controller: RegisterControlling? { get set }
    func tryRegisterUser(name: String?, phoneNumber: String?)
}

final class RegisterPresenter: RegisterPresenting {

    weak var controller: RegisterControlling?

    init(controller: RegisterControlling? = nil) {
        self.controller = controller
    }

    func tryRegisterUser(name: String?, phoneNumber: String?) {
        var isPossible: Bool = true

        if !nameIsValid(name) {
            controller?.textFieldToRed(.name)
            isPossible = false
        }

        if !phoneNumberIsVailid(phoneNumber) {
            controller?.textFieldToRed(.phoneNumber)
            isPossible = false
        }

        if isPossible {
            print("save")
        }

    }

}

private extension RegisterPresenter {

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
