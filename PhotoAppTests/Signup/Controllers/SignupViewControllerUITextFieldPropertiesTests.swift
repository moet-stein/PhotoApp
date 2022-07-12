//
//  SignupViewControllerUITextFieldPropertiesTests.swift
//  PhotoAppTests
//
//  Created by Moe Steinmueller on 12.07.22.
//

import XCTest
@testable import PhotoApp

class SignupViewControllerUITextFieldPropertiesTests: XCTestCase {

    var storyboard: UIStoryboard!
    var sut: SignupViewController!

    override func setUp() {
        storyboard = UIStoryboard(name: "Main", bundle: nil)
        sut = storyboard.instantiateViewController(identifier: "SignupViewController") as SignupViewController
        sut.loadViewIfNeeded()
    }

    override func tearDown() {
        storyboard = nil
        sut = nil
    }


}
