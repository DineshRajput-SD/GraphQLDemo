//
//  CreateCaseDairyVC.swift
//  Vidhik
//
//  Created by NumeroEins on 08/02/24.
//

import UIKit

class CreateCaseDairyVC: UIViewController {
    //MARK: ============================= IBOutlets Properties =============================
    @IBOutlet weak var navigationView: NavigationBarView!
    @IBOutlet weak var txtRegistrationDate: UITextField!
    @IBOutlet weak var txtCourtName: UITextField!
    @IBOutlet weak var btnSelectCourtNameDropDown: UIButton!
    @IBOutlet weak var txtCaseNo: UITextField!
    @IBOutlet weak var txtCaseStage: UITextField!
    @IBOutlet weak var btnSelectCaseStageDropDown: UIButton!
    @IBOutlet weak var txtCity: UITextField!
    @IBOutlet weak var btnSelectCityDropDown: UIButton!
    @IBOutlet weak var txtApplicantName: UITextField!
    @IBOutlet weak var txtRespondentName: UITextField!
    @IBOutlet weak var txtApplicationType: UITextField!
    @IBOutlet weak var btnSelectAppTypeDropDown: UIButton!
    @IBOutlet weak var txtApplicationSection: UITextField!
    @IBOutlet weak var btnSelectAppSectionDropDown: UIButton!
    @IBOutlet weak var txtHearingDate: UITextField!
    @IBOutlet weak var txtAbsentReason: UITextField!
    @IBOutlet weak var btnCreate: UIButton!
    @IBOutlet weak var btnReset: UIButton!
    @IBOutlet weak var courtNameDropDownView: DropDownViewWithSearch!
    @IBOutlet weak var courtNameDropDownViewHeight: NSLayoutConstraint!
    @IBOutlet weak var caseStageDropDownView: DropDownViewWithSearch!
    @IBOutlet weak var caseStageDropDownViewHeight: NSLayoutConstraint!
    @IBOutlet weak var cityDropDownView: DropDownViewWithSearch!
    @IBOutlet weak var cityDropDownViewHeight: NSLayoutConstraint!
    @IBOutlet weak var appTypeDropDownView: DropDownViewWithSearch!
    @IBOutlet weak var appTypeDropDownViewHeight: NSLayoutConstraint!
    @IBOutlet weak var appSectionDropDownView: DropDownViewWithSearch!
    @IBOutlet weak var actSectionDropDownViewHeight: NSLayoutConstraint!
 
    
    let createCaseDairyVM = CreateCaseDairyVM()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpNaviagtionBar()
        self.setupUI()
    }
    
    private func setUpNaviagtionBar() {
        self.navigationView.delegate = self
        self.navigationView.lblTitle.text = "Case Dairy"
    }
    
    private func setupUI() {
        self.courtNameDropDownView.isHidden = true
        self.caseStageDropDownView.isHidden = true
        self.cityDropDownView.isHidden = true
        self.appTypeDropDownView.isHidden = true
        self.appSectionDropDownView.isHidden = true
    }
    
    // MARK: ============================= Private Validation Method =============================
    private func createCaseDairyTextFieldValidation() {
        guard createCaseDairyVM.createCaseDairyValidation(registarionDate: txtRegistrationDate.text ?? "", courtName: txtCourtName.text ?? "", caseNumber: txtCaseNo.text ?? "", caseStage: txtCaseStage.text ?? "", city: txtCity.text ?? "", applicantName: txtApplicantName.text ?? "", respondentName: txtRespondentName.text ?? "", applicationType: txtApplicationType.text ?? "", applicationSection: txtApplicationSection.text ?? "", nextHearingDate: txtHearingDate.text ?? "", reasonForAbsent: txtAbsentReason.text ?? "") else {
            return
        }
        let vc = UIStoryboard(name: "CaseDairy", bundle: nil).instantiateViewController(withIdentifier: "CaseDairyListViewVC")as! CaseDairyListViewVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func showDropDown(dropDownHeight: NSLayoutConstraint, dropDownView: DropDownViewWithSearch, text: UITextField, data: [String]) {
        dropDownHeight.constant = 300
        dropDownView.tableData = data
        dropDownView.dropDownTable.reloadData()
        dropDownView.isHidden = false
        
        dropDownView.closerForbackVC = { sttr in
            text.text = dropDownView.selectedItemText
            dropDownView.isHidden = true
            
        }
    }
    
    //MARK: ============================= IBAction Methods =============================
    @IBAction func btnCourtNameDropDownAction(_ sender: UIButton) {
        self.caseStageDropDownView.isHidden = true
        self.cityDropDownView.isHidden = true
        self.appTypeDropDownView.isHidden = true
        self.appSectionDropDownView.isHidden = true
        showDropDown(dropDownHeight: courtNameDropDownViewHeight,
                     dropDownView: courtNameDropDownView,
                     text: txtCourtName, data: createCaseDairyVM.arrData)
        courtNameDropDownView.txtSearch.placeholder = "Select court name"
    }
    
    @IBAction func btnCaseStageDropDownAction(_ sender: UIButton) {
        self.courtNameDropDownView.isHidden = true
        self.cityDropDownView.isHidden = true
        self.appTypeDropDownView.isHidden = true
        self.appSectionDropDownView.isHidden = true
        showDropDown(dropDownHeight: caseStageDropDownViewHeight, 
                     dropDownView: caseStageDropDownView,
                     text: txtCaseStage, data: createCaseDairyVM.arrData)
        courtNameDropDownView.txtSearch.placeholder = "Select court name"
    }
    
    @IBAction func btnCityDropDownAction(_ sender: UIButton) {
        self.courtNameDropDownView.isHidden = true
        self.caseStageDropDownView.isHidden = true
        self.appTypeDropDownView.isHidden = true
        self.appSectionDropDownView.isHidden = true
        showDropDown(dropDownHeight: cityDropDownViewHeight,
                     dropDownView: cityDropDownView,
                     text: txtCity, data: createCaseDairyVM.arrData)
        cityDropDownView.txtSearch.placeholder = "Select city"
    }
    
    @IBAction func btnAppTypeDropDownAction(_ sender: UIButton) {
        self.courtNameDropDownView.isHidden = true
        self.caseStageDropDownView.isHidden = true
        self.cityDropDownView.isHidden = true
        self.appSectionDropDownView.isHidden = true
        showDropDown(dropDownHeight: appTypeDropDownViewHeight, 
                     dropDownView: appTypeDropDownView,
                     text: txtApplicationType, data: createCaseDairyVM.arrData)
        appTypeDropDownView.txtSearch.placeholder = "Select application type"
    }
    
    @IBAction func btnAppSectioDropDownAction(_ sender: UIButton) {
        self.courtNameDropDownView.isHidden = true
        self.caseStageDropDownView.isHidden = true
        self.cityDropDownView.isHidden = true
        self.appTypeDropDownView.isHidden = true
        showDropDown(dropDownHeight: actSectionDropDownViewHeight, 
                     dropDownView: appSectionDropDownView,
                     text: txtApplicationSection, data: createCaseDairyVM.arrData)
        appSectionDropDownView.txtSearch.placeholder = "Select application section"
    }
    
    @IBAction func btnCreateAction(_ sender: UIButton) {
        createCaseDairyTextFieldValidation()
    }
    
    @IBAction func btnResetAction(_ sender: UIButton) {
        
    }
}

//MARK: ============================= Extension NavigationBarView Delegate Methods =============================
extension CreateCaseDairyVC: NavigationBarViewDelegate {
    func navigationBackAction() {
        self.navigationController?.popViewController(animated: true)
    }
    
    func navigationNotificationAction() {
        let vc = UIStoryboard(name: "Notification", bundle: nil).instantiateViewController(withIdentifier: "NotificationVC")as!NotificationVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func navigationSearchAction() {
        let vc = UIStoryboard(name: "Search", bundle: nil).instantiateViewController(withIdentifier: "SearchVC")as! SearchVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func naviagtionProfileAction() {
        let vc = UIStoryboard(name: "Profile", bundle: nil).instantiateViewController(withIdentifier: "ProfileVC")as! ProfileVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
