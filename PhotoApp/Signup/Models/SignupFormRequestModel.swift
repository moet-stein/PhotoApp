//
//  SignupFormRequestModel.swift
//  PhotoApp
//
//  Created by Moe Steinmueller on 07.07.22.
//

import Foundation


struct SignupFormRequestModel: Encodable {
    let firstName: String
    let lastName: String
    let username: String
    let email: String
    let password: String
}
