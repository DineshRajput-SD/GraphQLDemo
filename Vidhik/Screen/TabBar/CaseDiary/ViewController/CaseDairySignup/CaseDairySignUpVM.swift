//
//  CaseDairySignUpVM.swift
//  Vidhik
//
//  Created by Dinesh Rajput on 03/04/24.
//

import Foundation

class CaseDairySignUpVM {
     // MARK: ===================== CaseDairy Login TextField Validation =====================
    func caseDairyLoginTextFieldValidation(userName: String, password: String, confirmPassword: String) -> Bool {
        guard !(userName.isEmpty) else {
            return AlertView.show(title: alertTitle, message: "Please enter user name.")
        }
        
        guard userName.isValid(type: .userName) else {
            return AlertView.show(title: alertTitle, message: "Please enter valid user name.")
        }
      
        guard !(password.isEmpty) else {
            return AlertView.show(title: alertTitle, message: "Please enter password.")
        }
        
        guard password.isValid(type: .password) else {
            return AlertView.show(title: alertTitle, message: "Please enter valid password.")
        }
        guard !(confirmPassword.isEmpty) else {
            return AlertView.show(title: alertTitle, message: "Please enter confirmpassword.")
        }
        
        guard password == confirmPassword else {
            return AlertView.show(title: alertTitle, message: "Please enter password and confirm password dose not match.")
        }
        return true
        
    }
    
    // MARK: ===================== Case Dairy Signup Api call =====================
    func caseDairySignupApi(callback: @escaping () -> ()) {
        
    }
}
