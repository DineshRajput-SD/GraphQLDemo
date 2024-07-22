//
//  ResetPasswordApi.swift
//  Vidhik
//
//  Created by Dinesh Rajput on 22/04/24.
//

import Foundation
import Apollo

// MARK: - =============================================== Public Class Reset Password by Phone number ===============================================
public final class ResetPasswordByPhoneNumber: GraphQLMutation {
    // The raw GraphQL definition of this operation.
    public let operationName: String = "ResetPassword"
    
    public let operationDefinition: String =
             """
             mutation ResetPassword($phoneNumber: String!, $password: String!, $confirmPassword: String!, $userType: String!) {
                       resetPassword(input: { phoneNumber: $phoneNumber, password: $password, confirmPassword: $confirmPassword, userType: $userType}){
                                         status
                                         message
                                     }
                                 }
             """
    
    public var phoneNumber: String
    public var password: String
    public var confirmPassword: String
    public var userType: String
    
    public init(phoneNumber: String, password: String, confirmPassword: String, userType: String) {
        self.phoneNumber = phoneNumber
        self.password = password
        self.confirmPassword = confirmPassword
        self.userType = userType
    }
    
    
    public var variables: GraphQLMap? {
        return ["phoneNumber": phoneNumber, "password": password, "confirmPassword": confirmPassword, "userType": userType]
    }
    
    public struct Data: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Mutation"]
        
        public static var selections: [GraphQLSelection] {
            return [
                GraphQLField("resetPassword",arguments: ["phoneNumber": GraphQLVariable("phoneNumber"), "password": GraphQLVariable("password"), "confirmPassword": GraphQLVariable("confirmPassword"), "userType": GraphQLVariable("userType")], type: .object([GraphQLField("status", type: .scalar(Int.self)),GraphQLField("message", type: .scalar(String.self))]))
            ]
        }
        
        public private(set) var resultMap: ResultMap
        
        public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
        }
        
        public init(resetPassword: String? = nil) {
            self.init(unsafeResultMap: ["resetPassword": resetPassword])
        }
        
        
        public var resetPassword: String? {
            get {
                return resultMap["resetPassword"] as? String
            }
            set {
                resultMap.updateValue(newValue, forKey: "resetPassword")
            }
        }
    }
}

// MARK: - ================================ Public Class Reset Password by Email-ID   ===============================================
public final class ResetPasswordByEmail: GraphQLMutation {
    // The raw GraphQL definition of this operation.
    public let operationName: String = "ResetPassword"
    
    public let operationDefinition: String =
             """
             mutation ResetPassword($email: String!, $password: String!, $confirmPassword: String!, $userType: String!) {
                       resetPassword(input: { email: $email, password: $password, confirmPassword: $confirmPassword, userType: $userType}){
                                         status
                                         message
                                     }
                                 }
             """
    
    public var email: String
    public var password: String
    public var confirmPassword: String
    public var userType: String
    
    public init(email: String, password: String, confirmPassword: String, userType: String) {
        self.email = email
        self.password = password
        self.confirmPassword = confirmPassword
        self.userType = userType
    }
    
    
    public var variables: GraphQLMap? {
        return ["email": email, "password": password, "confirmPassword": confirmPassword, "userType": userType]
    }
    
    public struct Data: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Mutation"]
        
        public static var selections: [GraphQLSelection] {
            return [
                GraphQLField("resetPassword",arguments: ["email": GraphQLVariable("email"), "password": GraphQLVariable("password"), "confirmPassword": GraphQLVariable("confirmPassword"), "userType": GraphQLVariable("userType")], type: .object([GraphQLField("status", type: .scalar(Int.self)),GraphQLField("message", type: .scalar(String.self))]))
            ]
        }
        
        public private(set) var resultMap: ResultMap
        
        public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
        }
        
        public init(resetPassword: String? = nil) {
            self.init(unsafeResultMap: ["resetPassword": resetPassword])
        }
        
        
        public var resetPassword: String? {
            get {
                return resultMap["resetPassword"] as? String
            }
            set {
                resultMap.updateValue(newValue, forKey: "resetPassword")
            }
        }
    }
}

/*
 mutation {
 resetpassword(input:{email:"roshni.raikwar@numeroeins.com",password:"123",confirmPassword:"123"})
 {
 status
 message
 }
 }
 
 mutation {
 resetPassword(input:{phoneNumber:"6261439001",password:"123",confirmPassword:"123"})
 {
 status
 message
 
 }
 }*/


/*final class SendOtpQuery: GraphQLQuery {
 // Define your GraphQL query string
 let query: String = """
 query SendOtp {
 sendOtp {
 message
 status
 }
 }
 """
 
 // Initialize the query with any necessary variables
 init() {}
 
 // Define the response type
 typealias Data = SendOtpData
 
 // Define the data structure to parse the response
 struct SendOtpData: GraphQLSelectionSet {
 let message: String
 let status: Int
 
 init(map: GraphQLMap) throws {
 message = try map.value(for: "sendOtp.message")
 status = try map.value(for: "sendOtp.status")
 }
 
 static let selections: [GraphQLSelection] = [
 Field("sendOtp", type: .nonNull(.object(SendOtp.selections)))
 ]
 
 private enum SendOtp: GraphQLField {
 case message, status
 
 static let selections: [GraphQLSelection] = [
 Field("message"),
 Field("status")
 ]
 }
 }
 }
 */
