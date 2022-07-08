//
//  SignupError.swift
//  PhotoApp
//
//  Created by Moe Steinmueller on 07.07.22.
//

import Foundation

enum SignupError: Error {
    case responseModelParsingError
    case invalidRequestURLStringError
}
