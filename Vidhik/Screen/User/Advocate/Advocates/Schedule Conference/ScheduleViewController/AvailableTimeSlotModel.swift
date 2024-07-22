//
//  AvailableTimeSlotModel.swift
//  Vidhik
//
//  Created by Dinesh Rajput on 01/03/24.
//

import Foundation
import UIKit

struct AvailableTimeSlotModel {
    var availableDate: String
    var availableTimeSlot: [AvailableTimeSlot]
}

struct AvailableTimeSlot {
    var time: String
    var color: UIColor? = .solidBlue
}
