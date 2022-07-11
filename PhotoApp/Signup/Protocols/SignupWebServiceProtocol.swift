//
//  SignupWebServiceProtocol.swift
//  PhotoApp
//
//  Created by Moe Steinmueller on 11.07.22.
//

import Foundation

protocol SignupWebServiceProtocol {
    func signup(withForm formModel: SignupFormRequestModel, completionHandler: @escaping (SignupResponseModel?, SignupError?) -> Void)
}
