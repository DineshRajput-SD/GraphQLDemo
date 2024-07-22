//
//  LoginModel.swift
//  Vidhik
//
//  Created by Dinesh Rajput on 16/04/24.
//

import Foundation

// Define your model object
struct UserData {
    let _id: String
    let name: String
    let city: String
    let primaryPhoneNumber: String
    let isPrimaryContactWhatsapp: Bool
    let isSecondaryContactWhatsapp: Bool
    let userType: String
    let address: String
    let secondaryPhoneNumber: String
    let state: String
    let email: String
    let accessToken: String
    let isAddressVisible: Bool
    let isPrimaryContactVisible: Bool
    let isSecondaryContactVisible: Bool
    let fatherName: String
    let isEmailVisible: Bool
    let stateBar: String
    let practicingCourt: String
    let practiceYear: String
    let barLiscenceNo: String
    let coreCompetency: String
    let orgainization: String
    
    
    //Save Data In UserDefaults
    
    
    init(_id: String, name: String, city: String, primaryPhoneNumber: String, isPrimaryContactWhatsapp: Bool, isSecondaryContactWhatsapp: Bool, userType: String, address: String, secondaryPhoneNumber: String, state: String, email: String, accessToken: String, isAddressVisible: Bool, isPrimaryContactVisible: Bool, isSecondaryContactVisible: Bool, fatherName: String, isEmailVisible: Bool, stateBar: String, practicingCourt: String, practiceYear: String, barLiscenceNo: String, coreCompetency: String, orgainization: String) {
        self._id = _id
        self.name = name
        self.city = city
        self.primaryPhoneNumber = primaryPhoneNumber
        self.isPrimaryContactWhatsapp = isPrimaryContactWhatsapp
        self.isSecondaryContactWhatsapp = isSecondaryContactWhatsapp
        self.userType = userType
        self.address = address
        self.secondaryPhoneNumber = secondaryPhoneNumber
        self.state = state
        self.email = email
        self.accessToken = accessToken
        self.isAddressVisible = isAddressVisible
        self.isPrimaryContactVisible = isPrimaryContactVisible
        self.isSecondaryContactVisible = isSecondaryContactVisible
        self.fatherName = fatherName
        self.isEmailVisible = isEmailVisible
        self.stateBar = stateBar
        self.practicingCourt = practicingCourt
        self.practiceYear = practiceYear
        self.barLiscenceNo = barLiscenceNo
        self.coreCompetency = coreCompetency
        self.orgainization = orgainization
        
        
        
        UserDefaults.standard.set(self._id, forKey: UserDefaults.Keys._id)
        UserDefaults.standard.set(self.name, forKey: UserDefaults.Keys.name)
        UserDefaults.standard.set(self.city, forKey: UserDefaults.Keys.city)
        UserDefaults.standard.set(self.primaryPhoneNumber, forKey: UserDefaults.Keys.primaryPhoneNumber)
        UserDefaults.standard.set(self.isPrimaryContactWhatsapp, forKey: UserDefaults.Keys.isPrimaryContactWhatsapp)
        UserDefaults.standard.set(self.isSecondaryContactWhatsapp, forKey: UserDefaults.Keys.isSecondaryContactWhatsapp)
        UserDefaults.standard.set(self.userType, forKey: UserDefaults.Keys.userType)
        UserDefaults.standard.set(self.address, forKey: UserDefaults.Keys.address)
        UserDefaults.standard.set(self.secondaryPhoneNumber, forKey: UserDefaults.Keys.secondaryPhoneNumber)
        UserDefaults.standard.set(self.state, forKey: UserDefaults.Keys.state)
        UserDefaults.standard.set(self.email, forKey: UserDefaults.Keys.email)
        UserDefaults.standard.set(self.accessToken, forKey: UserDefaults.Keys.accessToken)
        UserDefaults.standard.set(self.isAddressVisible, forKey: UserDefaults.Keys.isAddressVisible)
        UserDefaults.standard.set(self.isPrimaryContactVisible, forKey: UserDefaults.Keys.isPrimaryContactVisible)
        UserDefaults.standard.set(self.isSecondaryContactVisible, forKey: UserDefaults.Keys.isSecondaryContactVisible)
        UserDefaults.standard.set(self.fatherName, forKey: UserDefaults.Keys.fatherName)
        UserDefaults.standard.set(self.isEmailVisible, forKey: UserDefaults.Keys.isEmailVisible)
        UserDefaults.standard.set(self.stateBar, forKey: UserDefaults.Keys.stateBar)
        UserDefaults.standard.set(self.practicingCourt, forKey: UserDefaults.Keys.practicingCourt)
        UserDefaults.standard.set(self.practiceYear, forKey: UserDefaults.Keys.practiceYear)
        UserDefaults.standard.set(self.barLiscenceNo, forKey: UserDefaults.Keys.barLiscenceNo)
        UserDefaults.standard.set(self.coreCompetency, forKey: UserDefaults.Keys.coreCompetency)
        UserDefaults.standard.set(self.orgainization, forKey: UserDefaults.Keys.orgainization)
      
        
        
        
        
        
        
        
    }
    
    
    
    
}

