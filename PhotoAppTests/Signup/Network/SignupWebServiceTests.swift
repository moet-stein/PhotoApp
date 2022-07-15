//
//  SignupWebServiceTests.swift
//  PhotoAppTests
//
//  Created by Moe Steinmueller on 07.07.22.
//

import XCTest
@testable import PhotoApp

class SignupWebServiceTests: XCTestCase {
    
    var sut: SignupWebService!
    var signFromRequestFormModel: SignupFormRequestModel!

    override func setUp() {
        let config = URLSessionConfiguration.ephemeral
        config.protocolClasses = [MockURLProtocol.self]
        let urlSession = URLSession(configuration: config)
        sut = SignupWebService(urlString: SignupConstants.signupURLString, urlSession: urlSession)
        signFromRequestFormModel = SignupFormRequestModel(firstName: "Moe", lastName: "Stein", username: "mstein", email: "test@test.com", password: "12345678")
    }

    override func tearDown() {
        sut = nil
        signFromRequestFormModel = nil
        MockURLProtocol.stubResponseData = nil
        MockURLProtocol.error = nil
    }

    
    func testSignupWebService_WhenGivenSuccessfullResponse_ReturnsSuccess() {
        //Arrange
        let jsonString = "{\"status\":\"ok\"}"
        MockURLProtocol.stubResponseData = jsonString.data(using: .utf8)

        let expectation = self.expectation(description: "Signup Web Service Response Expectation")
        
        //Act
        sut.signup(withForm: signFromRequestFormModel) { (signupResponseModel, error) in
            
            //Assert
            //"{\"status\":\"ok\"}"
            XCTAssertEqual(signupResponseModel?.status, "ok")
            expectation.fulfill()
        }
        
        self.wait(for: [expectation], timeout: 5)
    }
    
    func testSignupWebService_WhenReceiveDifferentJSONResponse_ErrorTookPlace() {
        //Arrange
        let jsonString = "{\"path\":\"/users\", \"error\":\"Internal Server Error\"}"
        MockURLProtocol.stubResponseData = jsonString.data(using: .utf8)
        
        let expectation = self.expectation(description: "Signup() method expectation for a response that contains a different JSON structure")
        
        //Act
        sut.signup(withForm: signFromRequestFormModel) { (signupResponseModel, error) in
            
            //Assert
            XCTAssertNil(signupResponseModel, "The response model for a request containing unknown JSPN response, should have been nil")
            XCTAssertEqual(error, SignupError.invalidResponseModel, "The signup() method did not return expected error")
            expectation.fulfill()
        }
        
        self.wait(for: [expectation], timeout: 5)
    }
    
    func testSignupWebservice_WhenEmptyURLStringProvided_RetrunsError() {
        //Arrange
        let expectation = self.expectation(description: "An empty request URL string expectaion")
        sut = SignupWebService(urlString: "")
        
        //Act
        sut.signup(withForm: signFromRequestFormModel) { (signResponseModel, error) in
            
            //Assert
            XCTAssertEqual(error, SignupError.invalidRequestURLString, "The signup() method did not return an expected error for an invalidRequestURLString error")
            XCTAssertNil(signResponseModel, "When an invalidRequestURLString takes place, the response model must be nil")
            expectation.fulfill()
        }

        self.wait(for: [expectation], timeout: 2)
    }
    
    func testSignupWebService_WhenURLRequestFails_ReturnErrorMessageDescription() {
        //Arrange
        let expectation = self.expectation(description: "A failed Request expectation")
        let errorDescription = "The operation couldn’t be completed. (PhotoApp.SignupError error 0.)"
        MockURLProtocol.error = SignupError.failedRequest(description: errorDescription)
        
        //Act
        sut.signup(withForm: signFromRequestFormModel) { (signupResponseModel, error) in
            //Assert
            XCTAssertEqual(error, SignupError.failedRequest(description: errorDescription), "The signup() method did not return an expecter error for the Failed Request")
//            XCTAssertEqual(error?.localizedDescription, errorDescription)
            expectation.fulfill()
        }
        self.wait(for: [expectation], timeout: 2)
      
    }
}
