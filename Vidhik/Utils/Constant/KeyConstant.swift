
//

import UIKit
import Foundation

let kAuthToken = "authToken"
let kUserName = "userName"
let kFullName = "fullName"
let kEmail = "email"
let kContact = "contact"
let kAlert = "Alert"
let kProfileImage = "profileImage"
let kAddress = "address"
let kDOB = "DOB"
let kPassword = "password"
let kGender = "gender"
let kLiveURL = "http://3.108.97.222:8000/api/user/"

 


let userDefaults =  UserDefaults.standard

extension UserDefaults {
    
    enum Keys {
       
        static let _id = "_id"
        static let name = "name"
        static let city = "city"
        static let primaryPhoneNumber = "primaryPhoneNumber"
        static let isPrimaryContactWhatsapp = "isPrimaryContactWhatsapp"
        static let isSecondaryContactWhatsapp = "isSecondaryContactWhatsapp"
        static let userType = "userType"
        static let address = "address"
        static let secondaryPhoneNumber = "secondaryPhoneNumber"
        static let state = "state"
        static let email = "email"
        static let accessToken = "accessToken"
        static let isAddressVisible = "isAddressVisible"
        static let isPrimaryContactVisible = "isPrimaryContactVisible"
        static let isSecondaryContactVisible = "isSecondaryContactVisible"
        static let fatherName = "fatherName"
        static let isEmailVisible = "isEmailVisible"
        static let stateBar = "stateBar"
        static let practicingCourt = "practicingCourt"
        static let practiceYear = "practiceYear"
        static let barLiscenceNo = "barLiscenceNo"
        static let coreCompetency = "coreCompetency"
        static let orgainization = "orgainization"
    
 
        
        
        

    }
}


 
class Record : NSObject {
    
    static var supportsSecureCoding: Bool {
        return true
    }
}
