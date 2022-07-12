//
//  TestingViewControllerNavigationTests.swift
//  PhotoAppTests
//
//  Created by Moe Steinmueller on 12.07.22.
//

import XCTest
@testable import PhotoApp

class TestingViewControllerNavigationTests: XCTestCase {
    
    var sut: SignupViewController!

    override func setUpWithError() throws {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        sut = storyboard.instantiateViewController(identifier: "SignupViewController") as? SignupViewController
        
        sut.loadViewIfNeeded()
    }

    override func tearDownWithError() throws {
        sut = nil
    }

}
