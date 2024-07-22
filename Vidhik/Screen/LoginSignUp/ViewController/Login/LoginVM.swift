//
//  LoginVM.swift
//  Vidhik
//
//  Created by Dinesh Rajput on 01/04/24.
//

import Foundation


enum LoginType: String {
    case email = "email"
    case phoneMumber = "phoneMumber"
}

class LoginVM {
    
    var isLoginType: String?
    var loginType = LoginType.phoneMumber
    var loginUserData: UserData?
   
    // MARK: =============================================== Login TextField Validation Method ===============================================
    func isValidLoginTextField(email: String, password: String) -> Bool {
        switch loginType {
        case .email:
            guard !(email.isEmpty) else { return AlertView.show(title: alertTitle, message: "Please enter email") }
            guard email.isValid(type: .email) else { return AlertView.show(title: alertTitle, message: "Please enter valid email") }
            guard !(password.isEmpty) else { return AlertView.show(title: alertTitle, message: "Please enter password") }
            guard password.isValid(type: .password) else { return  AlertView.show(title: alertTitle, message: "Please enter valid password") }
            
        case .phoneMumber:
            guard !(email.isEmpty) else {
                if email.count < 10 { return AlertView.show(title: alertTitle, message:"The phone number must be 10 digits.") }
                return AlertView.show(title: alertTitle, message: "Please enter phone number")
            }
            
            guard email.isValid(type: .phone) else { return AlertView.show(title: alertTitle, message: "Please enter valid phone number") }
            if email.count < 10 { return AlertView.show(title: alertTitle, message: "The phone number must be 10 digits") }
            guard !(password.isEmpty) else { return AlertView.show(title: alertTitle, message: "Please enter password.") }
            guard password.isValid(type: .password) else { return AlertView.show(title: alertTitle, message: "Please enter valid password.") }
        }
        return true
    }
}

// MARK: =============================================== Login API Calling ===============================================

extension LoginVM {
    
    func loginPhoneNumberApi(phoneNumber: String, password: String, userType: String, callback: @escaping (ResponseType, String) -> ()) {
        
        let loginMutation = LoginByPhoneNumberMutation(phoneNumber: phoneNumber, password: password, userType: userType)
        
        VidhikBaseURL.shared.apollo.perform(mutation: loginMutation) { [weak self] result in
            guard let self = self else { return }
            print(self)
            
            switch result {
                
            case .success(let loginResponse):
                guard let data = try? result.get().data else { return }
                

                
                
                
//                guard let userData = parseUserDataFromResultMap(loginResponse.data?.resultMap as? [String: Any] ?? [:]) else { return }
//                print("Parsed user data: \(userData)")
//                UserKeychainManager.shared.saveFullname(name: userData.name)
//                UserKeychainManager.shared.savePrimaryNumber(number: userData.primaryPhoneNumber)
//                UserKeychainManager.shared.saveEmail(email: userData.email)
//                UserKeychainManager.shared.saveAddress(address: userData.address)
//                UserKeychainManager.shared.saveToken(accessToken: userData.accessToken)
//                UserKeychainManager.shared.saveUserType(user: userData.userType)
//                UserKeychainManager.shared.saveState(state: userData.state)
//                UserKeychainManager.shared.saveCity(city: userData.city)
//                
                print("data+++++++++++++\(data)")
                if let sendOtp = data.resultMap["login"] as? [String: Any] {
                    if let status = sendOtp["status"] as? Int,
                       let message = sendOtp["message"] as? String {
                        
                        if status == 200 || status == 201 {
                            // OTP sent successfully
                            
                    guard let userData = parseUserDataFromResultMap(loginResponse.data?.resultMap as? [String: Any] ?? [:]) else { return }
                            callback(.success, message)
                            
                            
                        } else {
                            callback(.failure, message)
                        }
                        print("Status: \(status)")
                        print("Message: \(message)")
                    }
                    
                } else if let errors = loginResponse.errors {
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
    
    func loginEmailIDApi(email: String, password: String, userType: String, callback: @escaping (ResponseType, String) -> ()) {
        
        let loginEmailMutation = LoginByEmailMutation(email: email, password: password, userType: userType)
        
        VidhikBaseURL.shared.apollo.perform(mutation: loginEmailMutation) { [weak self] result in
            guard let self = self else { return }
            print(self)
            
            switch result {
            case .success(let loginResponse):
                guard let data = try? result.get().data else { return }
//                let resultMap: [String: Any] = ["login": ["message": "login successfully", "data": ["city": "Arunachal Pradesh", "primaryPhoneNumber": "9074243636", "isPrimaryContactWhatsapp": true, "isSecondaryContactWhatsapp": false, "userType": "USER", "address": "US", "name": "kalvin", "secondaryPhoneNumber": "9090890989", "state": "Arunachal Pradesh", "email": "dinesh.rajput@numeroeins.com", "accessToken": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6ImRpbmVzaC5yYWpwdXRAbnVtZXJvZWlucy5jb20iLCJ1c2VyVHlwZSI6IlVTRVIiLCJpYXQiOjE3MTQ2NDM0OTgsImV4cCI6MTcxNDcyOTg5OH0.ze2PguOQWhQiExLiDk-AYQ9N3S84obOUAqD_72wX1IM"], "status": 200]]
                //
//                if let userData = parseData(resultMap) {
//                    // Use userData object here
//                    print(userData)
//                } else {
//                    print("Failed to parse data")
//                }
                
                guard let userData = parseUserDataFromResultMap(loginResponse.data?.resultMap as? [String: Any] ?? [:]) else { return }
                UserKeychainManager.shared.saveFullname(name: userData.name)
                UserKeychainManager.shared.savePrimaryNumber(number: userData.primaryPhoneNumber)
                UserKeychainManager.shared.saveEmail(email: userData.email)
                UserKeychainManager.shared.saveAddress(address: userData.address)
                UserKeychainManager.shared.saveToken(accessToken: userData.accessToken)
                UserKeychainManager.shared.saveUserType(user: userData.userType)
                UserKeychainManager.shared.saveState(state: userData.state)
                UserKeychainManager.shared.saveCity(city: userData.city)

                print("data+++++++++++++\(data)")
                if let sendOtp = data.resultMap["login"] as? [String: Any] {
                    if let status = sendOtp["status"] as? Int,
                       let message = sendOtp["message"] as? String {
                        
                        if status == 200 || status == 201 {
                            // OTP sent successfully
                            callback(.success, message)
                        } else {
                            callback(.failure, message)
                        }
                        print("Status: \(status)")
                        print("Message: \(message)")
                    }
                    
                } else if let errors = loginResponse.errors {
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
