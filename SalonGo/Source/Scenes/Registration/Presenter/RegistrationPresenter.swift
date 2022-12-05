//
//  RegistrationPresenter.swift
//  SalonGo
//
//  Created by Yago Marques on 05/12/22.
//

import Foundation

final class RegistrationPresenter {

    func tryRegisterUser(name: String?, phoneNumber: String?) {
        if let name, let phoneNumber {
            
        }
    }

}

private extension RegistrationPresenter {
    func nameIsValid(name: String) -> Bool {
        name.count >= 3
    }

    func phoneNumberIsVailid(phoneNumber: String) -> Bool {
        phoneNumber.count == 17
    }
}
