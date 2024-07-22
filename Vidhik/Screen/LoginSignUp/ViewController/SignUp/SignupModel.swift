//
//  SignupModel.swift
//  Vidhik
//
//  Created by Dinesh Rajput on 15/04/24.
//

import Foundation

struct SendOtpResponse: Decodable {
    let data: SendOtpResonse?
}

struct SendOtpResonse: Decodable {
    let sendOtp: SendOtpDetails?
}

struct SendOtpDetails: Decodable {
    let status: Int?
    let message: String?
}
