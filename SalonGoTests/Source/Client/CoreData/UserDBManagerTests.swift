//
//  CoreDataUserManager.swift
//  SalonGoTests
//
//  Created by Yago Marques on 21/11/22.
//

import XCTest
@testable import SalonGo

final class UserDBManagerTests: XCTestCase {

    func test_createUser_whenDatabaseIsEmpty_shouldSaveUserOnDatabase() {
        let sut = makeSUT()
        let myUser = UserEntityMock.getDefault()

        let user = try? sut.createUser(with: myUser)

        XCTAssertNotNil(user)
        XCTAssertEqual(user?.name, myUser.name)
        XCTAssertEqual(user?.phoneNumber, myUser.phoneNumber)
        XCTAssertEqual(user?.createdAt, myUser.createdAt)
        XCTAssertEqual(user?.updatedAt, myUser.updatedAt)
    }

    func test_createUser_whenDatabaseIsNotEmpty_shouldNotSaveNewUserOnDatabase() {
        let sut = makeSUT()
        let myUser = UserEntityMock.getDefault()
        let mySecondUser = UserEntityMock.getDefault()

        _ = try? sut.createUser(with: myUser)
        _ = try? sut.createUser(with: mySecondUser)
        let users = try? sut.fetchUser()

        XCTAssertEqual(users?.count, 1)
    }

    func test_fetchUser_whenDatabaseIsNotEmpty_shouldReturnAnArray() {
        let sut = makeSUT()
        let myUser = UserEntityMock.getDefault()

        _ = try? sut.createUser(with: myUser)
        let users = try? sut.fetchUser()

        XCTAssertNotNil(users)
        XCTAssertEqual(users!.count, 1)
    }

    func test_updateUser_whenUserExists_shouldModifyCurrentUser() {
        let sut = makeSUT()
        let myUser = UserEntityMock.getDefault()
        let mySecondUser = UserEntityMock.getUnique(withName: "John")

        _ = try? sut.createUser(with: myUser)
        try? sut.updateUser(user: mySecondUser)
        let users = try? sut.fetchUser()

        XCTAssertEqual(users?.first?.name, "John")
    }

    func test_deleteUser_whenUserExists_shouldDeleteCurrentUser() {
        let sut = makeSUT()

        try? sut.deleteUser()
        let users = try? sut.fetchUser()

        XCTAssertTrue(users!.isEmpty)
    }

    func test_fetchUser_whenDatabaseIsEmpty_shouldReturnAnEmptyArray() {
        let sut = makeSUT()

        let users = try? sut.fetchUser()

        XCTAssertTrue(users!.isEmpty)
    }

}

extension UserDBManagerTests {
    private func makeSUT() -> UserDBManager {
        CoreDataClient(persistentContainer: CoreDataStackFake.persistentContainer)
    }
}
