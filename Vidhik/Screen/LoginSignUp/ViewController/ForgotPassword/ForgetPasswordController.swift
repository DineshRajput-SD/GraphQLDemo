//
//  ForgetPasswordController.swift
//  Vidhik
//
//  Created by NumeroEins on 15/01/24.
//


import UIKit

class ForgetPasswordController: UIViewController {

    // MARK:  =============================================== IBOutlets Properties ===============================================
    @IBOutlet weak var btnUsingPhoneNo: UIButton!
    @IBOutlet weak var btnUsingEmail: UIButton!
    @IBOutlet weak var lblPhoneLine: UILabel!
    @IBOutlet weak var lblEmailLine: UILabel!
    @IBOutlet weak var imgPhoneAndEmail: UIImageView!
    @IBOutlet weak var phoneNoView: CustomView!
    @IBOutlet weak var txtPhoneNoAndEmail: UITextField!
    @IBOutlet weak var otpView: CustomView!
    @IBOutlet weak var txtOTP: UITextField!
    @IBOutlet weak var btnResendOTP: UIButton!
    @IBOutlet weak var secruityQueView: CustomView!
    @IBOutlet weak var txtsecurityQue: UITextField!
    @IBOutlet weak var btnSelectSecurityQue: UIButton!
    @IBOutlet weak var ansView: CustomView!
    @IBOutlet weak var txtAnswer: UITextField!
    @IBOutlet weak var btnContinueAndVerify: UIButton!
    @IBOutlet weak var securityDropDownView: CustomDropDownView!
    @IBOutlet weak var securityDropDownViewHeight: NSLayoutConstraint!
    
    let checkUserType = ApplicationPreference.getcheckUserType()
    let forgotPasswordVM = ForgotPasswordVM()
    let userType = UserSelectionType.lawyer
    var strUserType = ""
    
    var arrData = ["What is your last name", "What is your pet name", "what is your favroit food", "What is your favourite place", "What is your favourite movie?", "What is your memorable date?", "What is your favourite cricket team?", "What is the make and model of your first car?"]
    
    // MARK: =============================================== View Controller Life Cycle ===============================================
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setSecurityQuestion()
        self.otpView.isHidden = true
        setUILoginSelection(isLoginType: .phoneMumber)
        self.strUserType = objAppShareData.strUserType
    }
        
