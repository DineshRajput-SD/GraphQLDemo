//
//  SignupVM.swift
//  Vidhik
//
//  Created by Dinesh Rajput on 29/03/24.
//

import Foundation
import UIKit
import Apollo

class CreateAccountVM {
    
    var userType = UserSelectionType.lawyer
    var signupPhoneNumber: String?
    var profileImage: UIImage?
    
    var isPrimaryContactWhatsapp: Bool? = false
    var isSecondaryContactWhatsapp: Bool? = false
    var isemaildisplay: Bool? = false
    var isprimaryMobiledisplay: Bool? = false
    var issecondaryMobiledisplay: Bool? = false
    var isbaraddressdisplay: Bool? = false
    var createLawyerData: CreateLawyersData?
    
    var arrData = ["Andhra Pradesh","Arunachal Pradesh","Assam", "Bihar", "Chhattisgarh", "Goa", "Gujarat", "Haryana", "Himachal Pradesh", "Jharkhand", "Karnataka", "Kerala", "Madhya Pradesh", "Maharashtra", "Manipur"]
    
    var arrPracticeField = ["Family Law","Health Law","Immigration Law", "International Law", "Military Law", "Education Law", "Criminal Law", "Corporate Law", "Constitutional Law", "Civil Rights Law", "Real Estate Law", "Entertainment Law"]
    
    var arrQueData = ["What is your last name", "What is your pet name", "what is your favroit food", "What is your favourite place", "What is your favourite movie?", "What is your memorable date?", "What is your favourite cricket team?", "What is the make and model of your first car?"]
    
    
    //MARK: =============================================== Validate textfields to check if its not empty ===============================================
    
    func isTextFieldsValidLawyer(fatherName: String, competency: String, nameOfStateBar: String, nameOfPracticingCourt: String, yearOfPractice: String, barLicenseNo: String, practicingField: String) -> Bool {
        
        guard !(fatherName.isEmpty) else {
            return AlertView.show(title: alertTitle, message: "Please enter father name")
        }
        
        guard fatherName.isValid(type: .name) else {
            return AlertView.show(title: alertTitle, message: "Please enter valid father name")
        }
        
        guard !(competency.isEmpty) else {
            return AlertView.show(title: alertTitle, message: "Please enter core competency")
        }
        
        guard !(nameOfStateBar.isEmpty) else {
            return AlertView.show(title: alertTitle, message: "Please enter name of state bar")
        }
        
        guard !(nameOfPracticingCourt.isEmpty) else {
            return AlertView.show(title: alertTitle, message: "Please enter name of Practicing Court")
        }
        
        guard !(yearOfPractice.isEmpty) else {
            return AlertView.show(title: alertTitle, message: "Please enter year of Practice")
        }
        
        guard !(barLicenseNo.isEmpty) else {
            return AlertView.show(title: alertTitle, message: "Please enter bar licence Number")
        }
        
        //        guard !(practicingField.isEmpty) else {
        //            return AlertView.show(title: alertTitle, message: "Please enter practice field")
        //        }
        
        return true
    }
    
