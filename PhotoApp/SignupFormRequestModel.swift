//
//  SignupFormRequestModel.swift
//  PhotoApp
//
//  Created by Moe Steinmueller on 07.07.22.
//

import Foundation


struct SignupFormRequestModel: Encodable {
    let firstName: String
    let lastNaem: String
    let email: String
    let password: String
}