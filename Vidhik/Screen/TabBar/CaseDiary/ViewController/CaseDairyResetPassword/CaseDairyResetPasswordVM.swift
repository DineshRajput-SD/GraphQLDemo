//
//  CaseDairyResetPasswordVM.swift
//  Vidhik
//
//  Created by Dinesh Rajput on 03/04/24.
//

import Foundation

class CaseDairyResetPasswordVM {
   //MARK: ==================== CaseDairy ResetPassword Validation Method ====================
    func caseDairyResetPasswordValidation(oldPassword: String, newPassword: String, confirmPassword: String) -> Bool {
        
        guard !oldPassword.isEmpty else {
            return AlertView.show(title: alertTitle, message: "Please enter old password")
        }
        
        guard oldPassword.isValid(type: .password) else {
            return AlertView.show(title: alertTitle, message: "Please enter valid old password")
        }
        
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
