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
    var navigationController: UINavigationController!

    override func setUpWithError() throws {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        sut = storyboard.instantiateViewController(identifier: "SignupViewController") as? SignupViewController
        
        sut.loadViewIfNeeded()
        navigationController = UINavigationController(rootViewController: sut)
    }

    override func tearDownWithError() throws {
        sut = nil
        navigationController = nil
    }
    
    func testSignupViewController_WhenSuccessfulSignup_SecondViewControllerPushed() {

        let myPredicate = NSPredicate { input, _ in
            return (input as? UINavigationController)?.topViewController is SecondViewController
        }

        expectation(for: myPredicate, evaluatedWith: navigationController)

//        sut.signupButton.sendActions(for: .touchUpInside)

        sut.successfulSignup()
        
        waitForExpectations(timeout: 1.5)
    }
    
    func testSignupViewController_WhenSuccessfulSignup_SecondViewControllerPushed_V2() {
        sut.successfulSignup()
        
        RunLoop.current.run(until: Date())
        
        guard let _ = navigationController.topViewController as? SecondViewController else {
            XCTFail()
            return
        }
    }

}
