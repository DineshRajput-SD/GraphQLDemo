//
//  ApiConstant.swift
//  Vidhik
//
//  Created by Dinesh Rajput on 05/04/24.
//

import Foundation

enum ResponseType {
     case success, failure, noInternet, authenticationError, appUpdate
}

struct APIKeys {
    static let accessToken = "access-token"
    static let appVersion = "app-version"
    static let userLoggedIn = "UserLoggedIn"
    static let deviceType = "device_type"
    static let timezone = "timezone"
    
    struct Response {
      static let message = "message"
      static let success = "success"
      static let error = "error"
    }
}
