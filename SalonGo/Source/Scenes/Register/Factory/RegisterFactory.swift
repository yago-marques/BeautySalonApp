//
//  RegisterFactory.swift
//  SalonGo
//
//  Created by Yago Marques on 06/12/22.
//

import UIKit

struct RegisterFactory {
    static func make() -> UIViewController {
        let view = RegisterView(frame: UIScreen.main.bounds)
        let coredata = CoreDataClient()
        let interactor = RegisterInteractor(coreData: coredata)
        let router = RegisterRouter()
        let presenter = RegisterPresenter(interactor: interactor, router: router)
        let register = RegisterController(registerView: view, presenter: presenter)

        return register
    }
}
