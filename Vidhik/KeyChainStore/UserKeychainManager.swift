//
//  KeyChainStore.swift
//  Vidhik
//
//  Created by Dinesh Rajput on 23/04/24.
//

import Foundation
import UIKit
import KeychainSwift

class UserKeychainManager {
    static let shared = UserKeychainManager()
     let keychain = KeychainSwift()
    
    private init() { }
    
    
    //MARK: Save and Get State
     func saveToken(accessToken: String) {
        keychain.set(accessToken, forKey: Keys.accessToken)
    }
    
   func getToken() -> String? {
        return keychain.get(Keys.accessToken)
    }
    
    
    //MARK: Save and Get  Profile Image
    func saveProfileImage(image: String) {
        keychain.set(image, forKey: Keys.profileImage)
    }
    
    func getProfileImage() -> String? {
        return keychain.get(Keys.profileImage)
    }
    
    //MARK: Save and Get  UserType
    func saveUserType(user: String) {
        keychain.set(user, forKey: Keys.userType)
    }
    
    func getUserType() -> String? {
        return keychain.get(Keys.userType)
    }
    
    //MARK: Save and Get Organization Name
    func saveOrganizatioName(name: String) {
        keychain.set(name, forKey: Keys.nameOfOrganization)
    }
    
    func getOrganizatioName() -> String? {
        return keychain.get(Keys.nameOfOrganization)
    }
    
  //MARK: Save and Get FullName
    func saveFullname(name: String) {
        keychain.set(name, forKey: Keys.fullName)
    }
    
    func getFullname() -> String? {
        return keychain.get(Keys.fullName)
    }
    
    
    
    //MARK: Save and Get Father Name
    func saveFatherName(name: String) {
        keychain.set(name, forKey: Keys.fatherName)
    }
    
    func getFatherName() -> String? {
        return keychain.get(Keys.fatherName)
    }
    
    //MARK: Save and Get Core Competency
    func saveCoreCompetency(text: String) {
        keychain.set(text, forKey: Keys.coreCompetency)
    }
    
    func getCoreCompetency() -> String? {
        return keychain.get(Keys.coreCompetency)
    }
    
    //MARK: Save and Get Email
    func saveEmail(email: String) {
        keychain.set(email, forKey: Keys.email)
    }
    
    func getEmail() -> String? {
        return keychain.get(Keys.email)
    }
    
    //MARK: Save and Get Password
    func savePassword(password: String) {
        keychain.set(password, forKey: Keys.password)
    }
    
    func getPassword() -> String? {
        return keychain.get(Keys.password)
    }
    
    //MARK: Save and Get ConfirmPassword
    func saveCofirmPassword(password: String) {
        keychain.set(password, forKey: Keys.confirmPassword)
    }
    
    func getConfirmPassword() -> String? {
        return keychain.get(Keys.confirmPassword)
    }
    
    //MARK: Save and Get Address
    func saveAddress(address: String) {
        keychain.set(address, forKey: Keys.address)
    }
    
    func getAddress() -> String? {
        return keychain.get(Keys.address)
    }
    
    //MARK: Save and Get State
    func saveState(state: String) {
        keychain.set(state, forKey: Keys.state)
    }
    
    func getState() -> String? {
        return keychain.get(Keys.state)
    }
    
    //MARK: Save and Get City
    func saveCity(city: String) {
        keychain.set(city, forKey: Keys.city)
    }
    
    func getCity() -> String? {
        return keychain.get(Keys.city)
    }
    
    //MARK: Save and Get Primary Phone Number
    func savePrimaryNumber(number: String) {
        keychain.set(number, forKey: Keys.primaryPhoneNumber)
    }
    
    func getPrimaryNumber() -> String? {
        return keychain.get(Keys.primaryPhoneNumber)
    }
    
    //MARK: Save and Get Secondary Phone Number
    func saveSecondaryNumber(number: String) {
        keychain.set(number, forKey: Keys.secondaryPhoneNumber)
    }
    
    func getSecondaryNumber() -> String? {
        return keychain.get(Keys.secondaryPhoneNumber)
    }
    
    //MARK: Save and Get StateBar
    func saveStateBar(stateBar: String) {
        keychain.set(stateBar, forKey: Keys.stateBar)
    }
    
    func getStateBar() -> String? {
        return keychain.get(Keys.stateBar)
    }
    
    //MARK: Save and Get Practicing Court
    func savePracticingCourt(court: String) {
        keychain.set(court, forKey: Keys.practicingCourt)
    }
    
    func getPracticingCourt() -> String? {
        return keychain.get(Keys.practicingCourt)
    }
    
    //MARK: Save and Get Year Of Practice
    func saveYearOfPractice(year: String) {
        keychain.set(year, forKey: Keys.yearOfPractice)
    }
    
