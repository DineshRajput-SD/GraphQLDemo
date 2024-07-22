//
//  UserEditProfileVM.swift
//  Vidhik
//
//  Created by Dinesh Rajput on 03/04/24.
//

import Foundation

class UserEditProfileVM {
    // MARK: ================================  Validation Methods ================================
    func userEditProfileValidation(userName: String, userLocation: String, userPhoneNumber: String, userEmail: String) -> Bool {
        guard !(userName.isEmpty) else { return AlertView.show(title: alertTitle, message: "Please enter user name") }
        guard userName.isValid(type: .fullName) else { return AlertView.show(title: alertTitle, message: "Please enter valid user name") }
        guard !(userLocation.isEmpty) else { return AlertView.show(title: alertTitle, message: "Please select user address") }
        guard !(userPhoneNumber.isEmpty) else {
            if userPhoneNumber.count < 10 {
                return AlertView.show(title: alertTitle, message: "The phone number must be 10 digits")
            }
            return AlertView.show(title: alertTitle, message: "Please enter phone number")
        }
        guard userPhoneNumber.isValid(type: .phone) else { return AlertView.show(title: alertTitle, message: "Please enter valid phone number.") }
        if userPhoneNumber.count < 10 { return AlertView.show(title: alertTitle, message: "The phone number must be 10 digits") }
        guard !(userEmail.isEmpty) else { return AlertView.show(title: alertTitle, message: "Please enter user email") }
        guard userEmail.isValid(type: .email) else { return AlertView.show(title: alertTitle, message: "Please enter valid email") }
        return true
    }
    
    // MARK: ================================ User Edit Profile Api Call ================================ 
    func userEditProfileApiCall(callback: @escaping() -> ()) {
        
    }
}
