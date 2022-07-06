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
        XCTAssertTrue(isFirstNameValid, "The isFirstNameValid() should have returned TRUE for a valid firstName but returned FALSE")
    }
    
    func testSingupFormModelValidator_WhenTooShortFirstNameProvided_ShouldReturnFalse() {
        
        //Arrange
        //Act
        let isFirstNameValid = sut.isFirstNameValid(firstName: "M")
        
        //Assert
        XCTAssertFalse(isFirstNameValid, "The isFirstNameValid() should have returned FALSE for a firstName that is shorter than \(SignupConstants.firstNameMinLength) characteres but returned TRUE")
    }
    
    func testSignupFormModelValidator_WhenTooLongFirstNameProvideed_ShouldReturnFalse() {
        
        let isFirstNameValid = sut.isFirstNameValid(firstName: "tooLongFirstName")
        
        XCTAssertFalse(isFirstNameValid, "The isFirstNameValid() should have returned FALSE for a firstName that is longer than \(SignupConstants.firstNameMaxLength) characteres but returned TRUE")
    }

    func testSignFormModelValidator_WhenValidLastNameProvided_ShouldReturnTrue() {
        
        let isLastNameValid = sut.isLastNameValid(lastName: "Steinmueller")
        
        XCTAssertTrue(isLastNameValid, "The isLastNameValid() should have returned TRUE for a valid lastName but returned FALSE")
    }
    
    func testSingupFormModelValidator_WhenTooShortLasttNameProvided_ShouldReturnFalse() {
        let isLastNameValid = sut.isLastNameValid(lastName: "S")
        
        XCTAssertFalse(isLastNameValid, "The isLastNameValid() should have returned FALSE for a lastName that is shorter than \(SignupConstants.lastNameMinLength) characteres but returned TRUE")
    }
    
    func testSignupFormModelValidator_WhenTooLongLastNameProvideed_ShouldReturnFalse() {
        let isLastNameValid = sut.isLastNameValid(lastName: "SteinmuellerSteinmueller")
        
        XCTAssertFalse(isLastNameValid, "The isLastNameValid() should have returned FALSE for a lastName that is longer than \(SignupConstants.lastNameMaxLength) characteres but returned TRUE")
    }
    
    func testSignFormModelValidator_WhenValidEmailProvided_ShouldReturnTrue() {
        let isEmailValid = sut.isEmailValid(email: "abc123@gmail.com")
        
        XCTAssertTrue(isEmailValid, "The isEmailValid() should have returned TRUE for an email that is valid but returned FALSE")
    }
    
    func testSignFormModelValidator_WhenEmailWithoutSymbolProvided_ShouldReturnFalse() {
        let isEmailValid = sut.isEmailValid(email: "abc123gmail.com")
        
        XCTAssertFalse(isEmailValid, "The isEmailValid() should have returned FALSE for an email that does not have @ but returned TRUE")
    }
    
    func testSignFormModelValidator_WhenEmailWithoutSuffixProvided_ShouldReturnFalse() {
        let isEmailValid = sut.isEmailValid(email: "abc123@gmail")
        
        XCTAssertFalse(isEmailValid, "The isEmailValid() should have returned FALSE for an email that does not have a suffix but returned TRUE")
    }
    
    func testSignFormModelValidator_WhenEmptyEmailProvided_ShouldReturnFalse() {
        let isEmailValid = sut.isEmailValid(email: "")
        
        XCTAssertFalse(isEmailValid, "The isEmailValid() should have returned FALSE for an empty email but returned TRUE")
    }
    
    func testSignFormModelValidator_WhenEmailWithoutLocalPartProvided_ShouldReturnFalse() {
        let isEmailValid = sut.isEmailValid(email: "@gmail.com")
        
        XCTAssertFalse(isEmailValid, "The isEmailValid() should have returned FALSE for an email without a local part but returned TRUE")
    }
    
}