// MARK: =============================================== Private Method SetUI Login Selection Type ===============================================
    private func setUILoginSelection(isLoginType: LoginType) {
        self.lblPhoneLine.isHidden = isLoginType == .phoneMumber ? false : true
        self.lblEmailLine.isHidden = isLoginType == .phoneMumber ? true : false
        self.txtPhoneNoAndEmail.keyboardType = isLoginType == .phoneMumber ? .numberPad : .emailAddress
        self.txtPhoneNoAndEmail.placeholder = isLoginType == .phoneMumber ? "Enter phone number" : "Enter email address"
        self.imgPhoneAndEmail.image = isLoginType == .phoneMumber ? UIImage(named: "phoneIcon") : UIImage(named: "mailIcon")
        self.btnUsingPhoneNo.setTitleColor(isLoginType == .phoneMumber ? .black : .gray, for: .normal)
        self.btnUsingEmail.setTitleColor(isLoginType == .phoneMumber ? .gray : .black, for: .normal)
        txtPhoneNoAndEmail.reloadInputViews()
    }
    
    // MARK: =============================================== Private Method Set Security Quetion ===============================================
    private func setSecurityQuestion() {
        self.securityDropDownView.isHidden = true//= checkUserType == "User" ? true : false
        self.secruityQueView.isHidden = checkUserType == "USER" ? true : false
        self.ansView.isHidden = checkUserType == "USER" ? true : false
    }
    
    // MARK: ================================ Private Method Forgot Apssword APi Calling According Login Type ===============================================
   
    private func iSLoginTypeApiCalling() {
        switch  forgotPasswordVM.loginType {
       
        case .phoneMumber:
            forgotPasswordOnPhoneNumber()
        
        case .email:
            forgotPasswordOnEmail()
        }
    }

    // MARK: =============================================== Private Method Forgot Password Api Call ===============================================
    private func isTextFieldValidation() {
        guard forgotPasswordVM.isForgotPasswordTextFieldValidation(phoneNumberAndEmail: txtPhoneNoAndEmail.text!) else { return }
        
        if checkUserType == "USER" {
            if btnContinueAndVerify.titleLabel?.text == "Verify" {
                guard forgotPasswordVM.otpTextFieldValidation(otpNumber: txtOTP.text!) else { return }
                switch forgotPasswordVM.loginType {
                case .phoneMumber:
                    verifyOtpOnPhone()
                case .email:
                    verifyOtpEmail()
                }
            } else {
                iSLoginTypeApiCalling()
            }
        } else {
            if btnContinueAndVerify.titleLabel?.text == "Verify" {
                guard forgotPasswordVM.otpTextFieldValidation(otpNumber: txtOTP.text!) else { return }
                guard forgotPasswordVM.lawyerQuestionValidation(question: txtsecurityQue.text ?? "", answer: txtAnswer.text ?? "") else { return }
                guard forgotPasswordVM.otpTextFieldValidation(otpNumber: txtOTP.text!) else { return }
                switch forgotPasswordVM.loginType {
                case .phoneMumber:
                    verifyOtpOnPhone()
                case .email:
                    verifyOtpEmail()
                }
            } else {
                iSLoginTypeApiCalling()
            }
        }
    }
    
 
    // MARK: ======================================= Private Method Forgot Password Api On Phone Number ===========================================
    private func forgotPasswordOnPhoneNumber() {
       
        Loader.show()
       
        forgotPasswordVM.forgotPasswordPhoneNumberAPI(phoneNumber: txtPhoneNoAndEmail.text ?? "", userType: strUserType.uppercased()) { [weak self] response, message in
          
            Loader.hide()
            
            switch response {
           
            case .success:
                
                AlertView.show(title: "", message: message, okTitle: "Ok", cancelTitle: "") { [weak self] index in
                   
                    if index == 1 {
                        self?.otpView.isHidden = false
                        self?.btnContinueAndVerify.setTitle("Verify", for: .normal)
                    }
                }
           
            case .failure:
                AlertView.show(title: "", message: message)
                
            default:
                break
            }
            
        }
    }
    
    // MARK: ============================================ Private Method Forgot Password Api On Email ==========================================
    private func forgotPasswordOnEmail() {
        Loader.show()
        
        forgotPasswordVM.forgotPasswordEmailAPI(email: txtPhoneNoAndEmail.text ?? "", userType: strUserType.uppercased()) { [weak self] response, message in
          
            Loader.hide()
            
            switch response {
           
            case .success:
                
                AlertView.show(title: "", message: message, okTitle: "Ok", cancelTitle: "") { [weak self] index in
                    
                    if index == 1 {
                        self?.otpView.isHidden = false
                        self?.btnContinueAndVerify.setTitle("Verify", for: .normal)
                    }
                }
            case .failure:
                AlertView.show(title: "", message: message)
                
            default:
                break
            }
            
        }
    }
    
    // MARK: ========================================= Private Method Verify Otp On Phone ============================================
    private func verifyOtpOnPhone() {
        Loader.show()
       
        forgotPasswordVM.forgotPasswordVerifyOtpOnPhoneNumber(phoneNumber: txtPhoneNoAndEmail.text ?? "", otp: txtOTP.text ?? "", userType: strUserType.uppercased()) { [weak self] response, message in
            
            Loader.hide()
            
            switch response {
           
            case .success:
               
                AlertView.show(title: "", message: message, okTitle: "Ok", cancelTitle: "") { [weak self] index in
                    if index == 1 {
                        self?.forgotPasswordVM.isphoneNumberSelected = true
                        let newPasswordVC = self?.storyboard?.instantiateViewController(withIdentifier: "SetNewPasswordController") as! SetNewPasswordController
                        newPasswordVC.setNewPasswordVM.signUpPhoneNumberAndEmail = self?.txtPhoneNoAndEmail.text ?? ""
                        newPasswordVC.setNewPasswordVM.isLoginType = self?.forgotPasswordVM.loginType.rawValue
                        self?.navigationController?.pushViewController(newPasswordVC, animated: true)
                    }
                }
           
            case .failure:
                AlertView.show(title: "", message: message)
                
            default:
                break
            }
        }
    }
    
    // MARK: ============================================= Private Method On Verify Otp On Email ===============================================
    private func verifyOtpEmail() {
        
        Loader.show()
        
        forgotPasswordVM.forgotPasswordVerifyOtpOnEmail(email: txtPhoneNoAndEmail.text ?? "", otp: txtOTP.text ?? "", userType: strUserType.uppercased()) { [weak self] response, message in
           
            Loader.hide()
            
            switch response {
           
            case .success:
                AlertView.show(title: "", message: message, okTitle: "Ok", cancelTitle: "") { [weak self] index in
                    if index == 1 {
                        self?.forgotPasswordVM.isphoneNumberSelected = true
                        let newPasswordVC = self?.storyboard?.instantiateViewController(withIdentifier: "SetNewPasswordController") as! SetNewPasswordController
                        newPasswordVC.setNewPasswordVM.signUpPhoneNumberAndEmail = self?.txtPhoneNoAndEmail.text ?? ""
                        newPasswordVC.setNewPasswordVM.isLoginType = self?.forgotPasswordVM.loginType.rawValue
                        self?.navigationController?.pushViewController(newPasswordVC, animated: true)
                    }
                }
            case .failure:
                AlertView.show(title: "", message: message)
                
            default:
                break
            }
        }
    }
    
    // MARK: =============================== Private Method isOtpViewShowHide On PhoneNumber and Email Button Click ================================
    private func isOtpViewShowHide() {
        if forgotPasswordVM.isphoneNumberSelected {
            otpView.isHidden = false
            self.btnContinueAndVerify.setTitle("Verify", for: .normal)
        } else {
            txtPhoneNoAndEmail.text = ""
            txtOTP.text = ""
            otpView.isHidden = true
            self.btnContinueAndVerify.setTitle("Continue", for: .normal)
        }
    }

    //MARK: =============================== IBActions Methods =============================== 
    @IBAction func btnPhoneNoAction(_ sender: UIButton) {
        forgotPasswordVM.loginType = .phoneMumber
        setUILoginSelection(isLoginType: .phoneMumber)
        isOtpViewShowHide()
    }
    
    @IBAction func btnEmailAction(_ sender: UIButton) {
        isOtpViewShowHide()
        forgotPasswordVM.loginType = .email
        setUILoginSelection(isLoginType: .email)
    }
    
    @IBAction func btnResendOTPAction(_ sender: UIButton) {
        
        switch forgotPasswordVM.loginType {
        
        case .phoneMumber:
            forgotPasswordOnPhoneNumber()
        
        case .email:
            forgotPasswordOnEmail()
        }
    }
    
    @IBAction func btnSelectSecurityQueAction(_ sender: UIButton) {
        securityDropDownViewHeight.constant = 300
        securityDropDownView.tableData = arrData
        securityDropDownView.dropDownTable.reloadData()
        securityDropDownView.isHidden = false
        
        self.securityDropDownView.closerForbackVC = { sttr in
            self.txtsecurityQue.text = self.securityDropDownView.selectedItemText
            self.securityDropDownView.isHidden = true
            
        }
    }
    
    @IBAction func btnBackAction(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func btnContinueAndVerifyAction(_ sender: UIButton) {
        isTextFieldValidation()
    }
}

// MARK: =============================================== UITextField Delegate Methods ===============================================
extension ForgetPasswordController: UITextFieldDelegate {
    
    private func rangeAndTextCount(_ string: String, _ textField: UITextField, _ textCount: Int) -> Bool {
        let range = string.rangeOfCharacter(from: .whitespaces)
        let tfTextCount = textField.text?.count ?? 0
        if tfTextCount == 0 && (range != nil) {
            return false
        } else {
            let totalTextCount = string.isEmpty ? tfTextCount : tfTextCount + 1
            return totalTextCount <= textCount
        }
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        if textField == txtPhoneNoAndEmail {
            
            switch forgotPasswordVM.loginType  {
                
            case .phoneMumber:
                return rangeAndTextCount(string, textField, 10)
            case .email:
                return rangeAndTextCount(string, textField, 50)
            }
            
        } else if textField == txtOTP {
            return rangeAndTextCount(string, textField, 6)
        }
        return true
    }
}
