//
//  ForgotPasswordMutation.swift
//  Vidhik
//
//  Created by Dinesh Rajput on 22/04/24.
//

import Foundation
import Apollo

// MARK: - =============================================== Public Class Forgot Password by Phone number ===============================================
public final class ForgotPasswordByPhoneNumber: GraphQLMutation {
    // The raw GraphQL definition of this operation.
    public let operationName: String = "ForgotPassword"
    
    public let operationDefinition: String =
    
             """
             mutation ForgotPassword($method: String!, $phoneNumber: String!, $userType: String!) {
                   forgotPassword(input: { method: $method, phoneNumber: $phoneNumber, userType: $userType }){
                                         status
                                         message
                                     }
                                 }
             """
    
    public var phoneNumber: String
    public var method: String
    public var userType: String
    
    public init(phoneNumber: String, method: String, userType: String) {
        self.phoneNumber = phoneNumber
        self.method = method
        self.userType = userType
    }
    
    
    public var variables: GraphQLMap? {
        return ["phoneNumber": phoneNumber, "method": method, "userType": userType]
    }
    
    public struct Data: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Mutation"]
        
        public static var selections: [GraphQLSelection] {
            return [
                GraphQLField("forgotPassword",arguments: ["phoneNumber": GraphQLVariable("phoneNumber"), "method": GraphQLVariable("method"), "userType": GraphQLVariable("userType")], type: .object([GraphQLField("status", type: .scalar(Int.self)),GraphQLField("message", type: .scalar(String.self))]))
            ]
        }
        
        public private(set) var resultMap: ResultMap
        
        public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
        }
        
        public init(forgotPassword: String? = nil) {
            self.init(unsafeResultMap: ["forgotPassword": forgotPassword])
        }
        
        
        public var sendOtp: String? {
            get {
                return resultMap["forgotPassword"] as? String
            }
            set {
                resultMap.updateValue(newValue, forKey: "forgotPassword")
            }
        }
    }
}

// MARK: - =============================================== Public Class Forgot Password By Email Mutation ===============================================
public final class ForgotPasswordByEmail: GraphQLMutation {
    // The raw GraphQL definition of this operation.
    public let operationName: String = "ForgotPassword"
    
    public let operationDefinition: String =
    
             """
             mutation ForgotPassword($method: String!, $email: String!, $userType: String!) {
                   forgotPassword(input: { method: $method, email: $email,userType: $userType}){
                                         status
                                         message
                                     }
                                 }
             """
    
    public var email: String
    public var method: String
    public var userType: String
    
    public init(email: String, method: String, userType: String) {
        self.email = email
        self.method = method
        self.userType = userType
    }
    
    
    public var variables: GraphQLMap? {
        return ["email": email, "method": method, "userType": userType]
    }
    
    public struct Data: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Mutation"]
        
        public static var selections: [GraphQLSelection] {
            return [
                GraphQLField("forgotPassword",arguments: ["email": GraphQLVariable("email"), "method": GraphQLVariable("method"), "userType": GraphQLVariable("userType")], type: .object([GraphQLField("status", type: .scalar(Int.self)),GraphQLField("message", type: .scalar(String.self))]))
            ]
        }
        
        public private(set) var resultMap: ResultMap
        
        public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
        }
        
        public init(forgotPassword: String? = nil) {
            self.init(unsafeResultMap: ["forgotPassword": forgotPassword])
        }
        
        
        public var sendOtp: String? {
            get {
                return resultMap["forgotPassword"] as? String
            }
            set {
                resultMap.updateValue(newValue, forKey: "forgotPassword")
            }
        }
    }
}

//MARK: -  =============================================== Public Class Verify Otp Forgot Password through the Phone Number ===============================================
public final class ForgotPasswordVerifyOtpOnPhoneNumber: GraphQLMutation {
    // The raw GraphQL definition of this operation.
    public var operationName: String = "ForgotPasswordVerifyOtp"
    
    public let operationDefinition =
    """
                 mutation ForgotPasswordVerifyOtp($method: String!, $phoneNumber: String!, $otp: String!, $userType: String!) {
        forgotPasswordVerifyOtp(input: { method: $method, phoneNumber: $phoneNumber, otp: $otp, userType: $userType}){
                            status
                            message
                        }
    }
    """
    
