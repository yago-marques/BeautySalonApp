//
//  CloudKitClientTests.swift
//  SalonGoTests
//
//  Created by Yago Marques on 08/11/22.
//

import XCTest
@testable import SalonGo

final class CloudKitClientTests: XCTestCase {

    // MARK: Create Record
    func test_createRecord_withAccountEntity() {
        let myAccount = EntityMocks.getAccount(id: "Account")
        let (sut, containerStub) = self.makeSUT()

        sut.create(AccountEntity(account: myAccount)) { error in
            XCTAssertNil(error)
            XCTAssertFalse(containerStub.records.isEmpty)
        }
    }

    func test_createRecord_withUserEntity() {
        let myUser = EntityMocks.getUser(id: "User")
        let (sut, containerStub) = self.makeSUT()

        sut.create(UserEntity(user: myUser)) { error in
            XCTAssertNil(error)
            XCTAssertFalse(containerStub.records.isEmpty)
        }
    }

    func test_createRecord_withServiceEntity() {
        let myService = EntityMocks.getService(id: "Service")
        let (sut, containerStub) = self.makeSUT()

        sut.create(ServiceEntity(service: myService)) { error in
            XCTAssertNil(error)
            XCTAssertFalse(containerStub.records.isEmpty)
        }
    }

    func test_createRecord_withCompanyEntity() {
        let myCompany = EntityMocks.getCompany(id: "Company")
        let (sut, containerStub) = self.makeSUT()

        sut.create(CompanyEntity(company: myCompany)) { error in
            XCTAssertNil(error)
            XCTAssertFalse(containerStub.records.isEmpty)
        }
    }

    func test_createRecord_withRatingEntity() {
        let myRating = EntityMocks.getRating(id: "Rating")
        let (sut, containerStub) = self.makeSUT()

        sut.create(RatingEntity(rating: myRating)) { error in
            XCTAssertNil(error)
            XCTAssertFalse(containerStub.records.isEmpty)
        }
    }

    func test_createRecord_withAppointmentEntity() {
        let myAppointment = EntityMocks.getAppointment(id: "Appointment")
        let (sut, containerStub) = self.makeSUT()

        sut.create(AppointmentEntity(appointment: myAppointment)) { error in
            XCTAssertNil(error)
            XCTAssertFalse(containerStub.records.isEmpty)
        }
    }

    // MARK: Read Record
    

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
