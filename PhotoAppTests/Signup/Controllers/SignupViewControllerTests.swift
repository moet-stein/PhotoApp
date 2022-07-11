//
//  SignupViewControllerTests.swift
//  PhotoAppTests
//
//  Created by Moe Steinmueller on 11.07.22.
//

import XCTest
@testable import PhotoApp

class SignupViewControllerTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }


    func testSignupViewController_WhenCreated_HasRequiredTextFieldsEmpty() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let sut = storyboard.instantiateViewController(identifier: "SignupViewController") as? SignupViewController
    }
}
