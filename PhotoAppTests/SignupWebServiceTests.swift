//
//  SignupWebServiceTests.swift
//  PhotoAppTests
//
//  Created by Moe Steinmueller on 07.07.22.
//

import XCTest
@testable import PhotoApp

class SignupWebServiceTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    
    func testSignupWebService_WhenGivenSuccessfullResponse_ReturnsSuccess() {
        //Arrange
        let sut = SignupWebService()
        
        let signFromRequestFormModel = SignupFormRequestModel(firstName: "Moe", lastNaem: "Stein", email: "test@test.com", password: "12345678")
        
        sut.signup(withForm: signFromRequestFormModel) { (signupResponseModel, error) in
            
        }
    }

}
