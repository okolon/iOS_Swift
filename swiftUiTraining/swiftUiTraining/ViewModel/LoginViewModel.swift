//
//  LoginViewModel.swift
//  lateBite
//
//  Created by Norman Okolo on 17/04/2023.
//

import Foundation

class LoginViewModel {
    func validLogin(emailField: String?, passwordField: String?)-> Bool {
        var isValid = false
        
        guard let emailId = emailField else {
            return isValid
        }
        
        guard let password = passwordField else {
            return isValid
        }
        
        let isPasswordValid = password.count >= 6
        
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        
        let isEmailValid = emailPredicate.evaluate(with: emailId)
        
        isValid = isEmailValid && isPasswordValid
        
        return isValid
    }
}
