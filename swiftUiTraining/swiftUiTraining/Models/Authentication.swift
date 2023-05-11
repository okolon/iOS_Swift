//
//  Authentication.swift
//  swiftUiTraining
//
//  Created by Norman Okolo on 11/05/2023.
//

import Foundation

enum BiometricType {
    case none
    case face
    case touch
}

enum AuthenticationError {
    case noFaceID
    case noTouchID
    case invalidCredentials
    case accessDenied
    case biometricError
}

extension AuthenticationError: LocalizedError {
    
    var id: String {
        self.localizedDescription
    }
    
    var errorDescription: String?
    {
        switch self{

        case .noFaceID:
            return NSLocalizedString("You haven't set up FaceID", comment: "no FaceId")
        case .noTouchID:
            return NSLocalizedString("You haven't set up TouchID", comment: "no TouchId")
        case .invalidCredentials:
            return NSLocalizedString("Invalid Credentials", comment: "Invalid Credentials")
        case .accessDenied:
            return NSLocalizedString("Invalid Credentials", comment: "Invalid Credentials")
        case .biometricError:
            return NSLocalizedString("biometricError", comment: "biometricError")
        }
    }
}
