//
//  OnboardingInteractor.swift
//  SalonGo
//
//  Created by Yago Marques on 25/11/22.
//

import Foundation

protocol OnboardingInteracting: AnyObject {
    func userAlreadyExists() -> Bool
}

final class OnboardingInteractor {
    private let coreData: UserDBManager

    init(coreData: UserDBManager) {
        self.coreData = coreData
    }
}

extension OnboardingInteractor: OnboardingInteracting {
    func userAlreadyExists() -> Bool {
        do {
            let user = try coreData.fetchUser()
            return user.count != 0
        } catch {
            return false
        }
    }
}
