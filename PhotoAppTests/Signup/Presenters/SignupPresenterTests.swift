//
//  SignupPresenterTests.swift
//  PhotoAppTests
//
//  Created by Moe Steinmueller on 08.07.22.
//

import XCTest
@testable import PhotoApp

class SignupPresenterTests: XCTestCase {
    
    var signupFormModel: SignupFormModel!
    var mockSignupModelValidator: MockSignupModelValidator!
    var mockSignupWebService: MockSignupWebService!
    var sut: SignupPresenter!
    var mockSignupViewDelegate: MockSignupViewDelegate!

    override func setUp() {
        signupFormModel = SignupFormModel(firstName: "Moe",
                                              lastName: "Stein",
                                              email: "test@test.com",
                                              password: "12345678",
                                              repeatPassword: "12345678")
        mockSignupModelValidator = MockSignupModelValidator()
        mockSignupWebService = MockSignupWebService()
        mockSignupViewDelegate = MockSignupViewDelegate()
        sut = SignupPresenter(formModelValidator: mockSignupModelValidator, webservice: mockSignupWebService, delegate: mockSignupViewDelegate)
        
    }

    override func tearDown() {
        signupFormModel = nil
        mockSignupModelValidator = nil
        mockSignupWebService = nil
        sut = nil
        mockSignupViewDelegate = nil
    }

    
    func testSignupPresenter_WhenInformationProvided_WillValidateEachProperty() {
        //Act
        sut.processUserSignup(formModel: signupFormModel)
        
        //Assert
        XCTAssertTrue(mockSignupModelValidator.isFirstNameValidated, "First name was not validated")
        XCTAssertTrue(mockSignupModelValidator.isLastNameValidated, "Last name was not validated")
        XCTAssertTrue(mockSignupModelValidator.isEmailValidated, "Eamil format was not validated")
        XCTAssertTrue(mockSignupModelValidator.isPasswordValidated, "Password was not validated")
        XCTAssertTrue(mockSignupModelValidator.isPasswordEqualityValidated, "Did not validate two passwords match")
    }
    
    func testSignupPresenter_WhenGivenValidFormModel_ShouldCallSignupMethod() {
        //Act
        sut.processUserSignup(formModel: signupFormModel)
        
        //Assert
        XCTAssertTrue(mockSignupWebService.isSignupMethodCalled, "The signup() method was not called in the SignupWebService class")
    }
    
    func testSignupPresenter_WhenSignupOperationSuccessful_CallsSuccessOnViewDelegate() {
        // Arrange
        let myExpectation = expectation(description: "Expected the successfulSignup() method to be called")
        
        mockSignupViewDelegate.expectation = myExpectation
        
        // Act
        sut.processUserSignup(formModel: signupFormModel)
        self.wait(for: [myExpectation], timeout: 5)
        
        //Assert
        XCTAssertEqual(mockSignupViewDelegate.successfulSignupCounter, 1, "The successfulSignup() method was called more than one time")
    }


    func testSignupPresenter_WhenSignupOperationFails_ShouldCallErrorOnDelegate() {
        let errorHandlerExpectation = expectation(description: "Expected the errorHandler() method to be called")
        mockSignupViewDelegate.expectation = errorHandlerExpectation
        mockSignupWebService.shouldReturnError = true
        
        //Act
        sut.processUserSignup(formModel: signupFormModel)
        self.wait(for: [errorHandlerExpectation], timeout: 5)
        
        //Assert
        XCTAssertEqual(mockSignupViewDelegate.errorHandlerCounter, 1, "The errorHandler() method was called more than one time")
    }
}
