//
//  Authorization.swift
//  Vidhik
//
//  Created by Dinesh Rajput on 18/03/24.
//

import Foundation

let USERTYPE = "Lawyer"

class Authorization {

  static let shared: Authorization = {
    var instance = Authorization()
  // instance.keychain = Keychain(service: Bundle.main.bundleIdentifier!)
    return instance
  }()

}
