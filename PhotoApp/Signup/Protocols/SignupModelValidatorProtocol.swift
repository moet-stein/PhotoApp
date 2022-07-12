//
//  SignupModelValidatorProtocol.swift
//  PhotoApp
//
//  Created by Moe Steinmueller on 08.07.22.
//

import Foundation

protocol SignupModelValidatorProtocol {
    func isFirstNameValid(firstName: String) -> Bool
    func isLastNameValid(lastName: String) -> Bool
    func usernameValid(username: String) throws -> Bool
    func isEmailValid(email: String) -> Bool
    func isPasswordValid(password: String) -> Bool
    func doPasswordsMatch(password: String, repeatPassword: String) -> Bool
}
