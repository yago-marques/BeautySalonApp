//
//  RemoteClient.swift
//  SalonGo
//
//  Created by Yago Marques on 08/11/22.
//

import Foundation

protocol RemoteClient: AnyObject {
    func create(
        _ entity: CKEntityProtocol,
        completion: @escaping (Error?) -> Void
    )

    func read(
        at recordType: CloudKitEntityTypes,
        completion: @escaping (Result<[CKStructProtocol], Error>) -> Void
    )
}
