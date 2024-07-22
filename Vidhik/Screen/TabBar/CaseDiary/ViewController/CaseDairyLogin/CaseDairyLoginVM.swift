//
//  CaseDairyLoginVM.swift
//  Vidhik
//
//  Created by Dinesh Rajput on 03/04/24.
//

import Foundation

class CaseDairyLoginVM {
    
    // MARK: ====================== CaseDairy Login TextField Validation Method =====================
    func caseDairyLoginTextFieldValidation(userName: String, password: String) -> Bool {
       
        guard !(userName.isEmpty) else {
            return AlertView.show(title: alertTitle, message: "Please enter username")
        }
       
        guard !(password.isEmpty) else {
            return AlertView.show(title: alertTitle, message: "Please enter password.")
        }
        
        guard password.isValid(type: .password) else {
            return AlertView.show(title: alertTitle, message: "Please enter valid password.")
        }
        
        return true
        
    }
    // MARK: ===================== Case Dairy Login Api Call =====================
    func caseDairyLoginApiCall(callback: @escaping () -> ()) {
        
    }
}
