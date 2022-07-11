//
//  SignupViewDelegateProtocol.swift
//  PhotoApp
//
//  Created by Moe Steinmueller on 11.07.22.
//

import Foundation

protocol SignupViewDelegateProtocol: AnyObject {
    func successfulSignup()
    func errorHandler(error: SignupError)
}
