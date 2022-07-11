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
    
    func successfulSignup() {
        expectation?.fulfill()
    }
    
    func errorHandler(error: SignupError) {
        //
    }
}
