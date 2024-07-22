//
//  AdvocatesFilter.swift
//  Vidhik
//
//  Created by Dinesh Rajput on 26/02/24.
//

import UIKit

// MARK: =============================== Enums Created ===============================
enum FeesRangeSelection {
    case noBarFees
    case zeroToTenKFess
    case tenToFiftyKFess
    case fiftyToThousand
}

enum WorkExPerienceSelection {
    case anyExperience
    case twoToFiveExperience
    case fiveToTenExperience
    case tenPlusYearsExperience
}

enum ShowPopulertiySelection {
    case populerity
    case bestReview
    case starRating
    case mostReview
}

enum GenderSelection {
    case male
    case feMale
}


class AdvocatesFilter: UIView {
    // MARK: =============================== IBOutlet Properties ===============================
    @IBOutlet weak var selectPlaceTextField: UITextField!
    @IBOutlet weak var selectFieldTextField: UITextField!
    @IBOutlet weak var populerityButton: UIButton!
    @IBOutlet weak var bestReviewButton: UIButton!
    @IBOutlet weak var starRatingButton: UIButton!
    @IBOutlet weak var mostReviewButton: UIButton!
    @IBOutlet weak var anyExperienceButton: UIButton!
    @IBOutlet weak var twoToFiveExperienceButton: UIButton!
    @IBOutlet weak var fiveToTenExperienceButton: UIButton!
    @IBOutlet weak var tenPlusYearsExperienceButton: UIButton!
    @IBOutlet weak var maleButton: UIButton!
    @IBOutlet weak var femaleButton: UIButton!
    @IBOutlet weak var noBarFeesButton: UIButton!
    @IBOutlet weak var zeroToTenKFessButton: UIButton!
    @IBOutlet weak var tenToFiftyKFessButton: UIButton!
    @IBOutlet weak var fiftyToThousandKButton: UIButton!
    @IBOutlet weak var placeDropDownView: CustomDropDownView!
    @IBOutlet weak var placeDropDownViewHeight: NSLayoutConstraint!
    @IBOutlet weak var practiceFieldDropDownView: CustomDropDownView!
    @IBOutlet weak var practiceFieldDropDownViewHeight: NSLayoutConstraint!
    
    
    // MARK: =============================== Instance Properties ===============================
    var callback: (() -> ())?
    var callbackHideView: (() -> ())?
    var arrData = ["Andhra Pradesh","Arunachal Pradesh","Assam", "Bihar", "Chhattisgarh", "Goa", "Gujarat", "Haryana", "Himachal Pradesh", "Jharkhand", "Karnataka", "Kerala", "Madhya Pradesh", "Maharashtra", "Manipur"]
    var arrPracticeField = ["Family Law","Health Law","Immigration Law", "International Law", "Military Law", "Education Law", "Criminal Law", "Corporate Law", "Constitutional Law", "Civil Rights Law", "Real Estate Law", "Entertainment Law"]
    
    //MARK: =============================== Type Method ===============================
    static func showFilteredView(onview view: UIView, callback: @escaping (() -> ())) -> AdvocatesFilter {
        let podNib = UINib(nibName: "AdvocatesFilter", bundle: nil).instantiate(withOwner: nil, options: nil).first as! AdvocatesFilter
        podNib.frame = UIScreen.main.bounds
        podNib.callback = callback
        podNib.didSelectFeesRangeSelection(fessRange: FeesRangeSelection.noBarFees)
        podNib.didSelectGenderSelection(genderSelection: GenderSelection.male)
        podNib.didSelectShowResultSelection(showPopulertiy: ShowPopulertiySelection.populerity)
        podNib.didSelectWorkExperienceSelection(workExperience: WorkExPerienceSelection.anyExperience)
        view.addSubview(podNib)
        podNib.layoutIfNeeded()
        return podNib
    }
    
    // MARK: =============================== PopupView Hide Method ===============================
    func hide() {
        self.removeFromSuperview()
        callbackHideView?()
    }
    
    //MARK: =============================== DropDown View Show Hide Method ===============================
    func showDropDown(dropDownHeight: NSLayoutConstraint, dropDownView: CustomDropDownView, text: UITextField, data: [String]) {
        dropDownHeight.constant = 300
        dropDownView.tableData = data
        dropDownView.dropDownTable.reloadData()
        dropDownView.isHidden = false
        
        dropDownView.closerForbackVC = { sttr in
            text.text = dropDownView.selectedItemText
            dropDownView.isHidden = true
        }
    }
    
    //MARK: =============================== IBAction Methods ===============================
    @IBAction func selectPlaceButton(_ sender: UIButton) {
        showDropDown(dropDownHeight: placeDropDownViewHeight,
                     dropDownView: placeDropDownView,
                     text: selectPlaceTextField, data: arrData)
    }
    
    @IBAction func selctParcticingFieldButton(_ sender: UIButton) {
        showDropDown(dropDownHeight: practiceFieldDropDownViewHeight, 
                     dropDownView: practiceFieldDropDownView,
                     text: selectFieldTextField, data: arrPracticeField)
    }
    
    @IBAction func closeFilterButton(_ sender: UIButton) {
        hide()
        print("Close filter")
    }
    
