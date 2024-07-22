//
//  ForgotPassword.swift
//  Vidhik
//
//  Created by Dinesh Rajput on 01/04/24.
//

import Foundation

class ForgotPasswordVM {
    
    var loginType = LoginType.phoneMumber
    var userType = UserSelectionType.lawyer
    var isphoneNumberSelected: Bool = false
    
    // MARK: =============================================== IsTextField Validation Method ===============================================
    func isForgotPasswordTextFieldValidation(phoneNumberAndEmail: String) -> Bool {
        switch loginType {
        case .phoneMumber:
            guard !(phoneNumberAndEmail.isEmpty) else {
                if phoneNumberAndEmail.count < 10 {
                    return AlertView.show(title: alertTitle, message:"The phone number must be 10 digits.")
                }
                return AlertView.show(title: alertTitle, message: "Please enter phone number")
            }
            
            guard phoneNumberAndEmail.isValid(type: .phone) else {
                return AlertView.show(title: alertTitle, message: "Please enter valid phone number")
            }
            if phoneNumberAndEmail.count < 10 {
                return AlertView.show(title: alertTitle, message: "The phone number must be 10 digits")
            }
            
        case .email:
            guard !(phoneNumberAndEmail.isEmpty) else {
                AlertView.show(title: alertTitle, message: "Please enter email", okTitle: "Ok", cancelTitle: "")
                return false
            }
            
            guard phoneNumberAndEmail.isValid(type: .email) else {
                AlertView.show(title: alertTitle, message: "Please enter valid email", okTitle: "Ok", cancelTitle: "")
                return false
            }
        }
        return true
    }
    
    // MARK: =============================================== Lawyer Sequrity quiestion Validation Method ===============================================
    func lawyerQuestionValidation(question: String, answer: String) -> Bool {
        guard !(question.isEmpty) else {
            return AlertView.show(title: alertTitle, message: "Please select sequirty question.")
        }
        
        guard !(answer.isEmpty) else {
            return AlertView.show(title: alertTitle, message: "Please enter the answer.")
        }
        return true
    }
    
    // MARK: =============================================== OTP validation Method ===============================================
    func otpTextFieldValidation(otpNumber: String)-> Bool {
        guard !(otpNumber.isEmpty) else {
            if otpNumber.count < 6 {
                return AlertView.show(title: alertTitle, message: "Otp number must be 6 digits.")
            }
            return AlertView.show(title: alertTitle, message: "Please enter otp")
        }
        if otpNumber.count < 6 {
            return AlertView.show(title: alertTitle, message: "The Otp number must be 6 digits.")
        }
        return true
    }
}

// MARK: =============================================== Api Calling Extension ===============================================

extension ForgotPasswordVM {
    
    // MARK: =============================================== Forgot Password On Phone Number Api Call Method ===============================================
    func forgotPasswordPhoneNumberAPI(phoneNumber: String, userType: String,callback: @escaping (ResponseType, String) -> ()) {
        
        let forgotPasswordOnPhoneNumber = ForgotPasswordByPhoneNumber(phoneNumber: phoneNumber, method: loginType.rawValue, userType: userType)
        
        VidhikBaseURL.shared.apollo.perform(mutation: forgotPasswordOnPhoneNumber) { [weak self] result in
            guard let self = self else { return }
            print(self)
            
            switch result {
                
            case .success(let responseData):
                
                guard let data = try? result.get().data else { return }
                print("data+++++++++++++\(data)")
                if let sendOtp = data.resultMap["forgotPassword"] as? [String: Any] {
                    if let status = sendOtp["status"] as? Int,
                       let message = sendOtp["message"] as? String {
                        
                        if status == 200 {
                            // OTP sent successfully
                            callback(.success, message)
                        } else {
                            callback(.failure, message)
                        }
                        print("Status: \(status)")
                        print("Message: \(message)")
                    }
                } else if let errors = responseData.errors {
                    callback(.failure, errors.description)
                    print("GraphQL errors:", errors)
                } else {
                    callback(.failure, responseData.errors?.description ?? "")
                    print("Unexpected response format")
                }
                
            case .failure(let error):
                callback(.failure, error.localizedDescription)
                
            }
        }
    }
    
