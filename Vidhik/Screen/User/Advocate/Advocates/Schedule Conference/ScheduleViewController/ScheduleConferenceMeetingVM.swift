//
//  ScheduleConferenceMeetingVM.swift
//  Vidhik
//
//  Created by Dinesh Rajput on 01/03/24.
//

import Foundation

class ScheduleConferenceMeetingVM {
    
    // MARK: ================================ Instance Method ================================
    var availableTime: [AvailableTimeSlotModel]?
    var isFirstTimePayment: Bool?
    
    // MARK: ================================ Dumy Data For Slot ================================
    func getAvailableSlot() {
        availableTime = [AvailableTimeSlotModel(availableDate: "12 March 2024",
                                                availableTimeSlot: [AvailableTimeSlot(time: "2PM - 3PM"),
                                                                    AvailableTimeSlot(time: "3PM - 4PM"),
                                                                    AvailableTimeSlot(time: "4PM - 5PM"),
                                                                    AvailableTimeSlot(time: "5PM - 6PM"),
                                                                    AvailableTimeSlot(time: "6PM - 7PM"),
                                                                    AvailableTimeSlot(time: "7PAM - 8PM")]),
                         AvailableTimeSlotModel(availableDate: "13 March 2024",
                                                availableTimeSlot: [AvailableTimeSlot(time: "2PM - 3PM"),
                                                                    AvailableTimeSlot(time: "3PM - 4PM"),
                                                                    AvailableTimeSlot(time: "4PM - 5PM"),
                                                                    AvailableTimeSlot(time: "5PM - 6PM"),
                                                                    AvailableTimeSlot(time: "6PM - 7PM"),
                                                                    AvailableTimeSlot(time: "7PAM - 8PM")]),
                         AvailableTimeSlotModel(availableDate: "14 March 2024",
                                                availableTimeSlot: [AvailableTimeSlot(time: "2PM - 3PM"),
                                                                    AvailableTimeSlot(time: "3PM - 4PM"),
                                                                    AvailableTimeSlot(time: "4PM - 5PM"),
                                                                    AvailableTimeSlot(time: "5PM - 6PM"),
                                                                    AvailableTimeSlot(time: "6PM - 7PM"),
                                                                    AvailableTimeSlot(time: "7PAM - 8PM")])]
    }
    
    
    
}
