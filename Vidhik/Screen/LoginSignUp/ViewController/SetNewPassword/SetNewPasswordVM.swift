//
//  SetNewPasswordVM.swift
//  Vidhik
//
//  Created by Dinesh Rajput on 01/04/24.
//

import Foundation

class SetNewPasswordVM {
    
    var signUpPhoneNumberAndEmail: String?
    var isLoginType: String?
    
    // MARK: =============================================== Cretaed TextField Validation ===============================================
    
    func isSetNewPasswordTextFieldValidation(newPassword: String, confirmPassword: String) -> Bool {
        
        guard !(newPassword.isEmpty) else {
            return AlertView.show(title: alertTitle, message: "Please enter new password")
        }
        
        guard newPassword.isValid(type: .password) else {
            return AlertView.show(title: alertTitle, message: "Please enter valid new password")
        }
        
        guard !(confirmPassword.isEmpty) else {
            return AlertView.show(title: alertTitle, message: "Please enter confirm password")
        }
        
        guard newPassword == confirmPassword else {
            return AlertView.show(title: alertTitle, message: "New password and confirm password dose not match.")
            
        }
        return true
    }
}

// MARK: =============================================== API Calling Extension ===============================================

extension SetNewPasswordVM {
    
    // MARK: =============================================== Reset Password On Phone Number API Calling ===============================================
    func resetPasswordOnPhoneNumber(password: String, confirmPassword: String, userType: String,callback: @escaping(ResponseType, String) -> ()) {
        
        let resetPasswordOnPhoneNumber = ResetPasswordByPhoneNumber(phoneNumber: signUpPhoneNumberAndEmail ?? "", password: password, confirmPassword: confirmPassword, userType: userType)
        
        VidhikBaseURL.shared.apollo.perform(mutation: resetPasswordOnPhoneNumber) { [weak self] result in
            guard let self = self else { return }
            print(self)
            
            switch result {
                
            case .success(let resultData):
                guard let data = try? result.get().data else { return }
                
                if let resetPasswordOnPhoneNumber = data.resultMap["resetPassword"] as? [String: Any] {
                    if let status = resetPasswordOnPhoneNumber["status"] as? Int, let message = resetPasswordOnPhoneNumber["message"] as? String {
                        if status == 200 {
                            callback(.success, message)
                        } else {
                            callback(.failure, message)
                        }
                    } else if let error = resultData.errors {
                        callback(.failure, error.description)
                        print("GraphQL errors:", error)
                    } else {
                        callback(.failure, resultData.errors?.description ?? "")
                        print("Unexpected response format")
                    }
                }
            case .failure(let error):
                callback(.failure, error.localizedDescription)
            }
        }
    }
    
    // MARK: =============================================== Reset Password On Email Api Calling ===============================================
    func resetPasswordOnEmail(password: String, confirmPassword: String, userType: String, callback: @escaping(ResponseType, String) -> ()) {
        
        let resetPasswordOnPhoneNumber = ResetPasswordByEmail(email: signUpPhoneNumberAndEmail ?? "", password: password, confirmPassword: confirmPassword, userType: userType)
        
        VidhikBaseURL.shared.apollo.perform(mutation: resetPasswordOnPhoneNumber) { [weak self] result in
            guard let self = self else { return }
            print(self)
            
            switch result {
                
            case .success(let resultData):
                guard let data = try? result.get().data else { return }
                
                if let resetPasswordOnEmail = data.resultMap["resetPassword"] as? [String: Any] {
                    if let status = resetPasswordOnEmail["status"] as? Int, let message = resetPasswordOnEmail["message"] as? String {
                        if status == 200 {
                            callback(.success, message)
                        } else {
                            callback(.failure, message)
                        }
                    } else if let error = resultData.errors {
                        callback(.failure, error.description)
                        print("GraphQL errors:", error)
                    } else {
                        callback(.failure, resultData.errors?.description ?? "")
                        print("Unexpected response format")
                    }
                }
            case .failure(let error):
                callback(.failure, error.localizedDescription)
            }
        }
    } 
}