    // MARK: =============================================== Common validation Method User And Lawyer ===============================================
    func commonValidationUserAndLawyer(fullName: String, address: String, state: String, city: String, phoneNumber: String, email: String, password: String, confirmPassword: String) -> Bool {
        
        guard !fullName.isEmpty else {
            return AlertView.show(title: alertTitle, message: "Please enter fullname")
        }
        
        guard fullName.isValid(type: .fullName) else {
            return AlertView.show(title: alertTitle, message: "Please enter valid fullname")
        }
        
        guard !address.isEmpty else {
            return AlertView.show(title: alertTitle, message: "Please enter address")
        }
        
        guard !state.isEmpty else {
            return AlertView.show(title: alertTitle, message: "Please select state")
        }
        
        guard !city.isEmpty  else {
            return AlertView.show(title: alertTitle, message: "Please select city")
        }
        
        guard !phoneNumber.isEmpty else {
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
        
        guard !email.isEmpty else {
            return AlertView.show(title: alertTitle, message: "Please enter email")
        }
        
        guard email.isValid(type: .email) else {
            return AlertView.show(title: alertTitle, message: "Please enter vaild email")
        }
        
        guard !password.isEmpty else {
            return AlertView.show(title: alertTitle, message: "Please enter password")
        }
        
        guard password.isValid(type: .password) else {
            return AlertView.show(title: alertTitle, message: "Please enter vaild password")
        }
        
        guard !confirmPassword.isEmpty else {
            return AlertView.show(title: alertTitle, message: "Please enter confirm password")
        }
        
        guard password == confirmPassword else {
            return AlertView.show(title: alertTitle, message: "Please enter password and confirm password dose not match.")
        }
        return true
    }
    
    //MARK: =============================================== Validation for Judge ===============================================
    
    func validationForJudge(currentState: String, currentDistrict: String, courtType: String, courtName: String, registrationNo: String) -> Bool {
        
        guard !currentState.isEmpty else{
            return AlertView.show(title: alertTitle, message: "Please select current state")
        }
        
        guard !currentDistrict.isEmpty else{
            return AlertView.show(title: alertTitle, message: "Please select current district")
        }
        
        guard !courtType.isEmpty else{
            return AlertView.show(title: alertTitle, message: "Please enter court type")
        }
        
        guard !courtName.isEmpty else{
            return AlertView.show(title: alertTitle, message: "Please enter court name")
        }
        
        guard !registrationNo.isEmpty else{
            return AlertView.show(title: alertTitle, message: "Please enter registration number")
        }
        return true
    }
    
}

// MARK: - API Calling Extension
extension CreateAccountVM {
    
    // MARK: =============================================== Send Otp On Email Api Call Method ===============================================
    func sendOtoOnEmailMutation(email: String, callback: @escaping(ResponseType, String) -> ()) {
        
        let sendOtpPhoneNumberWithEmail = EmailVerifyIsFirstTime(method: "email", phoneNumber: signupPhoneNumber ?? "", email: email)
        
        VidhikBaseURL.shared.apollo.perform(mutation: sendOtpPhoneNumberWithEmail) { [weak self] result in
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
    
    // MARK: ================================== EmailVerifyOTP API Calling Method ====================================
    func emailVerifyOtpQuery(email: String, otp: String, callback: @escaping (ResponseType, String) -> ()) {
        
        let emailVerifyQuery = EmailVerifyAccountCreationQuery(method: "", email: email, otp: otp)
        print("emailVerifyQuery::::::::::\(emailVerifyQuery)")
        
        VidhikBaseURL.shared.apollo.fetch(query: emailVerifyQuery) { [weak self] result in
            guard let self = self else { return }
            print(self)
            
            switch result {
            case .success(let responseData):
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
                } else if let errors = responseData.errors {
                    print("GraphQL errors:", errors)
                } else {
                    print("Unexpected response format")
                }
                
            case .failure(let error):
                print("Error occurred: \(error.localizedDescription)")
                callback(.failure, error.localizedDescription)
            }
        }
    }
    
    // MARK: - Resend Otp On Email API Calling Method
    func reSendOtpOnEmail(email: String, callback: @escaping(ResponseType, String) -> Void) {
        
        let reSendOtpEmailMutation = SendOtpMutationEmail(method: "email", email: email)
        
        VidhikBaseURL.shared.apollo.perform(mutation: reSendOtpEmailMutation) { [weak self] result in
            
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
                print("Error occurred: \(error.localizedDescription)")
                callback(.failure, error.localizedDescription)
            }
        }
    }
    
