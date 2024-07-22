//
//  JudgeEditProfileVM.swift
//  Vidhik
//
//  Created by NumeroEins on 08/04/24.
//

import Foundation

class JudgeEditProfileVM {
    // MARK: =============================== Validation Methods ===============================
    func judgeEditProfileValidation(judgeName: String, judgeCurrentState: String, judgeCurrentDistrict: String, judgeCourtType: String, judgeCourtName: String, judgePhoneNumber: String, judgeEmail: String) -> Bool {
        
        guard !(judgeName.isEmpty) else { return AlertView.show(title: alertTitle, message: "Please enter your name") }
        
        guard judgeName.isValid(type: .fullName) else { return AlertView.show(title: alertTitle, message: "Please enter valid your name") }
        
        guard !(judgeCurrentState.isEmpty) else { return AlertView.show(title: alertTitle, message: "Please select current state") }
        
        guard !(judgeCurrentDistrict.isEmpty) else { return AlertView.show(title: alertTitle, message: "Please select current district") }
        
        guard !(judgeCourtType.isEmpty) else { return AlertView.show(title: alertTitle, message: "Please select court type") }
        
        guard !(judgeCourtName.isEmpty) else { return AlertView.show(title: alertTitle, message: "Please select court name") }
        
        guard !(judgePhoneNumber.isEmpty) else {
            if judgePhoneNumber.count < 10 { return AlertView.show(title: alertTitle, message: "The phone number must be 10 digits") }
            return AlertView.show(title: alertTitle, message: "Please enter phone number")
        }
        
        guard judgePhoneNumber.isValid(type: .phone) else { return AlertView.show(title: alertTitle, message: "Please enter valid phone number.") }
        
        if judgePhoneNumber.count < 10 { return AlertView.show(title: alertTitle, message: "The phone number must be 10 digits") }
        
        guard !(judgeEmail.isEmpty) else { return AlertView.show(title: alertTitle, message: "Please enter user email") }
        
        guard judgeEmail.isValid(type: .email) else { return AlertView.show(title: alertTitle, message: "Please enter valid email") }
        
        return true
    }
    
    // MARK: ===============================  User Edit Profile Api Call =============================== 
    func judgeEditProfileApiCall(callback: @escaping() -> ()) {
        
    }
}
