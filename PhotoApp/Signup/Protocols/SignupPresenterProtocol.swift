//
//  SignupPresenterProtocol.swift
//  PhotoApp
//
//  Created by Moe Steinmueller on 11.07.22.
//

import Foundation

protocol SignupPresenterProtocol: AnyObject {
    init(formModelValidator: SignupModelValidatorProtocol, webservice: SignupWebServiceProtocol, delegate: SignupViewDelegateProtocol)
    
    func processUserSignup(formModel: SignupFormModel) throws
}
