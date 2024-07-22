//
//  SignUp.swift
//  Vidhik
//
//  Created by Dinesh Rajput on 01/04/24.
//

import Foundation

class SignUpVM {
    
    var signupPhoneNumber: String?
    
    // MARK: =============================================== Is Phone Number Validation Method ===============================================
    func isTextFieldValidation(phoneNumber: String) -> Bool {
        
        guard !(phoneNumber.isEmpty) else {
            if phoneNumber.count < 10 {
                return AlertView.show(title: alertTitle, message: "The phone number must be 10 digits.")
            }
            return AlertView.show(title: alertTitle, message: "Please enter phone number")
        }
        
        guard phoneNumber.isValid(type: .phone) else {
            return AlertView.show(title: alertTitle, message: "Please enter valid phone number")
        }
        if phoneNumber.count < 10 {
            return AlertView.show(title: alertTitle, message: "The phone number must be 10 digits")
        }
        
        return true
    }
    
    // MARK: =============================================== OTP Validation Methods ===============================================
    func otpNumberValidation(otpNumber: String) -> Bool {
        
        guard !(otpNumber.isEmpty) else {
            if otpNumber.count < 6 {
                return AlertView.show(title: alertTitle, message: "Otp number must be 6 digits.")
            }
            return AlertView.show(title: alertTitle, message: "Please enter valid otp")
        }
        
        if otpNumber.count < 6 {
            return AlertView.show(title: alertTitle, message: "Otp number must be 6 digits.")
        }
        return true
    }
    
}

// MARK: =============================================== Send OTP  Api Calling Extension ===============================================
extension SignUpVM {
    
    func sendOtpByPhoneNumber(phoneNumber: String, callback: @escaping(ResponseType, String) -> ()) {
        
        let sendOtpMutation =  SendOtpMutationPhone(method: "phone", phoneNumber: phoneNumber)
        
        VidhikBaseURL.shared.apollo.perform(mutation: sendOtpMutation) { [weak self] result in
            guard let self = self else { return }
            print(self)
            
            switch result {
                
            case .success(let responseData):
                
                guard let data = try? result.get().data else { return }
                print("data+++++++++++++\(data)")
                if let sendOtp = data.resultMap["sendOtp"] as? [String: Any] {
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
                    print("GraphQL errors:", errors)
                } else {
                    print("Unexpected response format")
                }
                
            case .failure(let error):
                callback(.failure, error.localizedDescription)
                print("Error occurred: \(error.localizedDescription)")
            }
        }
    }
    
    // MARK: =============================================== Verify OTP API ===============================================
    func verifyOtpByPhoneNumber(phoneNumber: String, otp: String, callback: @escaping (ResponseType, String) -> ()) {
        
        let query = VerifyOtpQueryPhone(method: "phone", phoneNumber: phoneNumber, otp: otp)/*VerifyOTPQuery(phoneNumber: phoneNumber, otp: otp)*/
        
        VidhikBaseURL.shared.apollo.fetch(query: query, cachePolicy: .default) { [weak self] result in
            guard let self = self else { return }
            print(self)
            
            switch result {
                
            case .success(let sendOTPResponse):
                
                guard let data = try? result.get().data else { return }
                print("data+++++++++++++\(data)")
                if let sendOtp = data.resultMap["verifyOtp"] as? [String: Any] {
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
                    
                } else if let errors = sendOTPResponse.errors {
                    print("GraphQL errors:", errors)
                } else {
                    print("Unexpected response format")
                }
                
            case .failure(let error):
                print(error.localizedDescription)
                callback(.failure, error.localizedDescription)
                
            }
        }
    }
    
}

