//
//  CreateAccountModel.swift
//  Vidhik
//
//  Created by Dinesh Rajput on 16/04/24.
//

import Foundation

struct CreateAccountModel: Decodable {
    let data: CreateUser?
}

struct CreateUser: Decodable {
    let createUser: CreateUserData?
    var status: Int?
    var message: String?
}

struct CreateUserData: Decodable {
    var name: String?
    var primaryPhoneNumber: String?
    var isPrimaryContactWhatsapp: Bool?
    var secondaryPhoneNumber:String?
    var isSecondaryContactWhatsapp: Bool?
    var userType: String?
    var address: String?
    var city: String?
    var state: String?
    var email: String?
    var image: String?
}



/*
 
 {
   "data": {
     "createUser": {
       "status": 201,
       "message": "created successfully",
       "data": {
         "name": "John Doe",
         "primaryPhoneNumber": "6261439001",
         "secondaryPhoneNumber": "9876543210",
         "isPrimaryContactWhatsapp": false,
         "isSecondaryContactWhatsapp": true,
         "userType": "user",
         "address": "123 Example St",
         "city": "indore",
         "state": "indore",
         "email": "roshni.raikwar@numeroeins.com"
       }
     }
   }
 }

 */


struct CreateLawyerAccountModel: Decodable {
    let data: CreateLawyers?
}

struct CreateLawyers: Decodable {
    let createUser: CreateLawyersData?
    var status: Int?
    var message: String?
}

struct CreateLawyersData: Decodable {
    var userType: String?
    var lawyerName: String?
    var fatherName: String?
    var orgainization: String?
    var primaryContact: String?
    var isPrimaryContactWhatsapp: Bool?
    var isPrimaryMobileDisplay: Bool?
    var secondaryContact:String?
    var isSecondaryContactWhatsapp: Bool?
    var isSecondaryMobileDisplay: Bool?
    var city: String?
    var state: String?
    var email: String?
    var barLicenseNumber: String?
    var stateBar: String?
    var practiceYear: String?
    var coreCompetency: String?
    var practicingCourt: String?
    var practicingField: [String]?
    var isEmailDisplay: Bool?
    var barAddress: String?
    var isBarAddressDisplay: Bool?
    var id: String?
    
    enum CodingKeys: String, CodingKey {
        case id = "_id"
    }
    
    func parseLawyerDataFromResultMap(_ resultMap: [String: Any]) -> CreateLawyersData? {
        
        guard let createLawyerData = resultMap["createLawyers"] as? [String: Any],
              let message = createLawyerData["message"] as? String,
               message == "Lawyer Created Successfully",
              let lawyerData = createLawyerData["data"] as? [String:Any],
              let userType = lawyerData["userType"] as? String,
              let lawyerName = lawyerData["lawyerName"] as? String,
              let fatherName = lawyerData["fatherName"] as? String,
              let orgainization = lawyerData["orgainization"] as? String,
              let primaryContact = lawyerData["primaryContact"] as? String,
              let isPrimaryContactWhatsapp = lawyerData["isPrimaryContactWhatsapp"] as? Bool,
              let isPrimaryMobileDisplay = lawyerData["isPrimaryMobileDisplay"] as? Bool,
              let secondaryContact = lawyerData["secondaryContact"] as? String,
              let isSecondaryContactWhatsapp = lawyerData["isSecondaryContactWhatsapp"] as? Bool,
              let isSecondaryMobileDisplay = lawyerData["isSecondaryMobileDisplay"] as? Bool,
              let city = lawyerData["city"] as? String,
              let state = lawyerData["state"] as? String,
              let email = lawyerData["email"] as? String,
              let barLicenseNumber = lawyerData["barLicenseNumber"] as? String,
              let stateBar = lawyerData["stateBar"] as? String,
              let practiceYear = lawyerData["practiceYear"] as? String,
              let coreCompetency = lawyerData["coreCompetency"] as? String,
              let practicingCourt = lawyerData["practicingCourt"] as? String,
              let practicingField = lawyerData["practicingField"] as? [String],
              let isEmailDisplay = lawyerData["isEmailDisplay"] as? Bool,
              let barAddress = lawyerData["barAddress"] as? String,
              let isBarAddressDisplay = lawyerData["isBarAddressDisplay"] as? Bool,
              let id = lawyerData["_id"] as? String?
            else { return nil }
        
        let createLawyerDataObject = CreateLawyersData(userType: userType, lawyerName: lawyerName, fatherName: fatherName, orgainization: orgainization, primaryContact: primaryContact, isPrimaryContactWhatsapp: isPrimaryContactWhatsapp, isPrimaryMobileDisplay: isPrimaryMobileDisplay, secondaryContact: secondaryContact, isSecondaryContactWhatsapp: isSecondaryContactWhatsapp, isSecondaryMobileDisplay: isSecondaryMobileDisplay, city: city, state: state, email: email, barLicenseNumber: barLicenseNumber, stateBar: stateBar, practiceYear: practiceYear, coreCompetency: coreCompetency, practicingCourt: practicingCourt, practicingField: practicingField, isEmailDisplay: isEmailDisplay, barAddress: barAddress, isBarAddressDisplay: isBarAddressDisplay, id: id)
        
        return createLawyerDataObject
              
    }
    
}




/*
 {
   "data": {
     "createLawyers": {
       "status": 200,
       "message": "Lawyer Created Successfully",
       "data": {
         "lawyerName": "John Doe",
         "primaryContact": "8770329064",
         "state": "Indore",
         "userType": "LAWYER",
         "address": "123 Example St",
         "city": "Indore",
         "password": "$2b$10$x0Yw4HbWIkU8duk0GgE6RODR0yQu9id3MMKm/VTNpxdRdovvMKgDu",
         "email": "example122@mailinator.com",
         "stateBar": "Indiana",
         "practicingCourt": "Supreme Court",
         "practiceArea": "5",
         "practicingField": "Family Law",
         "fatherName": "Mark JOHN WICk",
         "coreCompetency": "Civil Law",
         "barAddress": "456 Lawyer St",
         "displayProfile": false,
         "LicenseNumber": "ABCD12345",
         "_id": "663ca2e668c9b50125ec443b"
       }
     }
   }
 }
 */
