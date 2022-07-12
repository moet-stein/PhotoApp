//
//  SignupConstants.swift
//  PhotoApp
//
//  Created by Moe Steinmueller on 06.07.22.
//

import Foundation


struct SignupConstants {
    static let firstNameMinLength = 2
    static let firstNameMaxLength = 10
    static let lastNameMinLength = 2
    static let lastNameMaxLength = 20
    static let usernameMinLength = 3
    static let usernameMaxLength = 7
    static let passwordMinLength = 8
    static let passwordMaxLength = 12
    static let signupURLString = "https://tlyqhtlbn8.execute-api.us-east-1.amazonaws.com/prod/signup-mock-service/users"
}
