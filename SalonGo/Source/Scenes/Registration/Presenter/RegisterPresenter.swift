//
//  RegistrationPresenter.swift
//  SalonGo
//
//  Created by Yago Marques on 05/12/22.
//

import Foundation

protocol RegistrationPresenting: AnyObject {
    var controller: RegisterControlling? { get set }
    func tryRegisterUser(name: String?, phoneNumber: String?)
}

final class RegisterPresenter: RegistrationPresenting {

    weak var controller: RegisterControlling?

    init(controller: RegisterControlling) {
        self.controller = controller
    }

    func tryRegisterUser(name: String?, phoneNumber: String?) {
        print("here")
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
        if let phoneNumber, phoneNumber.count == 17 {
            return true
        } else {
            return false
        }
    }
}