// Function to fetch and parse data
func parseUserDataFromResultMap(_ resultMap: [String: Any]) -> UserData? {
    guard let loginData = resultMap["login"] as? [String: Any],
          let message = loginData["message"] as? String,
          message == "Login successfully",
          let userData = loginData["data"] as? [String: Any],
          let id = userData["_id"] as? String,
          let name = userData["name"] as? String,
          let primaryPhoneNumber = userData["primaryPhoneNumber"] as? String,
          let isPrimaryContactWhatsapp = userData["isPrimaryContactWhatsapp"] as? Bool,
          let isSecondaryContactWhatsapp = userData["isSecondaryContactWhatsapp"] as? Bool,
          let userType = userData["userType"] as? String,
          let address = userData["address"] as? String,
          let city = userData["city"] as? String,
          let secondaryPhoneNumber = userData["secondaryPhoneNumber"] as? String,
          let state = userData["state"] as? String,
          let email = userData["email"] as? String,
          let accessToken = userData["accessToken"] as? String,
            let isAddressVisible = userData["isAddressVisible"] as? Bool,
          let isPrimaryContactVisible = userData["isPrimaryContactVisible"] as? Bool,
          let isSecondaryContactVisible = userData["isSecondaryContactVisible"] as? Bool,
          let fatherName = userData["fatherName"] as? String,
          let isEmailVisible = userData["isEmailVisible"] as? Bool,
          let stateBar = userData["stateBar"] as? String,
          let practicingCourt = userData["practicingCourt"] as? String,
          let practiceYear = userData["practiceYear"] as? String,
          let barLiscenceNo = userData["barLiscenceNo"] as? String,
          let coreCompetency = userData["coreCompetency"] as? String,
          let orgainization = userData["orgainization"] as? String else {
              return nil
          }
    
    let userDataObject = UserData(_id: id, name: name, city: city, primaryPhoneNumber: primaryPhoneNumber, isPrimaryContactWhatsapp: isPrimaryContactWhatsapp, isSecondaryContactWhatsapp: isSecondaryContactWhatsapp, userType: userType, address: address, secondaryPhoneNumber: secondaryPhoneNumber, state: state, email: email, accessToken: accessToken, isAddressVisible: isAddressVisible, isPrimaryContactVisible: isPrimaryContactVisible, isSecondaryContactVisible: isSecondaryContactVisible, fatherName: fatherName, isEmailVisible: isEmailVisible, stateBar: stateBar, practicingCourt: practicingCourt, practiceYear: practiceYear, barLiscenceNo: barLiscenceNo, coreCompetency: coreCompetency, orgainization: orgainization)
    return userDataObject
}


//data+++++++++++++Data(resultMap: ["login": Optional(["data": Optional(["isPrimaryContactWhatsapp": Optional(true), "name": Optional("Kushal Mali"), "secondaryPhoneNumber": Optional("9990909090"), "state": Optional("Madhya Pradesh"), "address": Optional("Vijay nagar"), "city": Optional("Madhya Pradesh"), "accessToken": Optional("eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6Imt1c2hhbC5tYWxpQG51bWVyb2VpbnMuY29tIiwidXNlclR5cGUiOiJVU0VSIiwiaWF0IjoxNzE0NjQ4ODQ4LCJleHAiOjE3MTQ3MzUyNDh9.9Zh9gnHlfJAfIZxQoyK3jqDJup0TgCFGCFyK2AFyJjM"), "isSecondaryContactWhatsapp": Optional(false), "userType": Optional("USER"), "email": Optional("kushal.mali@numeroeins.com"), "primaryPhoneNumber": Optional("9893899305")]), "message": Optional("Login successfully"), "status": Optional(200)])])

