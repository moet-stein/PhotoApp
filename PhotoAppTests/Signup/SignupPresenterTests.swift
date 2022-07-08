//
//  SignupPresenterTests.swift
//  PhotoAppTests
//
//  Created by Moe Steinmueller on 08.07.22.
//

import XCTest
@testable import PhotoApp

class SignupPresenterTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    
    func testSignupPresenter_WhenInformationProvided_WillValidateEachProperty() {
        //Arrange
        let signupFormModel = SignupFormModel(firstName: "Moe",
                                              lastName: "Stein",
                                              email: "test@test.com",
                                              password: "12345678",
                                              repeatPassword: "12345678")
        let mockSignupModelValidator = MockSignupModelValidator()
        let sut = SignupPresenter(formModelValidator: mockSignupModelValidator)
        
        //Act
        sut.processUserSignup(formModel: signupFormModel)
        
        //Assert
        XCTAssertTrue(mockSignupModelValidator.isFirstNameValidated, "First name was not validated")
        XCTAssertTrue(mockSignupModelValidator.isLastNameValidated, "Last name was not validated")
        XCTAssertTrue(mockSignupModelValidator.isEmailValidated, "Eamil format was not validated")
        XCTAssertTrue(mockSignupModelValidator.isPasswordValidated, "Password was not validated")
        XCTAssertTrue(mockSignupModelValidator.isPasswordEqualityValidated, "Did not validate two passwords match")
    }

}
