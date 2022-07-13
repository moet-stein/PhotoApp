//
//  SignupError.swift
//  PhotoApp
//
//  Created by Moe Steinmueller on 07.07.22.
//

import Foundation

enum SignupError: LocalizedError, Equatable {
    case invalidResponseModel
    case invalidRequestURLString
    case failedRequest(description: String)
    case illegalCharactersFound
    case invalidFirstName
    case invalidLastName
    case invalidUsername
    case invalidEmail
    case invalidPassword
    case passwordsDoNotMatch
    
    var errorDescription: String? {
        switch self {
        case .failedRequest(let description):
            return description
        case .invalidResponseModel,
             .invalidRequestURLString,
             .illegalCharactersFound,
             .invalidFirstName,
             .invalidLastName,
             .invalidUsername,
             .invalidEmail,
             .invalidPassword,
             .passwordsDoNotMatch:
            return ""
        }
    }
}
