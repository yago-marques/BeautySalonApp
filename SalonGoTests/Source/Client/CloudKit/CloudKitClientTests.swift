//
//  CloudKitClientTests.swift
//  SalonGoTests
//
//  Created by Yago Marques on 08/11/22.
//

import XCTest
@testable import SalonGo

final class CloudKitClientTests: XCTestCase {

    func test_createRecord_withAccountEntity() {
        let myAccount = EntityMocks.getAccount(id: "Account")
        let (sut, containerStub) = self.makeSUT()

        sut.create(AccountEntity(account: myAccount)) { error in
            XCTAssertNil(error)
            XCTAssertFalse(containerStub.records.isEmpty)
        }
    }

}

extension CloudKitClientTests {
    typealias SutAndDoubles = (
        sut: RemoteClient,
        containerStub: CloudKitContainerStub
    )

    private func makeSUT() -> SutAndDoubles {
        let containerStub = CloudKitContainerStub()
        let sut = CloudKitClient(container: containerStub)

        return (sut, containerStub)
    }
}
