//
//  EditProfileVM.swift
//  Vidhik
//
//  Created by Dinesh Rajput on 03/04/24.
//

import Foundation

class EditProfileVM {
    
    // MARK: ================= Lawyer Edit profile validation =================
    func lawyerEditProfileTextFiledValidation(comptency: String, phoneNumber: String, email: String) -> Bool {
        guard !(comptency.isEmpty) else {
            if comptency.count < 200 {
                return AlertView.show(title: alertTitle, message: "Please enter maximum 200 character in comptency.")
            }
            return AlertView.show(title: alertTitle, message: "Please enter comptency.")
        }
        
        guard !(phoneNumber.isEmpty) else {
            if phoneNumber.count < 10  {
                return AlertView.show(title: alertTitle, message: "The phone number must be 10 digits.")
            }
            return AlertView.show(title: alertTitle, message: "Please enter phone number.")
        }
        
        guard phoneNumber.isValid(type: .phone) else {
            return AlertView.show(title: alertTitle, message: "Please enter valid phone number.")
        }
        
        if phoneNumber.count < 10 {
            return AlertView.show(title: alertTitle, message: "The phone number must be 10 digits.")
        }
        
        guard !(email.isEmpty) else {
            return AlertView.show(title: alertTitle, message: "Please enter email.")
        }
        
        guard email.isValid(type: .email) else {
            return AlertView.show(title: alertTitle, message: "Please enter valid email.")
        }
        return true
    }
    
    // MARK: ================= Lawyer Edit Profile Api Call  =================
    func lawyerEditProfileApiCall(callback: @escaping () -> ()) {
        
    }
}