    // MARK: =============================================== Forgot Password On Email Api Call Method ===============================================
    func forgotPasswordEmailAPI(email: String, userType: String,callback: @escaping (ResponseType, String) -> ()) {
        
        let forgotPasswordOnEmail = ForgotPasswordByEmail(email: email, method: loginType.rawValue, userType: userType)
        
        VidhikBaseURL.shared.apollo.perform(mutation: forgotPasswordOnEmail) { [weak self] result in
            guard let self = self else { return }
            print(self)
            
            switch result {
                
            case .success(let responseData):
                
                guard let data = try? result.get().data else { return }
                print("data+++++++++++++\(data)")
                if let sendOtp = data.resultMap["forgotPassword"] as? [String: Any] {
                    if let status = sendOtp["status"] as? Int,
                       let message = sendOtp["message"] as? String {
                        
                        if status == 200 {
                            // OTP sent successfully
                            callback(.success, message)
                        } else {
                            callback(.failure, message)
                        }
                        print("Status: \(status)")
                        print("Message: \(message)")
                    }
                } else if let errors = responseData.errors {
                    callback(.failure, errors.description)
                    print("GraphQL errors:", errors)
                } else {
                    callback(.failure, responseData.errors?.description ?? "")
                    print("Unexpected response format")
                }
                
            case .failure(let error):
                callback(.failure, error.localizedDescription)
                
            }
        }
    }
    
    // MARK: ====================================== Forgot Password Verify Otp On Phone Number Api Call =======================================
    func forgotPasswordVerifyOtpOnPhoneNumber(phoneNumber: String, otp: String, userType: String,callback: @escaping (ResponseType, String) -> ()) {
        
        let verifyOtpOnPhnoeNumber = ForgotPasswordVerifyOtpOnPhoneNumber(phoneNumber: phoneNumber, otp: otp, method: loginType.rawValue, userType: userType)
        
        VidhikBaseURL.shared.apollo.perform(mutation: verifyOtpOnPhnoeNumber) { [weak self] result in
            
            guard let self = self else { return }
            print(self)
            
            switch result {
                
            case .success(let responseData):
                
                guard let data = try? result.get().data else { return }
                print("data+++++++++++++\(data)")
                if let forgotPasswordVerifyOtpPhone = data.resultMap["forgotPasswordVerifyOtp"] as? [String: Any] {
                    if let status = forgotPasswordVerifyOtpPhone["status"] as? Int,
                       let message = forgotPasswordVerifyOtpPhone["message"] as? String {
                        
                        if status == 200 {
                            // OTP sent successfully
                            callback(.success, message)
                        } else {
                            callback(.failure, message)
                        }
                        print("Status: \(status)")
                        print("Message: \(message)")
                    }
                } else if let errors = responseData.errors {
                    callback(.failure, errors.description)
                    print("GraphQL errors:", errors)
                } else {
                    callback(.failure, responseData.errors?.description ?? "")
                    print("Unexpected response format")
                }
                
            case .failure(let error):
                callback(.failure, error.localizedDescription)
                
            }
        }
    }
    
    
    // MARK: ====================================== Forgot Password Verify Otp On Email Api Call ===========================================
    func forgotPasswordVerifyOtpOnEmail(email: String, otp: String, userType: String ,callback: @escaping (ResponseType, String) -> ()) {
        
        let verifyOtpOnEmail = ForgotPasswordVerifyOtpEmail(email: email, otp: otp, method: loginType.rawValue, userType: userType)
        
        VidhikBaseURL.shared.apollo.perform(mutation: verifyOtpOnEmail) { [weak self] result in
            guard let self = self else { return }
            print(self)
            
            switch result {
                
            case .success(let responseData):
                
                guard let data = try? result.get().data else { return }
                print("data+++++++++++++\(data)")
                if let forgotPasswordVerifyOtpEmail = data.resultMap["forgotPasswordVerifyOtp"] as? [String: Any] {
                    if let status = forgotPasswordVerifyOtpEmail["status"] as? Int,
                       let message = forgotPasswordVerifyOtpEmail["message"] as? String {
                        
                        if status == 200 {
                            // OTP sent successfully
                            callback(.success, message)
                        } else {
                            callback(.failure, message)
                        }
                        print("Status: \(status)")
                        print("Message: \(message)")
                    }
                } else if let errors = responseData.errors {
                    callback(.failure, errors.description)
                    print("GraphQL errors:", errors)
                } else {
                    callback(.failure, responseData.errors?.description ?? "")
                    print("Unexpected response format")
                }
                
            case .failure(let error):
                callback(.failure, error.localizedDescription)
                
            }
        }
    }
    
}
