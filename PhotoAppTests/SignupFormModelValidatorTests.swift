//
//  SignupFormModelValidatorTests.swift
//  PhotoAppTests
//
//  Created by Moe Steinmueller on 06.07.22.
//

import XCTest
@testable import PhotoApp

class SignupFormModelValidatorTests: XCTestCase {
    
    var sut: SignupFormModelValidator!

    override func setUp() {
        sut = SignupFormModelValidator()
    }
    
    override func tearDown() {
        sut = nil
    }
    
    func testSignFormModelValidator_WhenValidFirstNameProvided_ShouldReturnTrue() {
        
        //Arrange
        //Act
        let isFirstNameValid = sut.isFirstNameValid(firstName: "Namae")
        
        //Assert
        XCTAssertTrue(isFirstNameValid, "The isFirstNameValid() should have returned TRUE for a valid first name but returned FALSE")
    }
    
    func testSingupFormModelValidator_WhenTooShortFirstNameProvided_ShouldReturnFalse() {
        
        //Arrange
        //Act
        let isFirstNameValid = sut.isFirstNameValid(firstName: "S")
        
        //Assert
        XCTAssertFalse(isFirstNameValid, "The isFirstNameValid() should have returned FALSE for a first that is shorter than \(SignupConstants.firstNameMinLength) characteres but returned TRUE")
    }
    
    func testSignupFormModelValidator_WhenTooLongFirstNameProvideed_ShouldReturnFalse() {
        
        let isFirstNameValid = sut.isFirstNameValid(firstName: "tooLongFirstName")
        
        XCTAssertFalse(isFirstNameValid, "The isFirstNameValid() should have returned FALSE for a first that is longer than \(SignupConstants.firstNameMaxLength) characteres but returned TRUE")
    }

}
