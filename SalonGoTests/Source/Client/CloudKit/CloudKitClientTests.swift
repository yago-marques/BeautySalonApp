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
    func test_createRecord_withAccountEntity_recordsNotEmpty() {
        let myAccount = EntityMocks.getAccount(id: "Account")
        let (sut, containerStub) = self.makeSUT()

        sut.create(AccountEntity(account: myAccount)) { error in
            XCTAssertNil(error)
            XCTAssertFalse(containerStub.records.isEmpty)
        }
    }

    func test_createRecord_withUserEntity_recordsNotEmpty() {
        let myUser = EntityMocks.getUser(id: "User")
        let (sut, containerStub) = self.makeSUT()

        sut.create(UserEntity(user: myUser)) { error in
            XCTAssertNil(error)
            XCTAssertFalse(containerStub.records.isEmpty)
        }
    }

    func test_createRecord_withServiceEntity_recordsNotEmpty() {
        let myService = EntityMocks.getService(id: "Service")
        let (sut, containerStub) = self.makeSUT()

        sut.create(ServiceEntity(service: myService)) { error in
            XCTAssertNil(error)
            XCTAssertFalse(containerStub.records.isEmpty)
        }
    }

    func test_createRecord_withCompanyEntity_recordsNotEmpty() {
        let myCompany = EntityMocks.getCompany(id: "Company")
        let (sut, containerStub) = self.makeSUT()

        sut.create(CompanyEntity(company: myCompany)) { error in
            XCTAssertNil(error)
            XCTAssertFalse(containerStub.records.isEmpty)
        }
    }

    func test_createRecord_withRatingEntity_recordsNotEmpty() {
        let myRating = EntityMocks.getRating(id: "Rating")
        let (sut, containerStub) = self.makeSUT()

        sut.create(RatingEntity(rating: myRating)) { error in
            XCTAssertNil(error)
            XCTAssertFalse(containerStub.records.isEmpty)
        }
    }

    func test_createRecord_withAppointmentEntity_recordsNotEmpty() {
        let myAppointment = EntityMocks.getAppointment(id: "Appointment")
        let (sut, containerStub) = self.makeSUT()

        sut.create(AppointmentEntity(appointment: myAppointment)) { error in
            XCTAssertNil(error)
            XCTAssertFalse(containerStub.records.isEmpty)
        }
    }

    // MARK: Read Record
    func test_fetchRecord_atAccountTable_validAccountRecordsAccess() {
        let (sut, containerStub) = self.makeSUT()
        containerStub.oneRecordForEachEntity()

        sut.read(at: .account) { _ in
            XCTAssertEqual(containerStub.recordsAccessCounter, 1)
        }
    }

    func test_fetchRecord_atUserTable_validUserRecordsAccess() {
        let (sut, containerStub) = self.makeSUT()
        containerStub.oneRecordForEachEntity()

        sut.read(at: .user) { _ in
            XCTAssertEqual(containerStub.recordsAccessCounter, 1)
        }
    }

    func test_fetchRecord_atCompanyTable_validCompanyRecordsAccess() {
        let (sut, containerStub) = self.makeSUT()
        containerStub.oneRecordForEachEntity()

        sut.read(at: .company) { _ in
            XCTAssertEqual(containerStub.recordsAccessCounter, 1)
        }
    }

    func test_fetchRecord_atRatingTable_validRatingRecordsAccess() {
        let (sut, containerStub) = self.makeSUT()
        containerStub.oneRecordForEachEntity()

        sut.read(at: .rating) { _ in
            XCTAssertEqual(containerStub.recordsAccessCounter, 1)
        }
    }

    func test_fetchRecord_atAppointmentTable_validAppointmentRecordsAccess() {
        let (sut, containerStub) = self.makeSUT()
        containerStub.oneRecordForEachEntity()

        sut.read(at: .appointment) { _ in
            XCTAssertEqual(containerStub.recordsAccessCounter, 1)
        }
    }

    func test_fetchRecord_atServiceTable_validServiceRecordsAccess() {
        let (sut, containerStub) = self.makeSUT()
        containerStub.oneRecordForEachEntity()

        sut.read(at: .service) { _ in
            XCTAssertEqual(containerStub.recordsAccessCounter, 1)
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
