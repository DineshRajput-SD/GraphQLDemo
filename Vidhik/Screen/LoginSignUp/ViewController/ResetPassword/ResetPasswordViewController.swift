//
//  ResetPasswordViewController.swift
//  Vidhik
//
//  Created by NumeroEins on 05/02/24.
//

import UIKit

class ResetPasswordViewController: UIViewController {
    
    //MARK: =============================================== IBoutlet Proerties ===============================================
    @IBOutlet weak var txtOldPassword: UITextField!
    @IBOutlet weak var txtNewPassword: UITextField!
    @IBOutlet weak var txtConfirmPassword: UITextField!
    @IBOutlet weak var btnShowHideOldPassword: UIButton!
    @IBOutlet weak var btnShowHideNewPassword: UIButton!
    @IBOutlet weak var btnShowHideConfirmPassword: UIButton!
    @IBOutlet weak var txtSecurityQuestion: UITextField!
    @IBOutlet weak var btnSelectQuestion: UIButton!
    @IBOutlet weak var txtAnswer: UITextField!
    
    @IBOutlet weak var sequrityQuestionTitleLabel: UILabel!
    @IBOutlet weak var sequrityQuestionView: CustomView!
    @IBOutlet weak var answerView: CustomView!
    
    @IBOutlet weak var securityDropDownView: CustomDropDownView!
    @IBOutlet weak var securityDropDownViewHeight: NSLayoutConstraint!
    
    var iconClick = true
    let resetPasswordVM = ResetPasswordVM()
    let checkUserType = ApplicationPreference.getcheckUserType()
    var arrData = ["What is your last name", "What is your pet name", "what is your favroit food", "What is your favourite place"]
    
    // MARK: =============================================== View Controller Life Cycle Method ===============================================
    override func viewDidLoad() {
        super.viewDidLoad()
        txtOldPassword.isSecureTextEntry = true
        txtNewPassword.isSecureTextEntry = true
        txtConfirmPassword.isSecureTextEntry = true
        setupUI()
        self.securityDropDownView.isHidden = true
    }
    
    private func hideShowPassword(password: UITextField, showAndHide: UIButton) {
        password.isSecureTextEntry = iconClick == true ? false : true
        showAndHide.setImage(iconClick == true ? UIImage(named: "showPasswordIcon") : UIImage(named: "hidePasswordIcon"), for: .normal)
        iconClick = !iconClick
    }
    
    // MARK: =============================================== Setup UI Private Method ===============================================
    private func setupUI() {
        sequrityQuestionTitleLabel.isHidden = checkUserType == "User" ? true : false
        sequrityQuestionView.isHidden = checkUserType == "User" ? true : false
        answerView.isHidden = checkUserType == "User" ? true : false
    }
    
    // MARK: =============================================== ResetPassword Api Call ===============================================
    private func resetPasswordApiCall() {
        if checkUserType == "User" {
            guard resetPasswordVM.isResetPasswordTextFieldValidation(oldPassword: txtOldPassword.text!, newPassword: txtNewPassword.text!, confirmPassword: txtConfirmPassword.text!) else { return }
            navigationController?.popViewController(animated: true)
        } else {
            guard resetPasswordVM.isResetPasswordTextFieldValidation(oldPassword: txtOldPassword.text!, newPassword: txtNewPassword.text!, confirmPassword: txtConfirmPassword.text!) else { return }
            txtSecurityQuestion.text = "Test"
            guard resetPasswordVM.lawyerSequrityQuestion(question: txtSecurityQuestion.text ?? "", answer: txtAnswer.text ?? "") else { return }
            navigationController?.popViewController(animated: true)
        }
    }
    
    //MARK: =============================================== IBAction Methods ===============================================
    @IBAction func btnShowHideOldPasswordAction(_ sender: UIButton) {
        self.hideShowPassword(password: txtOldPassword, showAndHide: btnShowHideOldPassword)
    }
    
    @IBAction func btnShowHideNewPasswordAction(_ sender: UIButton) {
        self.hideShowPassword(password: txtNewPassword, showAndHide: btnShowHideNewPassword)
    }
    
    @IBAction func btnShowHideConfirmPasswordAction(_ sender: UIButton) {
        self.hideShowPassword(password: txtConfirmPassword, showAndHide: btnShowHideConfirmPassword)
    }
    
    @IBAction func btnSelectQuestionAction(_ sender: UIButton) {
        securityDropDownViewHeight.constant = 300
        securityDropDownView.tableData = arrData
        securityDropDownView.dropDownTable.reloadData()
        securityDropDownView.isHidden = false
        
        self.securityDropDownView.closerForbackVC = { sttr in
            self.txtSecurityQuestion.text = self.securityDropDownView.selectedItemText
            self.securityDropDownView.isHidden = true
        }
    }
    
    @IBAction func btnResetPasswordAction(_ sender: UIButton) {
        resetPasswordApiCall()
    }
    
    @IBAction func btnBackAction(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
}