    func getYearOfPractice() -> String? {
        return keychain.get(Keys.yearOfPractice)
    }
    
    //MARK: Save and Get PracticingField
    func savePracticingField(feild: String) {
        keychain.set(feild, forKey: Keys.practicingField)
    }
    
    func getPracticingField() -> String? {
        return keychain.get(Keys.practicingField)
    }
    
    //MARK: Save and Get Security Question One
    func saveSecurityQuestionOne(que: String) {
        keychain.set(que, forKey: Keys.securityQuestionOne)
    }
    
    func getSecurityQuestionOne() -> String? {
        return keychain.get(Keys.securityQuestionOne)
    }
    
    //MARK: Save and Get Security Answer One
    func saveSecurityAnswerOne(ans: String) {
        keychain.set(ans, forKey: Keys.securityAnswerOne)
    }
    
    func getSecurityAnswerOne() -> String? {
        return keychain.get(Keys.securityAnswerOne)
    }
    
    //MARK: Save and Get Security Question Two
    func saveSecurityQuestionTwo(que: String) {
        keychain.set(que, forKey: Keys.securityQuestionTwo)
    }
    
    func getSecurityQuestionTwo() -> String? {
        return keychain.get(Keys.securityQuestionTwo)
    }
    
    //MARK: Save and Get Security Answer Two
    func saveSecurityAnswerTwo(ans: String) {
        keychain.set(ans, forKey: Keys.securityAnswerTwo)
    }
    
    func getSecurityAnswerTwo() -> String? {
        return keychain.get(Keys.securityAnswerTwo)
    }
    
    //MARK: Save and Get Current State
    func saveCurrentState(state: String) {
        keychain.set(state, forKey: Keys.currentState)
    }
    
    func getCurrentState() -> String? {
        return keychain.get(Keys.currentState)
    }
    
    //MARK: Save and Get Current City
    func saveCurrentCity(city: String) {
        keychain.set(city, forKey: Keys.currentCity)
    }
    
    func getCurrentCity() -> String? {
        return keychain.get(Keys.currentCity)
    }
    
    //MARK: Save and Get Court Type
    func saveCourtType(type: String) {
        keychain.set(type, forKey: Keys.courtType)
    }
    
    func getCourtType() -> String? {
        return keychain.get(Keys.courtType)
    }
    
    //MARK: Save and Get Court Name
    func saveCourtName(name: String) {
        keychain.set(name, forKey: Keys.courtName)
    }
    
    func getCourtName() -> String? {
        return keychain.get(Keys.courtName)
    }
    
    //MARK: Save and Get Registration No.
    func saveRegistrationNo(no: String) {
        keychain.set(no, forKey: Keys.registrationNo)
    }
    
    func getRegistrationNo() -> String? {
        return keychain.get(Keys.registrationNo)
    }
    
    // MARK: ========== Clean LoggedIn User Data ==============
    func cleanUserData() {
        keychain.accessGroup?.removeAll()
        print("keychain.accessGroup:::::::\(String(describing: keychain.accessGroup?.removeAll()))")
    }
    
  //MARK: -------------------------------------------------------------------------------------------
   
    var profileImage: String? {
        get {
            return keychain.get(Keys.profileImage)
        }
        set {
            if let newValue = newValue {
                keychain.set(newValue, forKey: (Keys.profileImage))
            } else {
                print("Something")
                // keychain.delete("userName")
            }
        }
    }
    
    var userType: String? {
        get {
            return keychain.get(Keys.userType)
        }
        set {
            if let newValue = newValue {
                keychain.set(newValue, forKey: (Keys.userType))
            } else {
                print("Something")
                // keychain.delete("userName")
            }
        }
    }
    
    var nameOfOrganization: String? {
        get {
            return keychain.get(Keys.nameOfOrganization)
        }
        set {
            if let newValue = newValue {
                keychain.set(newValue, forKey: (Keys.nameOfOrganization))
            } else {
                print("Something")
                // keychain.delete("userName")
            }
        }
    }
    
    var fullName: String? {
        get {
            return keychain.get(Keys.fullName)
        }
        set {
            if let newValue = newValue {
                keychain.set(newValue, forKey: (Keys.fullName))
            } else {
                print("Something")
                // keychain.delete("userName")
            }
        }
    }
    
    var fatherName: String? {
        get {
            return keychain.get(Keys.fatherName)
        }
        set {
            if let newValue = newValue {
                keychain.set(newValue, forKey: (Keys.fatherName))
            } else {
                print("Something")
                // keychain.delete("userName")
            }
        }
    }
    
