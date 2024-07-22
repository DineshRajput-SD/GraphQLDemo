//
//  CaseDairySecondForgotVM.swift
//  Vidhik
//
//  Created by Dinesh Rajput on 03/04/24.
//

import Foundation

class CaseDairySecondForgotVM {
    
    // MARK: ==================== Cretaed Reset Password TextField Validation ====================
    func caseDairyResetPasswordValidation(newPassword: String, confirmPassword: String) -> Bool {
  
        guard !newPassword.isEmpty else {
            return AlertView.show(title: alertTitle, message: "Please enter new password")
        }
        
        guard newPassword.isValid(type: .password) else {
            return AlertView.show(title: alertTitle, message: "Please enter valid confirm password")
        }
        
        guard !confirmPassword.isEmpty else {
            return AlertView.show(title: alertTitle, message: "Please enter confirm password")
        }
        
        guard newPassword == confirmPassword else {
            return AlertView.show(title: alertTitle, message: "Please enter password and confirm password dose not match.")
        }
        return true
    }
    
}
