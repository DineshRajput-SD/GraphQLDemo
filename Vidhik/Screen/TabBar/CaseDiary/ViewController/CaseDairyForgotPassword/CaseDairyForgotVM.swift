//
//  CaseDairyForgotVM.swift
//  Vidhik
//
//  Created by Dinesh Rajput on 03/04/24.
//

import Foundation

class CaseDairyForgotVM {
    // MARK: ==================== IsTextField Validation Method ====================
    func caseDairyForgotPasswordValidation(email: String) -> Bool {
         
        guard !(email.isEmpty) else { return  AlertView.show(title: alertTitle, message: "Please enter email") }
         
        guard email.isValid(type: .email) else { return AlertView.show(title: alertTitle, message: "Please enter valid email") }
        
        return true
    }
}
