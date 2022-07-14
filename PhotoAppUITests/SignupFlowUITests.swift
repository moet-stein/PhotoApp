//
//  SignupFlowUITests.swift
//  SignupFlowUITests
//
//  Created by Moe Steinmueller on 13.07.22.
//

import XCTest

class SignupFlowUITests: XCTestCase {
    
    private var app: XCUIApplication!
    private var firstName: XCUIElement!
    private var lastName: XCUIElement!
    private var username: XCUIElement!
    private var email: XCUIElement!
    private var password: XCUIElement!
    private var repeatPassword: XCUIElement!
    private var signupButton: XCUIElement!
    private var loginButton: XCUIElement!

    override func setUpWithError() throws {

        try super.setUpWithError()
        
        app = XCUIApplication()
        app.launchArguments = ["-skipSurvey", "-debugServer"]
//        app.launchEnvironment = ["signupUrl" : "http://appsdeveloperblog.com/api/v2/signup-mock-service/users",
//                                 "inAppPurchaseEnabled" : "true",
//                                 "inAppAdsEnabled": "true"]
        app.launch()
        
        firstName = app.textFields["firstNameTextField"]
        lastName = app.textFields["lastNameTextField"]
        username = app.textFields["usernameTextField"]
        email = app.textFields["emailTextField"]
        password = app.secureTextFields["passwordTextField"]
        repeatPassword = app.secureTextFields["repeatPasswordTextField"]
        signupButton = app.buttons["signupButton"]
        loginButton = app.buttons["loginButton"]
        
        continueAfterFailure = false
    }

    override func tearDownWithError() throws {
        app = nil
        firstName = nil
        lastName = nil
        username = nil
        email = nil
        password = nil
        repeatPassword = nil
        signupButton = nil
        loginButton = nil
        
        try super.tearDownWithError()
    }

    func testSignupViewController_WhenViewLoaded_RequiredUIElementsAreEnabled() throws {
        
        XCTAssertTrue(firstName.isEnabled, "First name UITextField is not enabled for user interactions")
        XCTAssertTrue(lastName.isEnabled, "Last name UITextField is not enabled for user interactions")
        XCTAssertTrue(username.isEnabled, "Username UITextField is not enabled for user interactions")
        XCTAssertTrue(email.isEnabled, "Email UITextField is not enabled for user interactions")
        XCTAssertTrue(password.isEnabled, "Password UITextField is not enabled for user interactions")
        XCTAssertTrue(repeatPassword.isEnabled, "RepeatPassword UITextField is not enabled for user interactions")
        XCTAssertTrue(signupButton.isEnabled, "SignupButton is not enabled for user interactions")
        XCTAssertTrue(loginButton.isEnabled, "LoginButton is not enabled for user interactions")
    }
    
    func testViewController_WhenInvalidFormSubmitted_PresentesErrorDialog() {
        // Arrange
    
        firstName.tap()
        firstName.typeText("S")
        
        lastName.tap()
        lastName.typeText("l")
        
        username.tap()
        username.typeText("s")
        
        email.tap()
        email.typeText("@")
        
        password.tap()
        password.typeText("12")
        
        repeatPassword.tap()
        repeatPassword.typeText("123")
        
        // Act
        signupButton.tap()
        
        let emailTextFieldScreenshot = email.screenshot()
        let emailTextFieldAttachment = XCTAttachment(screenshot: emailTextFieldScreenshot)
        emailTextFieldAttachment.name = "Screenshot of Email UITextField"
        emailTextFieldAttachment.lifetime = .keepAlways
        add(emailTextFieldAttachment)
        
//        let currentAppWindow = app.screenshot()
        let currentAppWindow = XCUIScreen.main.screenshot()
        let currentAppWindowAttachment = XCTAttachment(screenshot: currentAppWindow)
        currentAppWindowAttachment.name = "Signup page screenshot"
        currentAppWindowAttachment.lifetime = .keepAlways
        add(currentAppWindowAttachment)
        
        
        // Assert
        XCTAssertTrue(app.alerts["errorAlertDialog"].waitForExistence(timeout: 1), "An Error ALert dialog was not presented when invalid signup form was submitted")
    }
    
    func testViewController_WhenValidFormSubmitted_PresentesSuccessDialog() {
        // Arrange
    
        firstName.tap()
        firstName.typeText("Moe")
        
        lastName.tap()
        lastName.typeText("Stein")
        
        username.tap()
        username.typeText("hello")
        
        email.tap()
        email.typeText("test@google.com")
        
        password.tap()
        password.typeText("12345678")
        
        repeatPassword.tap()
        repeatPassword.typeText("12345678")
        
        // Act
        signupButton.tap()
        
        // Assert
        XCTAssertTrue(app.alerts["successAlertDialog"].waitForExistence(timeout: 1), "An Success Alert dialog was not presented when valid signup form was submitted")
    }
    
    func testLoginButton_WhenTapped_PresentLoginViewController() {
        loginButton.tap()
        
        XCTAssertTrue(app.otherElements["LoginViewController"].waitForExistence(timeout: 1), "The LoginViewController was not presented when the loginButton was tapped")
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
