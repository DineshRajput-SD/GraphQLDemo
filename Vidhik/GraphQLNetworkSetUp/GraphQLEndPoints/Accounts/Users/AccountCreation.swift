//
//  UserAccountCreation.swift
//  Vidhik
//
//  Created by Dinesh Rajput on 18/04/24.
//

import Foundation
import Apollo

enum OptionalScalar<T>: JSONDecodable {
    case value(T)
    case null

    public init(jsonValue value: JSONValue) throws {
        if let val = value as? T {
            self = .value(val)
        } else {
            self = .null
        }
    }
}


// MARK: =============================================== Public Class AccountCreation AllUsers ===============================================
public final class UserAccountCreationMutation: GraphQLMutation {
    // The raw GraphQL definition of this operation.
    public let operationDefinition: String =
             """
             mutation createUser($userType: String!, $name: String!, $phoneNumber: String!, $isPrimaryContactWhatsapp: Boolean!, $secondaryContact: String!, $isSecondaryContactWhatsapp: Boolean!, $address: String!, $city: String!, $state: String!, $email: String!, $password: String!, $confirmPassword: String!) {
             createUser(input: { userType: $userType, name: $name, phoneNumber: $phoneNumber,  isPrimaryContactWhatsapp: $isPrimaryContactWhatsapp, secondaryContact:  $secondaryContact, isSecondaryContactWhatsapp: $isSecondaryContactWhatsapp, address: $address, city: $city, state: $state, email: $email, password: $password, confirmPassword: $confirmPassword}){
             status
             message
             data
                                     }
                                 }
             """
    
    
    public let operationName: String = "createUser"
    
    public var userType: String
    public var name: String
    public var phoneNumber: String
    public var isPrimaryContactWhatsapp: Bool?
    public var secondaryContact: String?
    public var isSecondaryContactWhatsapp: Bool?
    public var address: String
    public var city: String
    public var state: String
    public var email: String
    public var password: String
    public var confirmPassword: String
    
    public init(userType: String, name: String, phoneNumber: String, isPrimaryContactWhatsapp: Bool, secondaryContact: String?, isSecondaryContactWhatsapp: Bool?, address: String, city: String,  state: String, email: String, password: String, confirmPassword: String) {
        self.userType = userType
        self.name = name
        self.phoneNumber = phoneNumber
        self.isPrimaryContactWhatsapp = isPrimaryContactWhatsapp
        self.secondaryContact = secondaryContact
        self.isSecondaryContactWhatsapp =  isSecondaryContactWhatsapp
        self.address = address
        self.city = city
        self.state = state
        self.email = email
        self.password = password
        self.confirmPassword = confirmPassword
    }
    
    
    public var variables: GraphQLMap? {
        return ["userType": userType, "name": name, "phoneNumber": phoneNumber, "isPrimaryContactWhatsapp": isPrimaryContactWhatsapp, "secondaryContact": secondaryContact, "isSecondaryContactWhatsapp": isSecondaryContactWhatsapp, "address": address, "city": city, "state": state, "email": email, "password": password, "confirmPassword": confirmPassword]
    }
    
    public struct Data: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Mutation"]
        
        public static var selections: [GraphQLSelection] {
                    return [
                        GraphQLField("createUser",arguments: ["userType": GraphQLVariable("userType"),
                                                              "name": GraphQLVariable("name"),
                                                              "phoneNumber": GraphQLVariable("phoneNumber"),
                                                              "isPrimaryContactWhatsapp": GraphQLVariable("isPrimaryContactWhatsapp"),
                                                              "secondaryContact": GraphQLVariable("secondaryContact"),
                                                              "isSecondaryContactWhatsapp": GraphQLVariable("isSecondaryContactWhatsapp"),
                                                              "address": GraphQLVariable("address"),
                                                              "city": GraphQLVariable("city"),
                                                              "state": GraphQLVariable("state"),
                                                              "email": GraphQLVariable("email"),
                                                              "password": GraphQLVariable("password"),
                                                              "confirmPassword": GraphQLVariable("confirmPassword")],
                                     type: .object([GraphQLField("status", type: .scalar(Int.self)),GraphQLField("message", type: .scalar(String.self)), GraphQLField("data", type: .object([GraphQLField("userType", type: .scalar(String.self))]))]))
                    ]
                }
        