    // MARK: =============================================== User Account Creation API Calling Method ===============================================
    func userAccountCreation(name: String, phoneNumber: String, isPrimaryContactWhatsapp: Bool,
                             secondaryContact: String, isSecondaryContactWhatsapp: Bool,
                             address: String, city: String, state: String,
                             email: String,  password: String, confirmPassword: String,
                             callback: @escaping(ResponseType, String) -> ()) {
        
        let userAccountCreationMutation = UserAccountCreationMutation(userType: "USER", name: name, phoneNumber: phoneNumber,
                                                                      isPrimaryContactWhatsapp: isPrimaryContactWhatsapp,
                                                                      secondaryContact: secondaryContact, isSecondaryContactWhatsapp: isSecondaryContactWhatsapp, address: address,
                                                                      city: city, state: state, email: email,
                                                                      password: password, confirmPassword: confirmPassword)
        
        VidhikBaseURL.shared.apollo.perform(mutation: userAccountCreationMutation)  { [weak self] result in
            guard let self = self else { return }
            print(self)
            
            switch result {
            case .success(let responseData):
                guard let data = try? result.get().data else { return }
                print("data+++++++++++++\(data)")
                if let createUser = data.resultMap["createUser"] as? [String: Any] {
                    guard let status = createUser["status"] as? Int else { return }
                    guard let message = createUser["message"] as? String else { return }
                    
                    if status == 200 || status == 201 {
                        guard let userData = createUser["data"] as? [String: Any] else { return }
                        guard let userType = userData["userType"] as? String else { return }
                        print("User Type:================", userType)
                        // OTP sent successfully
                        callback(.success, message)
                    } else {
                        callback(.failure, message)
                    }
                } else if let errors = responseData.errors {
                    print("GraphQL errors:", errors)
                    
                } else {
                    print("Error: Unable to fetch create user data")
                }
            case .failure(let error):
                print("Error occurred: \(error.localizedDescription)")
                callback(.failure, error.localizedDescription)
            }
        }
    }
}


// MARK: =============================================== Uploading Api Calling ===============================================
extension CreateAccountVM {
    