    // MARK: =============================== Show Poppulertiy Selection Private Method ===============================
    private func didSelectShowResultSelection(showPopulertiy: ShowPopulertiySelection) {
        // Reset state
        [populerityButton, bestReviewButton, starRatingButton, mostReviewButton].forEach { button in
            button?.setImage(UIImage(named:  "UncheckCircle"), for: .normal)
        }
        
        switch showPopulertiy {
        case .populerity:
            populerityButton.setImage(UIImage(named:  "checkCircle"), for: .normal)
            
        case .bestReview:
            bestReviewButton.setImage(UIImage(named:  "checkCircle"), for: .normal)
            
        case .starRating:
            starRatingButton.setImage(UIImage(named:  "checkCircle"), for: .normal)
            
        case .mostReview:
            mostReviewButton.setImage(UIImage(named:  "checkCircle"), for: .normal)
            
        }
    }
    
    // MARK: =============================== Private Method Work Experience Selection ===============================
    private func didSelectWorkExperienceSelection(workExperience: WorkExPerienceSelection) {
        // Reset state
        [anyExperienceButton, twoToFiveExperienceButton, fiveToTenExperienceButton, tenPlusYearsExperienceButton].forEach { button in
            button?.setImage(UIImage(named:  "UncheckCircle"), for: .normal)
        }
        
        switch workExperience {
        case .anyExperience:
            anyExperienceButton.setImage(UIImage(named:  "checkCircle"), for: .normal)
            
        case .twoToFiveExperience:
            twoToFiveExperienceButton.setImage(UIImage(named:  "checkCircle"), for: .normal)
            
        case .fiveToTenExperience:
            fiveToTenExperienceButton.setImage(UIImage(named:  "checkCircle"), for: .normal)
            
        case .tenPlusYearsExperience:
            tenPlusYearsExperienceButton.setImage(UIImage(named:  "checkCircle"), for: .normal)
            
        }
    }
    
    // MARK: =============================== Private Method Fees Range Selection ===============================
    private func didSelectFeesRangeSelection(fessRange: FeesRangeSelection) {
        // Reset state
        [noBarFeesButton, zeroToTenKFessButton, tenToFiftyKFessButton, fiftyToThousandKButton].forEach { button in
            button?.setImage(UIImage(named:  "UncheckCircle"), for: .normal)
        }
        
        switch fessRange {
        case .noBarFees:
            noBarFeesButton.setImage(UIImage(named:  "checkCircle"), for: .normal)
            
        case .zeroToTenKFess:
            zeroToTenKFessButton.setImage(UIImage(named:  "checkCircle"), for: .normal)
            
        case .tenToFiftyKFess:
            tenToFiftyKFessButton.setImage(UIImage(named:  "checkCircle"), for: .normal)
            
        case .fiftyToThousand:
            fiftyToThousandKButton.setImage(UIImage(named:  "checkCircle"), for: .normal)
        }
    }
    
    // MARK: =============================== Private Method Gender Selection ===============================
    private func didSelectGenderSelection(genderSelection: GenderSelection) {
        // Reset state
        [maleButton, femaleButton].forEach { button in
            button?.setImage(UIImage(named:  "UncheckCircle"), for: .normal)
        }
        
        switch genderSelection {
        case .male:
            maleButton.setImage(UIImage(named:  "checkCircle"), for: .normal)
            
        case .feMale:
            femaleButton.setImage(UIImage(named:  "checkCircle"), for: .normal)
        }
    }
    
    // MARK: ===============================  IBAction Methods ===============================
    @IBAction func showResultsPopulartiySelection(_ sender: UIButton) {
        didSelectShowResultSelection(showPopulertiy: .populerity)
    }
    
    @IBAction func showResultsBestReviewSelection(_ sender: UIButton) {
        didSelectShowResultSelection(showPopulertiy: .bestReview)
    }
    
    @IBAction func showResultsStarRatingSelection(_ sender: UIButton) {
        didSelectShowResultSelection(showPopulertiy: .starRating)
    }
    
    @IBAction func showResultsMostReviewSelection(_ sender: UIButton) {
        didSelectShowResultSelection(showPopulertiy: .mostReview)
    }
    
    @IBAction func workExperienceAnySelection(_ sender: UIButton) {
        didSelectWorkExperienceSelection(workExperience: .anyExperience)
    }
    
    @IBAction func workExperienceTwoToFiveSelection(_ sender: UIButton) {
        didSelectWorkExperienceSelection(workExperience: .twoToFiveExperience)
    }
    
    @IBAction func workExperienceFiveToTenYearsSelection(_ sender: UIButton) {
        didSelectWorkExperienceSelection(workExperience: .fiveToTenExperience)
        
    }
    @IBAction func workExperienceTenYearsSelection(_ sender: UIButton) {
        didSelectWorkExperienceSelection(workExperience: .tenPlusYearsExperience)
    }
    
    @IBAction func maleSelection(_ sender: UIButton) {
        didSelectGenderSelection(genderSelection: .male)
    }
    
    @IBAction func feMaleSelection(_ sender: UIButton) {
        didSelectGenderSelection(genderSelection: .feMale)
    }
    
    @IBAction func feesRangeSelectionButton(_ sender: UIButton) {
        didSelectFeesRangeSelection(fessRange: .noBarFees)
    }
    
    @IBAction func feesRangeZeroToTenKFessSelection(_ sender: UIButton) {
        didSelectFeesRangeSelection(fessRange: .zeroToTenKFess)
    }
    
    @IBAction func feesRangeTenToFiftyKFessSelection(_ sender: UIButton) {
        didSelectFeesRangeSelection(fessRange: .tenToFiftyKFess)
    }
    
    @IBAction func feesRangeFiftyToThousandSelection(_ sender: UIButton) {
        didSelectFeesRangeSelection(fessRange: .fiftyToThousand)
    }
    
    @IBAction func showResultButton(_ sender: UIButton) {
        hide()
    }
    
    @IBAction func cancelFilterButton(_ sender: UIButton) {
        hide()
    }
}
