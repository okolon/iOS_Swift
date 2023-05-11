//
//  LoginViewModel.swift
//  lateBite
//
//  Created by Norman Okolo on 17/04/2023.
//

import Foundation
import LocalAuthentication

class LoginViewModel : ObservableObject {
    
    @Published var credentials = Credentials()
    @Published var AuthenticationError: AuthenticationError?
    
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
    
    func biometricType() -> BiometricType {
        let authContex = LAContext()
        let _ = authContex.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: nil)
        
        switch authContex.biometryType {
            
        case .none:
            return .none
        case .touchID:
            return .touch
        case .faceID:
            return .face
        @unknown default:
            return .none
        }
    }
    
    func authenticationUser(email: String, password: String, completion: @escaping(Result<Credentials, AuthenticationError>) ->()) {
        let credentials = Credentials(email: email, password: password)
        
        let authContext = LAContext()
        var error : NSError?
        let canEvaluate = authContext.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error)
        
        if let error = error {
            switch error.code {
            case -6:
                completion(.failure(.accessDenied))
            case -7:
                if authContext.biometryType == .faceID {
                    completion(.failure(.noFaceID))
                } else {
                    completion(.failure(.noTouchID))
                }
            default:
                completion(.failure(.biometricError))
            }
        }
        
        if canEvaluate {
            if authContext.biometryType != .none{
                authContext.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: "Head to Access the Keychain") { success, error in
                    if error != nil {
                        completion(.failure(.biometricError))
                    } else {
                        completion(.success(credentials))
                    }
                }
            }
        }
    }
}
