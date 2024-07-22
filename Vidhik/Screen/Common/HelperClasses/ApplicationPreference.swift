//
//  ApplicationPreference.swift
//  Vidhik
//
//  Created by Dinesh Rajput on 18/03/24.
//

import Foundation
let userType = UserSelectionType.lawyer
var userData: UserData?

class ApplicationPreference {
    
    
    fileprivate static let defaults = UserDefaults.standard
    
    class func savecheckUserType(saveStatus: String){
        defaults.set(saveStatus, forKey: UserDefaultcheckUserType.rawValue)
        UserDefaults.standard.synchronize()
    }
    
    class func getcheckUserType()->String?{
        let RememberMeStatus : String?
        RememberMeStatus = defaults.object(forKey: userType.rawValue) as? String
        return RememberMeStatus ?? nil
    }
    
    class func saveIsLoggedInUser(isLoggedIn: Bool) {
        defaults.set(isLoggedIn, forKey: "isLoggedIn")
        //defaults.synchronize()
    }
    
    class func retriveIsLoggedInUser(isLoggedIn: String) -> Bool {
        if let isUserLoggedIn = defaults.value(forKey: isLoggedIn) {
            return true
        } else {
            return false
        }
    }
    
    class func clean() {
        UserDefaults.standard.set(false, forKey: "isLoggedIn")
        UserDefaults.standard.removeObject(forKey: "isLoggedIn")
        print("USER DEFAULT IS LOGGED IN KEY ******,", UserDefaults.standard.bool(forKey: APIKeys.userLoggedIn))
    }
    
}
// APP Constant
let UserDefaultcheckUserType = userType
//let USERTYPE = "User"



