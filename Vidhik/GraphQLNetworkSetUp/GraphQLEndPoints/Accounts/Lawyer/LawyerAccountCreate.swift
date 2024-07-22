//
//  Lawyer.swift
//  Vidhik
//
//  Created by Dinesh Rajput on 09/05/24.
//

import Foundation
import Apollo

public final class LawyerAccountCreate: GraphQLMutation {
    // The raw GraphQL definition of this operation.
    public let operationDefinition: String =
             """
             mutation CreateLawyers($userType: String!, $lawyerName: String!,
             $fatherName: String!,$orgainization: String! ,$primaryContact: String!, $isPrimaryContactWhatsapp: Boolean!,
             $isPrimaryMobileDisplay: Boolean!,$secondaryContact: String!, $isSecondaryContactWhatsapp: Boolean!, $isSecondaryMobileDisplay:Boolean! ,$city: String!, $state: String!, $email: String!, $password: String!,
             $confirmPassword: String!, $barLicenseNumber: String!, $stateBar: String!,
             $practiceYear: String!, $coreCompetency: String!, $practicingCourt: String!,
             $practicingField: [String!]!, $isEmailDisplay: Boolean!, $barAddress: String!, $isBarAddressDisplay:Boolean!) {
             createLawyers(input: { userType: $userType,
                          lawyerName: $lawyerName, fatherName: $fatherName,
                            orgainization:$orgainization,
                          primaryContact: $primaryContact,
                          isPrimaryContactWhatsapp: $isPrimaryContactWhatsapp,
                                       isPrimaryMobileDisplay: $isPrimaryMobileDisplay,
                          secondaryContact:  $secondaryContact,
                          isSecondaryContactWhatsapp: $isSecondaryContactWhatsapp,
                                       isSecondaryMobileDisplay: $isSecondaryMobileDisplay,
                          city: $city, state: $state, email: $email,
                          password: $password, confirmPassword: $confirmPassword,
                          barLicenseNumber: $barLicenseNumber, stateBar: $stateBar,
                          practiceYear: $practiceYear, coreCompetency: $coreCompetency,
                          practicingCourt: $practicingCourt, practicingField: $practicingField,
                                       isEmailDisplay: $isEmailDisplay, barAddress: $barAddress, isBarAddressDisplay: $isBarAddressDisplay }){
             status
             message
             data
                                     }
                                 }
             """
     
    
    public let operationName: String = "CreateLawyers"
    
    public var userType: String
    public var lawyerName: String
    public var fatherName: String
    public var orgainization: String
    public var primaryContact: String
    public var isPrimaryContactWhatsapp: Bool?
    public var isPrimaryMobileDisplay: Bool?
    public var secondaryContact: String?
    public var isSecondaryContactWhatsapp: Bool?
    public var isSecondaryMobileDisplay: Bool?
    public var city: String
    public var state: String
    public var email: String
    public var password: String
    public var confirmPassword: String
    public var barLicenseNumber: String
    public var stateBar: String
    public var practiceYear: String
    public var coreCompetency: String
    public var practicingCourt: String
    public var practicingField: [String]
    public var isEmailDisplay: Bool?
    public var barAddress: String
    public var isBarAddressDisplay: Bool?