    var coreCompetency: String? {
        get {
            return keychain.get(Keys.coreCompetency)
        }
        set {
            if let newValue = newValue {
                keychain.set(newValue, forKey: (Keys.coreCompetency))
            } else {
                print("Something")
                // keychain.delete("userName")
            }
        }
    }
    
    var email: String? {
        get {
            return keychain.get(Keys.email)
        }
        set {
            if let newValue = newValue {
                keychain.set(newValue, forKey: (Keys.email))
            } else {
                print("Something")
                // keychain.delete("userName")
            }
        }
    }
    
    var password: String? {
        get {
            return keychain.get(Keys.password)
        }
        set {
            if let newValue = newValue {
                keychain.set(newValue, forKey: (Keys.password))
            } else {
                print("Something")
                // keychain.delete("userName")
            }
        }
    }
    
    var confirmPassword: String? {
        get {
            return keychain.get(Keys.confirmPassword)
        }
        set {
            if let newValue = newValue {
                keychain.set(newValue, forKey: (Keys.confirmPassword))
            } else {
                print("Something")
                // keychain.delete("userName")
            }
        }
    }
    
    var address: String? {
        get {
            return keychain.get(Keys.address)
        }
        set {
            if let newValue = newValue {
                keychain.set(newValue, forKey: (Keys.address))
            } else {
                print("Something")
                // keychain.delete("userName")
            }
        }
    }
    
    var state: String? {
        get {
            return keychain.get(Keys.state)
        }
        set {
            if let newValue = newValue {
                keychain.set(newValue, forKey: (Keys.state))
            } else {
                print("Something")
                // keychain.delete("userName")
            }
        }
    }
    
    var city: String? {
        get {
            return keychain.get(Keys.city)
        }
        set {
            if let newValue = newValue {
                keychain.set(newValue, forKey: (Keys.city))
            } else {
                print("Something")
                // keychain.delete("userName")
            }
        }
    }
    
    var primaryPhoneNumber: String? {
        get {
            return keychain.get(Keys.primaryPhoneNumber)
        }
        set {
            if let newValue = newValue {
                keychain.set(newValue, forKey: (Keys.primaryPhoneNumber))
            } else {
                print("Something")
                // keychain.delete("userName")
            }
        }
    }
    
    var secondaryPhoneNumber: String? {
        get {
            return keychain.get(Keys.secondaryPhoneNumber)
        }
        set {
            if let newValue = newValue {
                keychain.set(newValue, forKey: (Keys.secondaryPhoneNumber))
            } else {
                print("Something")
                // keychain.delete("userName")
            }
        }
    }
    
    var stateBar: String? {
        get {
            return keychain.get(Keys.stateBar)
        }
        set {
            if let newValue = newValue {
                keychain.set(newValue, forKey: (Keys.stateBar))
            } else {
                print("Something")
                // keychain.delete("userName")
            }
        }
    }
    
    var practicingCourt: String? {
        get {
            return keychain.get(Keys.practicingCourt)
        }
        set {
            if let newValue = newValue {
                keychain.set(newValue, forKey: (Keys.practicingCourt))
            } else {
                print("Something")
                // keychain.delete("userName")
            }
        }
    }
    
    var yearOfPractice: String? {
        get {
            return keychain.get(Keys.yearOfPractice)
        }
        set {
            if let newValue = newValue {
                keychain.set(newValue, forKey: (Keys.yearOfPractice))
            } else {
                print("Something")
                // keychain.delete("userName")
            }
        }
    }
    
    var barLicenseNo: String? {
        get {
            return keychain.get(Keys.barLicenseNo)
        }
        set {
            if let newValue = newValue {
                keychain.set(newValue, forKey: (Keys.barLicenseNo))
            } else {
                print("Something")
                // keychain.delete("userName")
            }
        }
    }
    
    var practicingField: String? {
        get {
            return keychain.get(Keys.practicingField)
        }
        set {
            if let newValue = newValue {
                keychain.set(newValue, forKey: (Keys.practicingField))
            } else {
                print("Something")
                // keychain.delete("userName")
            }
        }
    }
    
    var securityQuestionOne: String? {
        get {
            return keychain.get(Keys.securityQuestionOne)
        }
        set {
            if let newValue = newValue {
                keychain.set(newValue, forKey: (Keys.securityQuestionOne))
            } else {
                print("Something")
                // keychain.delete("userName")
            }
        }
    }
    
    var securityAnswerOne: String? {
        get {
            return keychain.get(Keys.securityAnswerOne)
        }
        set {
            if let newValue = newValue {
                keychain.set(newValue, forKey: (Keys.securityAnswerOne))
            } else {
                print("Something")
                // keychain.delete("userName")
            }
        }
    }
    