    func accountCretaionAPICalling(name: String, phoneNumber: String, isPrimaryContactWhatsapp: Bool, secondaryContact: String, isSecondaryContactWhatsapp: Bool, address: String, city: String, state: String, email: String,  password: String, confirmPassword: String, image: UIImage, callback: @escaping(ResponseType, String) -> ()) {
    
        
//        guard let imageData = image.jpegData(compressionQuality: 0.5) else {
//            print("Failed to convert image to data")
//            return
//        }
//
//        let file = GraphQLFile(
//            fieldName: "file",
//            originalName: "image.jpg",
//            mimeType: "image/jpeg",
//            data: imageData
//        )
        if let imageData = image.jpegData(compressionQuality: 0.7) {
            
            let uploadFile = GraphQLFile(fieldName: "file", originalName: "image.jpg", mimeType: "image/jpeg", data: imageData)
           
        let userAccountCreationMutation = AccountCreationWithImageMutation(file: "\(image)", userType: userType.rawValue.uppercased(), name: name, phoneNumber: phoneNumber, isPrimaryContactWhatsapp: isPrimaryContactWhatsapp, secondaryContact: secondaryContact, isSecondaryContactWhatsapp: isSecondaryContactWhatsapp, address: address, city: city, state: state, email: email, password: password, confirmPassword: confirmPassword)
            
            VidhikBaseURL.shared.apollo.upload(operation: userAccountCreationMutation, files: [uploadFile]){ [weak self] result in
                guard let self = self else { return }
                print(self)
                
                switch result {
                case .success(let responseData):
                    guard let data = try? result.get().data else { return }
                    callback(.success, "Success")
                    print(responseData)
                    print(data)
                    
                case .failure(let error):
                    print(error.localizedDescription)
                    callback(.failure, "Failure")
                }
            }
          }
        }
    }

// MARK: ================================= Lawyer Account Creation API Calling Method =======================================
extension CreateAccountVM {
    func lawyerAccountCreation(lawyerName: String, fatherName: String,orgainization: String ,primaryContact: String,
                               isPrimaryContactWhatsapp: Bool,isPrimaryMobileDisplay: Bool ,secondaryContact: String, isSecondaryContactWhatsapp: Bool,isSecondaryMobileDisplay: Bool,
                                city: String, state: String, email: String, password: String, confirmPassword: String,
                               barLicenseNumber: String, stateBar: String, practiceYear: String, coreCompetency: String,
                               practicingCourt: String, practicingField: [String], isEmailDisplay: Bool, barAddress: String, isBarAddressDisplay: Bool,
                               callback: @escaping(ResponseType, String) -> ()) {
        
        let lawyerAccount = LawyerAccountCreate(userType: userType.rawValue.uppercased(), lawyerName: lawyerName, fatherName: fatherName, orgainization: orgainization,
                                                primaryContact: primaryContact, isPrimaryContactWhatsapp: isPrimaryContactWhatsapp,isPrimaryMobileDisplay: isPrimaryMobileDisplay ,secondaryContact: secondaryContact, isSecondaryContactWhatsapp: isSecondaryContactWhatsapp, isSecondaryMobileDisplay: isSecondaryMobileDisplay, city: city, state: state, email: email, password: password, confirmPassword: confirmPassword, barLicenseNumber: barLicenseNumber, stateBar: stateBar, practiceYear: practiceYear, coreCompetency: coreCompetency, practicingCourt: practicingCourt, practicingField: practicingField, isEmailDisplay: isEmailDisplay, barAddress: barAddress, isBarAddressDisplay: isBarAddressDisplay)
        
        VidhikBaseURL.shared.apollo.perform(mutation: lawyerAccount)  { [weak self] result in
            guard let self = self else { return }
            print(self)
            
            switch result {
            case .success(let responseData):
                guard let data = try? result.get().data else { return }
                let getUserDataResponse = responseData.data?.resultMap as? [String: Any]
                print("User UserData:================", getUserDataResponse)
//                                guard let lawyerData = createLawyerData?.parseLawyerDataFromResultMap(responseData.data?.resultMap as? [String: Any] ?? [:]) else { return }
//                                UserKeychainManager.shared.saveFullname(name: lawyerData.lawyerName ?? "")
//                                UserKeychainManager.shared.saveFatherName(name: lawyerData.fatherName ?? "")
//                                UserKeychainManager.shared.savePrimaryNumber(number: lawyerData.primaryContact ?? "")
//                                UserKeychainManager.shared.saveUserType(user: lawyerData.userType ?? "")
//                                UserKeychainManager.shared.saveAddress(address: lawyerData.barAddress ?? "")
//                                UserKeychainManager.shared.saveCity(city: lawyerData.city ?? "")
//                                UserKeychainManager.shared.saveState(state: lawyerData.state ?? "")
//                                UserKeychainManager.shared.saveEmail(email: lawyerData.email ?? "")
//                                UserKeychainManager.shared.saveStateBar(stateBar: lawyerData.stateBar ?? "")
//                                UserKeychainManager.shared.savePracticingCourt(court: lawyerData.practicingCourt ?? "")
//                                UserKeychainManager.shared.saveYearOfPractice(year: lawyerData.practiceYear ?? "")
                            //    UserKeychainManager.shared.savePracticingField(feild: lawyerData.practicingField ?? "")
                              //  UserKeychainManager.shared.saveCoreCompetency(text: lawyerData.coreCompetency ?? "")
//                                 isDisplay is missing in keychain
//                                 license number is missing in keychain

                print("data+++++++++++++\(data)")
                if let createUser = data.resultMap["createLawyers"] as? [String: Any] {
                    guard let status = createUser["status"] as? Int else { return }
                    guard let message = createUser["message"] as? String else { return }
                    
                    if status == 200 || status == 201 {
                        guard let userData = createUser["data"] as? [String: Any] else { return }
                        guard let userType = userData["userType"] as? String else { return }
                        print("User UserData:================", userData)
                        print("User Type:================", userType)
                        // OTP sent successfully
                        callback(.success, message)
                    } else {
                        callback(.failure, message)
                    }
                } else if let errors = responseData.errors {
                    print("GraphQL errors:", errors)
                    
                } else {
                    print("Error: Unable to fetch create user data")
                }
            case .failure(let error):
                print("Error occurred: \(error.localizedDescription)")
                callback(.failure, error.localizedDescription)
            }
        }
    }
}



/*GraphQLResult<Data>(data: Optional(Vidhik.LawyerAccountCreate.Data(resultMap: ["createLawyers": Optional(["message": Optional("Lawyer Created Successfully"), "status": Optional(200), "data": Optional(["userType": Optional("LAWYER")])])])), errors: nil, extensions: nil, source: Apollo.GraphQLResult<Vidhik.LawyerAccountCreate.Data>.Source.server, dependentKeys:
 
 
 Optional(Set(["MUTATION_ROOT.createLawyers(
 address:Indore,
 barAddress:barAddress,
 barlicenseNumber:LW-3636,
 city:Andhra Pradesh,
 confirmPassword:Test@123,
 coreCompetency:Lorem ipsum dolor sit er elit lamet,
 ,displayProfile:false,
 email:lawyer@mailinator.com,
 fatherName:Apple,
 isPrimaryContactWhatsapp:false,
 isSecondaryContactWhatsapp:false,
 lawyerName:Lawyer Test,
 password:Test@123,
 practiceYear:6,
 practicingCourt:Indore HC,
 practicingField:6,
 primaryContact:9074243636,
 secondaryContact:8898989898,
 state:Andhra Pradesh,
 stateBar:Apple Testing Lawyer,
 userType:LAWYER)
 .message", "MUTATION_ROOT.createLawyers(address:Indore,barAddress:barAddress,barlicenseNumber:LW-3636,city:Andhra Pradesh,confirmPassword:Test@123,coreCompetency:Lorem ipsum dolor sit er elit lamet, ,displayProfile:false,email:lawyer@mailinator.com,fatherName:Apple,isPrimaryContactWhatsapp:false,isSecondaryContactWhatsapp:false,lawyerName:Lawyer Test,password:Test@123,practiceYear:6,practicingCourt:Indore HC,practicingField:6,primaryContact:9074243636,secondaryContact:8898989898,state:Andhra Pradesh,stateBar:Apple Testing Lawyer,userType:LAWYER).data.userType", "MUTATION_ROOT.createLawyers(address:Indore,barAddress:barAddress,barlicenseNumber:LW-3636,city:Andhra Pradesh,confirmPassword:Test@123,coreCompetency:Lorem ipsum dolor sit er elit lamet, ,displayProfile:false,email:lawyer@mailinator.com,fatherName:Apple,isPrimaryContactWhatsapp:false,isSecondaryContactWhatsapp:false,lawyerName:Lawyer Test,password:Test@123,practiceYear:6,practicingCourt:Indore HC,practicingField:6,primaryContact:9074243636,secondaryContact:8898989898,state:Andhra Pradesh,stateBar:Apple Testing Lawyer,userType:LAWYER)
 .status", "MUTATION_ROOT.createLawyers(address:Indore,barAddress:barAddress,barlicenseNumber:LW-3636,city:Andhra Pradesh,confirmPassword:Test@123,coreCompetency:Lorem ipsum dolor sit er elit lamet, ,displayProfile:false,email:lawyer@mailinator.com,fatherName:Apple,isPrimaryContactWhatsapp:false,isSecondaryContactWhatsapp:false,lawyerName:Lawyer Test,password:Test@123,practiceYear:6,practicingCourt:Indore HC,practicingField:6,primaryContact:9074243636,secondaryContact:8898989898,state:Andhra Pradesh,stateBar:Apple Testing Lawyer,userType:LAWYER)
 .data", "MUTATION_ROOT.createLawyers(address:Indore,
 barAddress:barAddress,
 barlicenseNumber:LW-3636,
 city:Andhra Pradesh,
 confirmPassword:Test@123,
 coreCompetency:Lorem ipsum dolor sit er elit lamet, ,displayProfile:false,
 email:lawyer@mailinator.com,
 fatherName:Apple,
 isPrimaryContactWhatsapp:false,
 isSecondaryContactWhatsapp:false,
 lawyerName:Lawyer Test,
 password:Test@123,
 practiceYear:6,
 practicingCourt:Indore HC,
 practicingField:6,
 primaryContact:9074243636,
 secondaryContact:8898989898,
 state:Andhra Pradesh,
 stateBar:Apple Testing Lawyer,
 userType:LAWYER)"])))
*/
