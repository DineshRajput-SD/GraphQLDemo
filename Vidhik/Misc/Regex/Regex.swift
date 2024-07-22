//
//  Regex.swift
//  Vidhik
//
//  Created by Dinesh Rajput on 29/03/24.
//

import Foundation
import UIKit

// MARK: Regex Method
enum RegexType {
    case email
    case name
    case phone
    case fullName
    case password
    case userName
    case datePattern
    
    func getRegex() -> String {
        switch self {
        case .name:
            return "[a-z A-Z]{1,40}" // any characters maximum 40
        case .fullName:
            return "[a-z A-Z]{1,20}"
        case .userName:
            return "[A-Z0-9a-z._%+-](?=.*[a-z]).{1,20}"
        case .email:
            return "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"  //standard email validation
        case .phone:
            return "[\\d]{10}" //mobile number validation 10 digits
        case .password:
            return "(?=.*[A-Z])(?=.*[0-9])(?=.*[a-z])(?=.*[@#$%^&*]).{8,25}" //"[a-zA-z0-9!\"#$%&'()*+,-./:;<=>?@\\[\\]^_`{|}~]{6,1000}" //any character with infinite length
        case .datePattern:
            return "[0-9]{2}-[0-9]{2}-[0-9]{4}"
        }
    }
}

extension String {
    
    func isValid(type: RegexType) -> Bool {
        let regex = type.getRegex()
        let predicate  = NSPredicate(format: "SELF MATCHES %@", regex)
        return predicate.evaluate(with: self)
    }
    
    func validPhoneNumber(_ phoneNumber: String?) -> Bool {
      if Int(phoneNumber!) == nil {
        return false
      }
      return (phoneNumber!.count < 10 || phoneNumber!.count > 12)
    }
    
}
