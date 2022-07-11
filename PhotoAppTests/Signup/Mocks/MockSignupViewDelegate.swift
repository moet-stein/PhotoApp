//
//  MockSignupViewDelegate.swift
//  PhotoAppTests
//
//  Created by Moe Steinmueller on 11.07.22.
//

import Foundation
import XCTest
@testable import PhotoApp

class MockSignupViewDelegate: SignupViewDelegateProtocol {
    var expectation: XCTestExpectation?
    var successfulSignupCounter = 0
    
    func successfulSignup() {
        expectation?.fulfill()
        successfulSignupCounter += 1
    }
    
    func errorHandler(error: SignupError) {
        //
    }
}