        public private(set) var resultMap: ResultMap
        
        public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
        }
        
        public init(createUser: String? = nil) {
            self.init(unsafeResultMap: ["createUser": createUser])
        }
        
        public var createUser: String? {
            get {
                return resultMap["createUser"] as? String
            }
            set {
                resultMap.updateValue(newValue, forKey: "createUser")
            }
        }
    }
}


// MARK: =============================================== Is First Time Verify Email-ID On Account Creataion ===============================================
public final class EmailVerifyIsFirstTime: GraphQLMutation {
    // The raw GraphQL definition of this operation.
    public let operationName: String = "SendOtp"
    
    public let operationDefinition: String =
             """
             mutation SendOtp($method: String!, $phoneNumber: String!, $email: String!) {
             sendOtp(input: {method: $method, phoneNumber: $phoneNumber, email: $email }){
                                         status
                                         message
                                     }
                                 }
             """
    
    public var method: String
    public var email: String
    public var phoneNumber: String
    
    public init(method: String, phoneNumber: String, email: String) {
        self.method = method
        self.phoneNumber = phoneNumber
        self.email = email
    }
    
    public var variables: GraphQLMap? {
        return ["method": method, "phoneNumber": phoneNumber, "email": email]
    }
    
    public struct Data: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Mutation"]
        