    var securityQuestionTwo: String? {
        get {
            return keychain.get(Keys.securityQuestionTwo)
        }
        set {
            if let newValue = newValue {
                keychain.set(newValue, forKey: (Keys.securityQuestionTwo))
            } else {
                print("Something")
                // keychain.delete("userName")
            }
        }
    }
    
    var securityAnswerTwo: String? {
        get {
            return keychain.get(Keys.securityAnswerTwo)
        }
        set {
            if let newValue = newValue {
                keychain.set(newValue, forKey: (Keys.securityAnswerTwo))
            } else {
                print("Something")
                // keychain.delete("userName")
            }
        }
    }
    
    var currentState: String? {
        get {
            return keychain.get(Keys.currentState)
        }
        set {
            if let newValue = newValue {
                keychain.set(newValue, forKey: (Keys.currentState))
            } else {
                print("Something")
                // keychain.delete("userName")
            }
        }
    }
    
    var currentCity: String? {
        get {
            return keychain.get(Keys.currentCity)
        }
        set {
            if let newValue = newValue {
                keychain.set(newValue, forKey: (Keys.currentCity))
            } else {
                print("Something")
                // keychain.delete("userName")
            }
        }
    }
    
    
    var courtType: String? {
        get {
            return keychain.get(Keys.courtType)
        }
        set {
            if let newValue = newValue {
                keychain.set(newValue, forKey: (Keys.courtType))
            } else {
                print("Something")
                // keychain.delete("userName")
            }
        }
    }
    
    var courtName: String? {
        get {
            return keychain.get(Keys.courtName)
        }
        set {
            if let newValue = newValue {
                keychain.set(newValue, forKey: (Keys.courtName))
            } else {
                print("Something")
                // keychain.delete("userName")
            }
        }
    }
    
    var registrationNo: String? {
        get {
            return keychain.get(Keys.registrationNo)
        }
        set {
            if let newValue = newValue {
                keychain.set(newValue, forKey: (Keys.registrationNo))
            } else {
                print("Something")
                // keychain.delete("userName")
            }
        }
    }
    
    
    

}

struct Keys {
    static let accessToken = "accessToken"
    static let profileImage = "profileImage"
    static let userType = "userType"
    static let nameOfOrganization = "nameOfOrganization"
    static let fullName = "fullName"
    static let fatherName = "fatherName"
    static let coreCompetency = "coreCompetency"
    static let email = "email"
    static let isEmailDisplay = "EmailDisplay"
    static let password = "password"
    static let confirmPassword = "confirmPassword"
    static let address = "address"
    static let state = "state"
    static let city = "city"
    static let primaryPhoneNumber = "primaryPhoneNumber"
    static let isPrimaryNumberDisplay = "PrimaryNumberDisplay"
    static let isPrimaryWhatsAppNo = "PrimaryWhatsAppNo"
    static let secondaryPhoneNumber = "secondaryPhoneNumber"
    static let isSecondaryNumberDisplay = "SecondaryNumberDisplay"
    static let isSecondaryWhatsAppNo = "SecondaryWhatsAppNo"
    static let stateBar = "stateBar"
    static let practicingCourt = "practicigCourt"
    static let yearOfPractice = "yearOfPractice"
    static let barLicenseNo = "barLicense"
    static let practicingField = "practicingField"
    static let securityQuestionOne = "securityQuestionOne"
    static let securityAnswerOne = "securityAnswerOne"
    static let securityQuestionTwo = "securityQuestionTwo"
    static let securityAnswerTwo = "securityAnswerTwo"
    
    static let currentState = "currentState"
    static let currentCity = "currentCity"
    static let courtType = "courtType"
    static let courtName = "courtName"
    static let registrationNo = "registrationNo"
}







struct User {
    let accessToken: String?
    let profileImage: String?
    let userType: String?
    let nameOfOrganization: String?
    let fullName: String
    let fatherName: String?
    let email: String
    let isEmailDisplay: Bool?
    let password: String
    let confirmPassword: String
    let address: String?
    let state: String?
    let city: String?
    let primaryPhoneNumber: String?
    let isPrimaryNumberDisplay: Bool?
    let isPrimaryContactWhatsapp: Bool?
    let comptency: String?
    let secondryPhoneNumber: String?
    let isSecondaryNumberDisplay: Bool?
    let isSecondaryContactWhatsapp: Bool?
    let nameOfStateBar: String?
    let nameOfPracticeCourt: String?
    let yearOfPractice: String?
    let barLicenseNo: String?
    let practicingField: String?
    let securityQuestionOne: String?
    let securityAnswerOne: String?
    let securityQuestionTwo: String?
    let securityAnswerTwo: String?

    // Other user information
    let currentState: String?
    let currentCity: String?
    let courtType: String?
    let courtName: String?
    let registrationNo: String?
}

