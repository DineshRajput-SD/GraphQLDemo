//
//  SendOtpMutation.swift
//  Vidhik
//
//  Created by Dinesh Rajput on 09/04/24.
//

import Foundation
import Apollo


// MARK: =============================================== Public Class SendOtp through PhoneNumber ===============================================
public final class SendOtpMutationPhone: GraphQLMutation {
    // The raw GraphQL definition of this operation.
    public let operationName: String = "SendOtp"
    
    public let operationDefinition: String =
             """
             mutation SendOtp($method: String!, $phoneNumber: String!) {
             sendOtp(input: { method: $method, phoneNumber: $phoneNumber }){
                                         status
                                         message
                                     }
                                 }
             """
    
    public var phoneNumber: String
    public var method: String
    
    public init(method: String, phoneNumber: String) {
        self.method = method
        self.phoneNumber = phoneNumber
    }
    
    
    public var variables: GraphQLMap? {
        return ["method": method, "phoneNumber": phoneNumber]
    }
    
    public struct Data: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Mutation"]
        
        public static var selections: [GraphQLSelection] {
            return [
                GraphQLField("sendOtp",arguments: ["method": GraphQLVariable("method"), "phoneNumber": GraphQLVariable("phoneNumber")], type: .object([GraphQLField("status", type: .scalar(Int.self)),GraphQLField("message", type: .scalar(String.self))]))
            ]
        }
        
        public private(set) var resultMap: ResultMap
        
        public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
        }
        
        public init(sendOtp: String? = nil) {
            self.init(unsafeResultMap: ["sendOtp": sendOtp])
        }
        
        
        public var sendOtp: String? {
            get {
                return resultMap["sendOtp"] as? String
            }
            set {
                resultMap.updateValue(newValue, forKey: "sendOtp")
            }
        }
    }
}

// MARK: =============================================== Public Class Send Otp Through E-Mail ===============================================
public final class SendOtpMutationEmail: GraphQLMutation {
    // The raw GraphQL definition of this operation.
    public let operationName: String = "SendOtp"
    
    public let operationDefinition: String =
             """
             mutation SendOtp($method: String!, $email: String!) {
             sendOtp(input: { method: $method, email: $email }){
                                         status
                                         message
                                     }
                                 }
             """
    
    public var email: String
    public var method: String
    
    public init(method: String, email: String) {
        self.method = method
        self.email = email
    }
    
    
    public var variables: GraphQLMap? {
        return ["method": method, "email": email]
    }
    
    public struct Data: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Mutation"]
        
        public static var selections: [GraphQLSelection] {
            return [
                GraphQLField("sendOtp",arguments: ["method": GraphQLVariable("method"), "email": GraphQLVariable("email")], type: .object([GraphQLField("status", type: .scalar(Int.self)),GraphQLField("message", type: .scalar(String.self))]))
            ]
        }
        
        public private(set) var resultMap: ResultMap
        
        public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
        }
        
        public init(sendOtp: String? = nil) {
            self.init(unsafeResultMap: ["sendOtp": sendOtp])
        }
        
        public var sendOtp: String? {
            get {
                return resultMap["sendOtp"] as? String
            }
            set {
                resultMap.updateValue(newValue, forKey: "sendOtp")
            }
        }
    }
}

// MARK: =============================================== Public Class Verify Otp through the PhoneNumber ===============================================
public final class VerifyOtpQueryPhone: GraphQLQuery {
    // The raw GraphQL definition of this operation.
    public var operationName: String = "verifyOtp"
    
    public let operationDefinition =
    """
    query verifyOtp($method: String!, $phoneNumber: String!, $otp: String!) {
        verifyOtp(input: { method: $method, phoneNumber: $phoneNumber, otp: $otp}){
                            status
                            message
                        }
    }
    """
    
    public var phoneNumber: String
    public var otp: String
    public var method: String
    
    public init(method: String, phoneNumber: String, otp: String) {
        self.method = method
        self.phoneNumber = phoneNumber
        self.otp = otp
    }
    
    public var variables: GraphQLMap? {
        return ["method": method, "phoneNumber": phoneNumber, "otp": otp]
    }
    
    public struct Data: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Query"]
        
        public static var selections: [GraphQLSelection] {
            return [
                GraphQLField("verifyOtp", arguments: ["method": GraphQLVariable("method") ,"phoneNumber": GraphQLVariable("phoneNumber"), "otp": GraphQLVariable("otp")], type: .object([GraphQLField("status", type: .scalar(Int.self)),GraphQLField("message", type: .scalar(String.self))]))
            ]
        }
        
        public private(set) var resultMap: ResultMap
        
        public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
        }
        
        public init(verifyOtp: String? = nil) {
            self.init(unsafeResultMap: ["otp": verifyOtp])
        }
        
        public var phoneNumber: String? {
            get {
                return resultMap["phoneNumber"] as? String
            }
            set {
                resultMap.updateValue(newValue, forKey: "phoneNumber")
            }
        }
        
        public var verifyOtp: String? {
            get {
                return resultMap["verifyOtp"] as? String
            }
            set {
                resultMap.updateValue(newValue, forKey: "verifyOtp")
            }
        }
    }
}



//mutation {
//  sendOtp(input: { method: "phone", phoneNumber: "8770329066" }) {
//    status
//    message
//  }
//}


//    mutation {
//      sendOtp(input: { method: "email", email: "example@example.com" }) {
//        status
//        message
//      }
//    }