        public static var selections: [GraphQLSelection] {
            return [
                GraphQLField("sendOtp",arguments: ["method": GraphQLVariable("method"), "phoneNumber": GraphQLVariable("phoneNumber"), "email": GraphQLVariable("email")], type: .object([GraphQLField("status", type: .scalar(Int.self)),GraphQLField("message", type: .scalar(String.self))]))
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

// MARK: =============================================== Public Class EmailVerify through Email-ID ===============================================
public final class EmailVerifyAccountCreationQuery: GraphQLQuery {
    // The raw GraphQL definition of this operation.
    public var operationName: String = "VerifyOtp"
    
    public let operationDefinition =
    """
    query VerifyOtp($method: String!, $email: String!, $otp: String!) {
        verifyOtp(input: { method: $method, email: $email, otp: $otp}){
                            status
                            message
                        }
    }
    """
    
    public var email: String
    public var otp: String
    public var method: String
    
    public init(method: String, email: String, otp: String) {
        self.method = method
        self.email = email
        self.otp = otp
    }
    
    public var variables: GraphQLMap? {
        return ["method": method,"email": email, "otp": otp]
    }
    
    
    public struct Data: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Query"]
        
        public static var selections: [GraphQLSelection] {
            return [
                GraphQLField("verifyOtp", arguments: ["method": GraphQLVariable("method"), "email": GraphQLVariable("email"), "otp": GraphQLVariable("otp")], type: .object([GraphQLField("status", type: .scalar(Int.self)),GraphQLField("message", type: .scalar(String.self))]))
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
                return resultMap["email"] as? String
            }
            set {
                resultMap.updateValue(newValue, forKey: "email")
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

// MARK: =============================================== Public Class ReSendOtp through Email-ID ===============================================
public final class ReSendOtpEmailAccountCreationMutation: GraphQLMutation {
    // The raw GraphQL definition of this operation.
    public let operationName: String = "SendOtp"
    
    public let operationDefinition: String =
             """
             mutation SendOtp($email: String!) {
             sendOtp(input: {email: $email }){
                                         status
                                         message
                                     }
                                 }
             """
    public var email: String
    
    public init(email: String) {
        self.email = email
    }
    
    
    public var variables: GraphQLMap? {
        return ["email": email]
    }
    
    public struct Data: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Mutation"]
        
        public static var selections: [GraphQLSelection] {
            return [
                GraphQLField("sendOtp",arguments: ["email": GraphQLVariable("email")], type: .object([GraphQLField("status", type: .scalar(Int.self)),GraphQLField("message", type: .scalar(String.self))]))
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


// MARK: =============================================== Public Class Login By Phone Number API ===============================================
public final class LoginByPhoneNumberMutation: GraphQLMutation {
    // The raw GraphQL definition of this operation.
    public let operationName: String = "Login"
    
    public let operationDefinition: String =
             """
             mutation Login($phoneNumber: String!, $password: String!, $userType: String!) {
             login(input: {phoneNumber: $phoneNumber, password: $password, userType: $userType }){
             status
             message
             data
                                     }
                                 }
             """
    
    public var phoneNumber: String
    public var password: String
    public var userType: String
    
    public init(phoneNumber: String, password: String, userType: String) {
        self.phoneNumber = phoneNumber
        self.password = password
        self.userType = userType
    }
    
    
    public var variables: GraphQLMap? {
        return ["phoneNumber": phoneNumber, "password": password, "userType": userType]
    }
    
    public struct Data: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Mutation"]
        
        public static var selections: [GraphQLSelection] {
            return [
                GraphQLField("login",arguments: ["phoneNumber": GraphQLVariable("phoneNumber"), "password": GraphQLVariable("password"), "userType": GraphQLVariable("userType")], type: .object([GraphQLField("status", type: .scalar(Int.self)),GraphQLField("message", type: .scalar(String.self)), GraphQLField("data", type: .object([GraphQLField("_id", type: .scalar(String.self)),
                    GraphQLField("name", type: .scalar(String.self)),
                                                                                                                                                                                                                                                                                                                                           GraphQLField("primaryPhoneNumber", type: .scalar(String.self)), GraphQLField("secondaryPhoneNumber", type: .scalar(String.self)), GraphQLField("isPrimaryContactWhatsapp", type: .scalar(Bool.self)), GraphQLField("isSecondaryContactWhatsapp", type: .scalar(Bool.self)),
                                                                                                                                                                                                                                                                                                                                           GraphQLField("userType", type: .scalar(String.self)),
                                                                                                                                                                                                                                                                                                                                           GraphQLField("address", type: .scalar(String.self)),
                                                                                                                                                                                                                                                                                                                                           GraphQLField("city", type: .scalar(String.self)), GraphQLField("state", type: .scalar(String.self)),
                                                                                                                                                                                                                                                                                                                                           GraphQLField("email", type: .scalar(String.self)),
                                                                                                                                                                                                                                                                                                                                           GraphQLField("accessToken", type: .scalar(String.self)),
                                                                                                                                                                                                                                                                                                                                           GraphQLField("isAddressVisible", type: .scalar(Bool.self)),
                                                                                                                                                                                                                                                                                                                                           GraphQLField("isPrimaryContactVisible", type: .scalar(Bool.self)),
                                                                                                    
                                                                                                                                                                                                                                                                                                                                           GraphQLField("isSecondaryContactVisible", type: .scalar(Bool.self)),
                                                                                                                                                                                                                                                                                                                                           GraphQLField("fatherName", type: .scalar(String.self)),
                                                                                                                                                                                                                                                                                                                                           GraphQLField("isEmailVisible", type: .scalar(Bool.self)),
                                                                                                                                                                                                                                                                                                                                           GraphQLField("stateBar", type: .scalar(String.self)),
                                                                                                                                                                                                                                                                                                                                           GraphQLField("practicingCourt", type: .scalar(String.self)),
                                                                                                                                                                                                                                                                                                                                           GraphQLField("practiceYear", type: .scalar(String.self)),
                                                                                                                                                                                                                                                                                                                                           GraphQLField("barLiscenceNo", type: .scalar(String.self)),
                                                                                                                                                                                                                                                                                                                                           GraphQLField("coreCompetency", type: .scalar(String.self)),
                                                                                                                                                                                                                                                                                                                                           GraphQLField("orgainization", type: .scalar(String.self)),
                                                                                                                                                                                                                                                                                                                                          ]))]))
            ]
        }
        
        public private(set) var resultMap: ResultMap
        
        public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
        }
        
        public init(login: String? = nil) {
            self.init(unsafeResultMap: ["login": login])
        }
        
        
        public var login: String? {
            get {
                return resultMap["login"] as? String
            }
            set {
                resultMap.updateValue(newValue, forKey: "login")
            }
        }
    }
}



// MARK: =============================================== Public Class Login By Phone Number API ===============================================
public final class LoginByEmailMutation: GraphQLMutation {
    // The raw GraphQL definition of this operation.
    public let operationName: String = "Login"
    
    public let operationDefinition: String =
             """
             mutation Login($email: String!, $password: String!, $userType: String!) {
             login(input: {email: $email, password: $password, userType: $userType }){
             status
             message
             data
                                         }
                                 }
             """
    
    public var email: String
    public var password: String
    public var userType: String
    
    public init(email: String, password: String, userType: String) {
        self.email = email
        self.password = password
        self.userType = userType
    }
    
    
    public var variables: GraphQLMap? {
        return ["email": email, "password": password, "userType": userType]
    }
    
    public struct Data: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Mutation"]
        
        public static var selections: [GraphQLSelection] {
            return [
                GraphQLField("login",arguments: ["email": GraphQLVariable("email"), "password": GraphQLVariable("password"), "userType": GraphQLVariable("userType")], type: .object([GraphQLField("status", type: .scalar(Int.self)),GraphQLField("message", type: .scalar(String.self)), GraphQLField("data", type: .object([GraphQLField("name", type: .scalar(String.self)), GraphQLField("primaryPhoneNumber", type: .scalar(String.self)), GraphQLField("secondaryPhoneNumber", type: .scalar(String.self)), GraphQLField("isPrimaryContactWhatsapp", type: .scalar(Bool.self)), GraphQLField("isSecondaryContactWhatsapp", type: .scalar(Bool.self)), GraphQLField("userType", type: .scalar(String.self)), GraphQLField("address", type: .scalar(String.self)), GraphQLField("city", type: .scalar(String.self)), GraphQLField("state", type: .scalar(String.self)), GraphQLField("email", type: .scalar(String.self)), GraphQLField("accessToken", type: .scalar(String.self))]))]))
            ]
        }
        
        public private(set) var resultMap: ResultMap
        
        public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
        }
        
        public init(login: String? = nil) {
            self.init(unsafeResultMap: ["login": login])
        }
        
        
        public var login: String? {
            get {
                return resultMap["login"] as? String
            }
            set {
                resultMap.updateValue(newValue, forKey: "login")
            }
        }
    }
}

//mutation {
// login(input:{email:"example12@mailinator.com",phoneNumber:"8770329066", password: "examplePassword", userType: "USER"})
//{
//    status
//    message
//
//  }
//
//}

//    mutation {
//      createUser(input: {
//        userType: USER
//        name: "John Doe"
//          phoneNumber: "6261439001"
//          isPrimaryContactWhatsapp: false
//          secondaryContact: "9876543210"
//          isSecondaryContactWhatsapp: true
//        address: "123 Example St"
//        city: "indore"
//        state: "indore"
//        email: "roshni.raikwar@numeroeins.com"
//        password: "examplePassword"
//         confirmPassword: "examplePassword"
//      }){
//        status
//        message
//        data
//      }
//    }

//    mutation {
//      createUser(input: {
//        userType: USER
//        name: "John Doe"
//          phoneNumber: "9074243636"
//          isPrimaryContactWhatsapp: false
//          secondaryContact: "9876543210"
//          isSecondaryContactWhatsapp: true
//        address: "123 Example St"
//        city: "indore"
//        state: "indore"
//        email: "steev@mailinator.com"
//        password: "examplePassword"
//         confirmPassword: "examplePassword"
//      }){
//        status
//        message
//        data
//      }
//    }
//

// Response
//    {
//      "data": {
//        "createUser": {
//          "status": 201,
//          "message": "Account Created Successfully",
//          "data": {
//            "userType": "user"
//          }
//        }
//      }
//    }
//

//    mutation {
//     sendOtp(input:{phoneNumber:"6261439001"})
//    {
//         status
//        message
//          }
//    }

/*
 mutation {
 sendOtp(input: { method: "email",phoneNumber:"871983", email: "jack12@mailinator.com" }) {
 status
 message
 }
 }
 
 mutation {
 sendotp(input:{phonenumber:"7067854476",email:"roshni.raikwar@numeroeins.com"})
 {
 status
 message
 }
 }
 
 mutation {
 sendotp(input:{email:"roshni.raikwar@numeroeins.com"})
 {
 status
 message
 }
 }// resend otp with email id
 
 
 query {
 verifyotp(input:{email:"roshni.raikwar@numeroeins.com",otp:"663497"})
 {
 status
 message
 
 }
 }
 */
//  This file was automatically generated and should not be edited.
/*
 import Apollo
 
 public final class ProofOfConceptQuery: GraphQLQuery {
 public static let operationDefinition =
 "query ProofOfConcept($profileId: ID!) {" +
 "  initialChannelList(profileId: $profileId) {" +
 "    id" +
 "    title" +
 "    channels {" +
 "      id" +
 "      title" +
 "    }" +
 "  }" +
 "}"
 
 public let profileId: GraphQLID
 
 public init(profileId: GraphQLID) {
 self.profileId = profileId
 }
 
 public var variables: GraphQLMap? {
 return ["profileId": profileId]
 }
 
 public struct Data: GraphQLMappable {
 public let initialChannelList: InitialChannelList?
 
 public init(reader: GraphQLResultReader) throws {
 initialChannelList = try reader.optionalValue(for: Field(responseName: "initialChannelList", arguments: ["profileId": reader.variables["profileId"]]))
 }
 
 public struct InitialChannelList: GraphQLMappable {
 public let __typename = "ChannelList"
 public let id: GraphQLID
 public let title: String
 public let channels: [Channel?]
 
 public init(reader: GraphQLResultReader) throws {
 id = try reader.value(for: Field(responseName: "id"))
 title = try reader.value(for: Field(responseName: "title"))
 channels = try reader.list(for: Field(responseName: "channels"))
 }
 
 public struct Channel: GraphQLMappable {
 public let __typename = "Channel"
 public let id: GraphQLID
 public let title: String
 
 public init(reader: GraphQLResultReader) throws {
 id = try reader.value(for: Field(responseName: "id"))
 title = try reader.value(for: Field(responseName: "title"))
 }
 }
 }
 }
 }
 */





// MARK: =============================================== Public Class AccountCreation AllUsers ===============================================
public final class AccountCreationWithImageMutation: GraphQLMutation {
    
    // The raw GraphQL definition of this operation.
    
    public let operationDefinition: String =
    
             """
             mutation CreateUser($file: Upload!, $userType: String!, $name: String!, $phoneNumber: String!, $isPrimaryContactWhatsapp: Boolean!, $secondaryContact: String!, $isSecondaryContactWhatsapp: Boolean!, $address: String!, $city: String!, $state: String!, $email: String!, $password: String!, $confirmPassword: String!) {
             createUser(input: { userType: $userType, name: $name, phoneNumber: $phoneNumber,  isPrimaryContactWhatsapp: $isPrimaryContactWhatsapp, secondaryContact:  $secondaryContact, isSecondaryContactWhatsapp: $isSecondaryContactWhatsapp, address: $address, city: $city, state: $state, email: $email, password: $password, confirmPassword: $confirmPassword }, file: [$file]){
             status
             message
             data
                                     }
                                 }
             """
    
    /*
     
     
     // Define your GraphQL mutation
     let uploadMutation = """
     mutation UploadImage($image: Upload!) {
     uploadImage(image: $image) {
     imageUrl
     }
     }
     """
     
     // Define your mutation class
     class YourUploadMutation: GraphQLMutation {
     let image: Data // Image data
     
     init(image: Data) {
     self.image = image
     }
     
     // Define the variables needed for the mutation
     var variables: GraphQLMap? {
     return ["image": GraphQLMap(["filename": "image.png", "data": image])]
     }
     
     // Define the mutation
     func body() throws -> GraphQLMap {
     return try GraphQLMap(["query": uploadMutation, "variables": variables])
     }
     
     
     mutation ($file: Upload!) {
     createUser(
     input: {
     userType: "USER"
     profileImage: $file
     name: "John Doe"
     phoneNumber: "8770329066"
     isPrimaryContactWhatsapp: false
     secondaryContact: "9876543210"
     isSecondaryContactWhatsapp: true
     address: "123 Example St"
     city: "indore"
     state: "indore"
     email: "example12@mailinator.com"
     password: "examplePassword"
     confirmPassword: "examplePassword"
     }
     
     ) {
     status
     message
     data
     }
     }
     
     mutation UploadFile($file:Upload!) {
     singleUpload(file:$file) {
     id
     }
     }
     
     // Define your mutation class
     class YourUploadMutation: GraphQLMutation {
     let image: Data // Image data
     
     init(image: Data) {
     self.image = image
     }
     
     // Define the variables needed for the mutation
     var variables: GraphQLMap? {
     return ["image": GraphQLMap(["filename": "image.png", "data": image])]
     }
     
     // Define the mutation
     func body() throws -> GraphQLMap {
     return try GraphQLMap(["query": uploadMutation, "variables": variables])
     }
     */
    public let operationName: String = "CreateUser"
    
    public var file: String
    public var userType: String
    public var name: String
    public var phoneNumber: String
    public var isPrimaryContactWhatsapp: Bool?
    public var secondaryContact: String?
    public var isSecondaryContactWhatsapp: Bool?
    public var address: String
    public var city: String
    public var state: String
    public var email: String
    public var password: String
    public var confirmPassword: String
    
    public init(file: String, userType: String, name: String, phoneNumber: String, isPrimaryContactWhatsapp: Bool, secondaryContact: String?, isSecondaryContactWhatsapp: Bool?, address: String, city: String,  state: String, email: String, password: String, confirmPassword: String) {
        self.userType = userType
        self.name = name
        self.phoneNumber = phoneNumber
        self.isPrimaryContactWhatsapp = isPrimaryContactWhatsapp
        self.secondaryContact = secondaryContact
        self.isSecondaryContactWhatsapp =  isSecondaryContactWhatsapp
        self.address = address
        self.city = city
        self.state = state
        self.email = email
        self.password = password
        self.confirmPassword = confirmPassword
        self.file = file
    }
    
    //(["filename": "image.png", "data": file]
    public var variables: GraphQLMap? {
        return ["file": file, "userType": userType, "name": name, "phoneNumber": phoneNumber, "isPrimaryContactWhatsapp": isPrimaryContactWhatsapp, "secondaryContact": secondaryContact, "isSecondaryContactWhatsapp": isSecondaryContactWhatsapp, "address": address, "city": city, "state": state, "email": email, "password": password, "confirmPassword": confirmPassword]
    }
    
    public struct Data: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Mutation"]
        
        public static var selections: [GraphQLSelection] {
            return [
                GraphQLField("createUser",arguments: ["file": GraphQLVariable("file"),
                                                      "userType": GraphQLVariable("userType"),
                                                      "name": GraphQLVariable("name"),
                                                      "phoneNumber": GraphQLVariable("phoneNumber"),
                                                      "isPrimaryContactWhatsapp": GraphQLVariable("isPrimaryContactWhatsapp"),
                                                      "secondaryContact": GraphQLVariable("secondaryContact"),
                                                      "isSecondaryContactWhatsapp": GraphQLVariable("isSecondaryContactWhatsapp"),
                                                      "address": GraphQLVariable("address"),
                                                      "city": GraphQLVariable("city"),
                                                      "state": GraphQLVariable("state"),
                                                      "email": GraphQLVariable("email"),
                                                      "password": GraphQLVariable("password"),
                                                      "confirmPassword": GraphQLVariable("confirmPassword")],
                             type: .object([GraphQLField("status", type: .scalar(Int.self)),GraphQLField("message", type: .scalar(String.self)), GraphQLField("data", type: .object([GraphQLField("userType", type: .scalar(String.self))]))]))
            ]
        }
        
        public private(set) var resultMap: ResultMap
        
        public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
        }
        
        public init(createUser: String? = nil) {
            self.init(unsafeResultMap: ["createUser": createUser])
        }
        
        
        public var createUser: String? {
            get {
                return resultMap["createUser"] as? String
            }
            set {
                resultMap.updateValue(newValue, forKey: "createUser")
            }
        }
    }
}
