//
//  OnboardingControllerTests.swift
//  SalonGoTests
//
//  Created by Yago Marques on 06/12/22.
//

import XCTest
import UIKit
@testable import SalonGo

final class OnboardingControllerTests: XCTestCase {

    func test_setupButtonTitle_withNewTitle_shouldCallViewMethodToModifyTitle() {
        let (sut, doubles) = self.makeSUT()
        let title = "Próximo"

        sut.setup(buttonTitle: title)

        XCTAssertEqual(doubles.viewMock.receivedMessages, [.setup(buttonTitle: title)])
    }

    

}

extension OnboardingControllerTests {
    typealias SutAndDoubles = (
        sut: OnboardingController,
        doubles: (
            presenterSpy: OnboardingPresenterSpy,
            viewMock: OnboardingViewMock
        )
    )

    private func makeSUT() -> SutAndDoubles {
        let presenterSpy = OnboardingPresenterSpy(router: OnboardingRouter())
        let viewMock = OnboardingViewMock()
        let sut = OnboardingController(
            uiView: UIView(frame: .zero),
            viewDelegate: viewMock,
            presenter: presenterSpy
        )

        return (sut, (presenterSpy, viewMock))
    }
}
