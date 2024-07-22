//
//  CreateCaseDairyVM.swift
//  Vidhik
//
//  Created by Dinesh Rajput on 04/04/24.
//

import Foundation

class CreateCaseDairyVM {
    
    var arrData = ["Section Name", "Section Name", "Section Name", "Section Name", "Section Name", "Section Name", "Section Name", "Section Name", "Section Name", "Section Name", "Section Name", "Section Name"]
    
    
    // MARK: ============================= Create Case Dairy Validation =============================
    func createCaseDairyValidation(registarionDate: String, courtName: String, caseNumber: String, caseStage: String, city: String, applicantName: String, respondentName: String, applicationType: String, applicationSection: String, nextHearingDate: String, reasonForAbsent: String) -> Bool {
        
        guard !(registarionDate.isEmpty) else {
            return AlertView.show(title: alertTitle, message: "Please enter registration Date")
        }
        guard registarionDate.isValid(type: .datePattern) else {
            return AlertView.show(title: alertTitle, message: "Please enter valid for dd-mm-yyyy this formate registration Date")
        }
        
        guard !(courtName.isEmpty) else {
            return AlertView.show(title: alertTitle, message: "Please select court name.")
        }
        
        guard !(caseNumber.isEmpty) else {
            return AlertView.show(title: alertTitle, message: "Please enter case number.")
        }
        
        guard !(caseStage.isEmpty) else {
            return AlertView.show(title: alertTitle, message: "Please select case stage.")
        }
        
        guard !(city.isEmpty) else {
            return AlertView.show(title: alertTitle, message: "Please select City")
        }
        
        guard !(applicantName.isEmpty) else {
            return AlertView.show(title: alertTitle, message: "Please enter applicant name.")
        }
        
        guard applicantName.isValid(type: .name) else {
            return AlertView.show(title: alertTitle, message: "Please valid applicant name.")
        }
        
        guard !(respondentName.isEmpty) else {
            return AlertView.show(title: alertTitle, message: "Please enter respondent name.")
        }
        
        guard respondentName.isValid(type: .name) else {
            return AlertView.show(title: alertTitle, message: "Please enter valid respondent name.")
        }
        
        guard !(applicationType.isEmpty) else {
            return AlertView.show(title: alertTitle, message: "Please select application type.")
        }
        
        guard !(applicationSection.isEmpty) else {
            return AlertView.show(title: alertTitle, message: "Please select application section.")
        }
        
        guard !(nextHearingDate.isEmpty) else {
            return AlertView.show(title: alertTitle, message: "Please select enter next hearing Date")
        }
        
        guard nextHearingDate.isValid(type: .datePattern) else {
            return AlertView.show(title: alertTitle, message: "Please enter valid for dd-mm-yyyy this formate next hearing Date")
        }
        
        guard !(reasonForAbsent.isEmpty) else {
            return AlertView.show(title: alertTitle, message: "Please enter reasion for absent.")
        }
        return true
        
    }
    
}
