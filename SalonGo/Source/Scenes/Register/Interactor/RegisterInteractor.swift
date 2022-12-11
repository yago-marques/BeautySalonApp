//
//  RegisterInteractor.swift
//  SalonGo
//
//  Created by Yago Marques on 06/12/22.
//

import Foundation

enum RegisterInteractorError: Error {
    case invalidToken
}

protocol RegisterInteracting: AnyObject {
    func saveUser(with user: User) throws
}

final class RegisterInteractor {
    private let coreData: UserDBManager
    private let cryptoKit: CryptoProtocol
    private let keychain: SafeStorage

    init(
        coreData: UserDBManager,
        cryptoKit: CryptoProtocol,
        keychain: SafeStorage
    ) {
        self.coreData = coreData
        self.cryptoKit = cryptoKit
        self.keychain = keychain
    }
}

extension RegisterInteractor: RegisterInteracting {
    func saveUser(with user: User) throws {
        do {
            try coreData.createUser(with: user)
            try keychain.create(token: try makeUserToken(user))
        } catch {
            throw error
        }
    }
}

private extension RegisterInteractor {
    func makeUserToken(_ user: User) throws -> Data {
        let formattedPhoneNumber = user.phoneNumber.filter {
            $0 != " " && $0 != "(" && $0 != ")" && $0 != "-"
        }
        let groupedUserInfo = "\(user.name)\(formattedPhoneNumber)"
        guard let tokenData = try? JSONEncoder().encode(cryptoKit.makeHash(
            string: groupedUserInfo
        )) else { throw RegisterInteractorError.invalidToken }

        return tokenData
    }
}