    public init(userType: String, lawyerName: String, fatherName: String,orgainization: String ,primaryContact: String, isPrimaryContactWhatsapp: Bool,isPrimaryMobileDisplay: Bool?, secondaryContact: String?, isSecondaryContactWhatsapp: Bool?,isSecondaryMobileDisplay: Bool? ,city: String,  state: String, email: String, password: String, confirmPassword: String, barLicenseNumber: String, stateBar: String, practiceYear: String, coreCompetency: String, practicingCourt: String, practicingField: [String], isEmailDisplay: Bool?, barAddress: String, isBarAddressDisplay: Bool?) {
        self.userType = userType
        self.lawyerName = lawyerName
        self.fatherName = fatherName
        self.orgainization = orgainization
        self.primaryContact = primaryContact
        self.isPrimaryContactWhatsapp = isPrimaryContactWhatsapp
        self.isPrimaryMobileDisplay = isPrimaryMobileDisplay
        self.secondaryContact = secondaryContact
        self.isSecondaryContactWhatsapp =  isSecondaryContactWhatsapp
        self.isSecondaryMobileDisplay = isSecondaryMobileDisplay
        self.city = city
        self.state = state
        self.email = email
        self.password = password
        self.confirmPassword = confirmPassword
        self.barLicenseNumber = barLicenseNumber
        self.stateBar = stateBar
        self.practiceYear = practiceYear
        self.coreCompetency = coreCompetency
        self.practicingCourt = practicingCourt
        self.practicingField = practicingField
        self.isEmailDisplay = isEmailDisplay
        self.barAddress = barAddress
        self.isBarAddressDisplay = isBarAddressDisplay
        
    }
 
    
    public var variables: GraphQLMap? {
        return ["userType": userType, "lawyerName": lawyerName,
                "fatherName": fatherName,"orgainization": orgainization ,"primaryContact": primaryContact,
                "isPrimaryContactWhatsapp": isPrimaryContactWhatsapp,
                "isPrimaryMobileDisplay": isPrimaryMobileDisplay,
                "secondaryContact": secondaryContact, "isSecondaryContactWhatsapp": isSecondaryContactWhatsapp,
                "isSecondaryMobileDisplay": isSecondaryMobileDisplay,
                 "city": city, "state": state,
                "email": email, "password": password, "confirmPassword": confirmPassword,
                "barLicenseNumber": barLicenseNumber, "stateBar": stateBar,
                "practiceYear": practiceYear, "coreCompetency": coreCompetency,
                "practicingCourt": practicingCourt, "practicingField": practicingField,
                "isEmailDisplay": isEmailDisplay, "barAddress": barAddress,
                "isBarAddressDisplay": isBarAddressDisplay]
    }
    
    public struct Data: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Mutation"]
        
        public static var selections: [GraphQLSelection] {
            return [
                GraphQLField("createLawyers",arguments: ["userType": GraphQLVariable("userType"),
                                                      "lawyerName": GraphQLVariable("lawyerName"),
                                                      "fatherName": GraphQLVariable("fatherName"),
                                                         "orgainization": GraphQLVariable("orgainization"),
                                                      "primaryContact": GraphQLVariable("primaryContact"),
                                                      "isPrimaryContactWhatsapp": GraphQLVariable("isPrimaryContactWhatsapp"),
                                                         "isPrimaryMobileDisplay": GraphQLVariable("isPrimaryMobileDisplay"),
                                                      "secondaryContact": GraphQLVariable("secondaryContact"),
                                                      "isSecondaryContactWhatsapp": GraphQLVariable("isSecondaryContactWhatsapp"),
                                                         "isSecondaryMobileDisplay": GraphQLVariable("isSecondaryMobileDisplay"),
                                                      "city": GraphQLVariable("city"),
                                                      "state": GraphQLVariable("state"),
                                                      "email": GraphQLVariable("email"),
                                                      "password": GraphQLVariable("password"),
                                                      "confirmPassword": GraphQLVariable("confirmPassword"),
                                                      "barLicenseNumber": GraphQLVariable("barLicenseNumber"),
                                                      "stateBar": GraphQLVariable("stateBar"),
                                                      "practiceYear": GraphQLVariable("practiceYear"),
                                                      "coreCompetency": GraphQLVariable("coreCompetency"),
                                                      "practicingCourt": GraphQLVariable("practicingCourt"),
                                                      "practicingField": GraphQLVariable("practicingField"),
                                                      "isEmailDisplay": GraphQLVariable("isEmailDisplay"),
                                                      "barAddress": GraphQLVariable("barAddress"),
                                                         "isBarAddressDisplay": GraphQLVariable("isBarAddressDisplay")],
                             type: .object([GraphQLField("status", type: .scalar(Int.self)),GraphQLField("message", type: .scalar(String.self)), GraphQLField("data", type: .object([GraphQLField("userType", type: .scalar(String.self)),
                                                                     GraphQLField("lawyerName", type: .scalar(String.self)),
                                                                     GraphQLField("fatherName", type: .scalar(String.self)),
                                                                                                                                                                                     GraphQLField("orgainization", type: .scalar(String.self)),
                                                                     GraphQLField("primaryContact", type: .scalar(String.self)),
                                                                     GraphQLField("isPrimaryContactWhatsapp", type: .scalar(Bool.self)),
                                                                     GraphQLField("isPrimaryMobileDisplay", type: .scalar(Bool.self)),
                                                                     GraphQLField("secondaryContact", type: .scalar(String.self)),
                                                                     GraphQLField("isSecondaryContactWhatsapp", type: .scalar(Bool.self)),
                                                                     GraphQLField("isSecondaryMobileDisplay", type: .scalar(Bool.self)),
                                                                     GraphQLField("city", type: .scalar(String.self)),
                                                                     GraphQLField("state", type: .scalar(String.self)),
                                                                     GraphQLField("email", type: .scalar(String.self)),
                                                                     GraphQLField("barLicenseNumber", type: .scalar(String.self)),
                                                                     GraphQLField("stateBar", type: .scalar(String.self)),
                                                                     GraphQLField("practiceYear", type: .scalar(String.self)),
                                                                     GraphQLField("coreCompetency", type: .scalar(String.self)),
                                                                     GraphQLField("practicingCourt", type: .scalar(String.self)),
                                                                                                                                                                                     GraphQLField("practicingField", type: .scalar(StringArray.self)),
                                                                     GraphQLField("isEmailDisplay", type: .scalar(Bool.self)),
                                                                     GraphQLField("barAddress", type: .scalar(String.self)),
                                                                      GraphQLField("isBarAddressDisplay", type: .scalar(Bool.self)),
                                                                     GraphQLField("_id", type: .scalar(String.self))]))]))
          
            ]
        }
        
