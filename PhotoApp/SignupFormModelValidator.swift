//
//  SignupFormModelValidator.swift
//  PhotoApp
//
//  Created by Moe Steinmueller on 06.07.22.
//

import Foundation


class SignupFormModelValidator {
    
    func isFirstNameValid(firstName: String) -> Bool {
        var returnValue = true
        
        if firstName.count < SignupConstants.firstNameMinLength || firstName.count > SignupConstants.firstNameMaxLength {
            returnValue = false
        }
        
        return returnValue
    }
}