    public var phoneNumber: String
    public var otp: String
    public var method: String
    public var userType: String
    
    public init(phoneNumber: String, otp: String, method: String, userType: String) {
        self.phoneNumber = phoneNumber
        self.otp = otp
        self.method = method
        self.userType = userType
    }
    
    public var variables: GraphQLMap? {
        return ["phoneNumber": phoneNumber, "otp": otp, "method": method, "userType": userType]
    }
    
    
    public struct Data: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Mutation"]
        
        public static var selections: [GraphQLSelection] {
            return [
                GraphQLField("forgotPasswordVerifyOtp", arguments: ["method": GraphQLVariable("method"), "phoneNumber": GraphQLVariable("phoneNumber"), "otp": GraphQLVariable("otp"), "userType": GraphQLVariable("userType")], type: .object([GraphQLField("status", type: .scalar(Int.self)),GraphQLField("message", type: .scalar(String.self))]))
            ]
        }
        
        public private(set) var resultMap: ResultMap
        
        public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
        }
        
        public init(forgotPasswordVerifyOtp: String? = nil) {
            self.init(unsafeResultMap: ["otp": forgotPasswordVerifyOtp])
        }
        
        public var phoneNumber: String? {
            get {
                return resultMap["phoneNumber"] as? String
            }
            set {
                resultMap.updateValue(newValue, forKey: "phoneNumber")
            }
        }
        
        public var forgotPasswordVerifyOtp: String? {
            get {
                return resultMap["forgotPasswordVerifyOtp"] as? String
            }
            set {
                resultMap.updateValue(newValue, forKey: "forgotPasswordVerifyOtp")
            }
        }
    }
}

//MARK: -  =============================================== Public Class Verify Otp Forgot Password through the Email ===============================================
public final class ForgotPasswordVerifyOtpEmail: GraphQLMutation {
    // The raw GraphQL definition of this operation.
    public var operationName: String = "ForgotPasswordVerifyOtp"
    
    public let operationDefinition =
    """
        mutation ForgotPasswordVerifyOtp($method: String!, $email: String!, $otp: String!,$userType: String!) {
        forgotPasswordVerifyOtp(input: { method: $method, email: $email, otp: $otp, "userType": $userType}){
                            status
                            message
                        }
    }
    """
    
    public var email: String
    public var otp: String
    public var method: String
    public var userType: String
    
    public init(email: String, otp: String, method: String, userType: String) {
        self.email = email
        self.otp = otp
        self.method = method
        self.userType = userType
    }
    
    public var variables: GraphQLMap? {
        return ["email": email, "otp": otp, "method": method, "userType": userType]
    }
    
    
    public struct Data: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Mutation"]
        
        public static var selections: [GraphQLSelection] {
            return [
                GraphQLField("forgotPasswordVerifyOtp", arguments: ["method": GraphQLVariable("method"), "email": GraphQLVariable("email"), "otp": GraphQLVariable("otp"), "userType": GraphQLVariable("userType")], type: .object([GraphQLField("status", type: .scalar(Int.self)),GraphQLField("message", type: .scalar(String.self))]))
            ]
        }
        
        public private(set) var resultMap: ResultMap
        
        public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
        }
        
        public init(otp: String? = nil) {
            self.init(unsafeResultMap: ["otp": otp])
        }
        
        public var email: String? {
            get {
                return resultMap["email"] as? String
            }
            set {
                resultMap.updateValue(newValue, forKey: "email")
            }
        }
        
        public var otp: String? {
            get {
                return resultMap["otp"] as? String
            }
            set {
                resultMap.updateValue(newValue, forKey: "otp")
            }
        }
    }
}


/*
 mutation {
 forgotPassword(input:{phoneNumber:"6261439001"})
 {
 status
 message
 
 }
 )// forgot password with phoneNumber
 
 
 mutation {
 forgotpassword(input:{email:"roshni.raikwar@numeroeins.com"})
 {
 status
 message
 
 }
 } // forgot password with email id
 
 
 mutation {
 forgotPasswordVerifyOtp(input:{phoneNumber:"6261439001",otp:"978247"})
 {
 status
 message
 
 }
 }
 
 
 mutation {
 forgotPasswordVerifyOtp(input:{email:"roshni.raikwar@numeroeins.com",otp:"978247"})
 {
 status
 message
 
 }
 }
 */