        public private(set) var resultMap: ResultMap
        
        public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
        }
        
        public init(createLawyers: String? = nil) {
            self.init(unsafeResultMap: ["createLawyers": createLawyers])
        }
        
        public var createLawyers: String? {
            get {
                return resultMap["createLawyers"] as? String
            }
            set {
                resultMap.updateValue(newValue, forKey: "createLawyers")
            }
        }
    }
}

/*
mutation {
createLawyers(input: {
 userType: "LAWYER"
 lawyerName: "John Doe"
 fatherName:"Mark JOHN WICk"
 primaryContact: "8770329066"
 isPrimaryContactWhatsapp: false
 secondaryContact: "9876543210"
 isSecondaryContactWhatsapp: true
 address: "123 Example St"
 city: "Indore"
 state: "Indore"
 email: "example12@mailinator.com"
 password: "examplePassword"
 confirmPassword: "examplePassword"
 barlicenseNumber: "ABCD12345"
 stateBar: "Indiana"
 practiceYear: "5"
 coreCompetency: "Civil Law"
 practicingCourt: "Supreme Court"
 practicingField: "Family Law"
 displayProfile: false
 barAddress: "456 Lawyer St"
}) {
 status
 message
 data
}
}
 
*/


//mutation {
//  createLawyers(input: {
//    userType: "LAWYER"
//    lawyerName: "John Doe"
//    fatherName: "Mark JOHN WICk"
//    primaryContact: "8770329066"
//    isPrimaryContactWhatsapp: false
//    isprimaryMobiledisplay:true
//    secondaryContact: "9876543210"
//    isSecondaryContactWhatsapp: true
//    issecondaryMobiledisplay: true
//    address: "123 Example St"
//    city: "Indore"
//    state: "Indore"
//    email: "mailto:example12@mailinator.com"
//    password: "examplePassword"
//    confirmPassword: "examplePassword"
//    barlicenseNumber: "ABCD12345"
//    stateBar: "Indiana"
//    practiceYear: "5"
//    coreCompetency: "Civil Law"
//    practicingCourt: "Supreme Court,High court"
//    practicingField: ["Family Law", "Chamber"]
//    isemaildisplay : false
//    barAddress: "456 Lawyer St"
//    isbaraddressdisplay:true
//  }) {
//    status
//    message
//    data
//  }
//}
struct StringArray: JSONDecodable {
    let values: [String]

    init(jsonValue value: JSONValue) throws {
        guard let array = value as? [String] else {
            throw JSONDecodingError.couldNotConvert(value: value, to: [String].self)
        }
        self.values = array
    }
}
