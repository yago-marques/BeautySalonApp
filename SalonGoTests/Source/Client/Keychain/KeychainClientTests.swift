//
//  KeychainClientTests.swift
//  SalonGoTests
//
//  Created by Yago Marques on 19/11/22.
//

import XCTest
@testable import SalonGo

final class KeychainClientTests: XCTestCase {

    func test_createToken_whenFirstToken_shouldVerifyIfIsEmptyAndAddNewToken() {
        let (sut, keychainSpy) = self.makeSUT()
        let fakeToken = "12345"

        XCTAssertNoThrow(try sut.create(token: fakeToken.data(using: .utf8)!))
        XCTAssertEqual(keychainSpy.receivedMessages, [.fetch, .add])
    }

    func test_createToken_whenFirstTokenWasAdded_shouldVerifyIfIsEmptyAndUpdateToken() {
        let (sut, keychainSpy) = self.makeSUT()
        let fakeToken = "12345"
        keychainSpy.addFirstToken()

        XCTAssertNoThrow(try sut.create(token: fakeToken.data(using: .utf8)!))
        XCTAssertEqual(keychainSpy.receivedMessages, [.fetch, .update])
    }

    func test_readToken_whenNoTokenWasAdded_shouldThrowAnError() {
        let (sut, _) = self.makeSUT()

        XCTAssertThrowsError(try sut.read())
    }

    func test_readToken_whenTokenWasAdded_shouldNotThrowAnError() {
        let (sut, keychainSpy) = self.makeSUT()
        keychainSpy.addFirstToken()

        XCTAssertNoThrow(try sut.read())
        XCTAssertEqual(keychainSpy.receivedMessages, [.fetch])
    }

    func test_deleteToken_shoudDeleteOrCheckTokenField_shouldNotThrowAnError() {
        let (sut, keychainSpy) = self.makeSUT()

        XCTAssertNoThrow(try sut.delete())
        XCTAssertEqual(keychainSpy.receivedMessages, [.delete])
    }

}

extension KeychainClientTests {
    typealias SutAndDoubles = (
        sut: SafeStorage,
        keychainSpy: KeychainSpy
    )

    private func makeSUT() -> SutAndDoubles {
        let keychainSpy = KeychainSpy()
        let sut = KeychainClient(keychain: keychainSpy)

        return (sut, keychainSpy)
    }
}
