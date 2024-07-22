//
//  SignUpViewController.swift
//  Vidhik
//
//  Created by NumeroEins on 12/01/24.
//

import UIKit

class SignUpViewController: UIViewController, UIDropInteractionDelegate {
    
    //MARK: =============================================== IBOutlet ===============================================
    @IBOutlet weak var phoneNoView: UIView!
    @IBOutlet weak var txtPhoneNo: UITextField!
    @IBOutlet weak var otpView: UIView!
    @IBOutlet weak var txtOTP: UITextField!
    @IBOutlet weak var btnResendOTP: UIButton!
    @IBOutlet weak var lblTermsAndServices: UILabel!
    @IBOutlet weak var btnNextAndContinue: UIButton!
    @IBOutlet weak var btnSignIn: UIButton!
    
    let signUpVM = SignUpVM()
    
    // MARK: =============================================== ViewController Life Cycle ===============================================
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUI()
        self.setTermsAndServicesAction()
    }
    
    private func setTermsAndServicesAction() {
        self.lblTermsAndServices.text = "By proceeding you agree to our Terms of Services and Privacy Policy"
        self.lblTermsAndServices.font = UIFont(name: "Poppins-Regular", size: 10)
        let attributedString = NSMutableAttributedString(string: "By proceeding you agree to our Terms of Services and Privacy Policy")
        
        // Define ranges for word1 and word2
        let rangeWord1 = (attributedString.string as NSString).range(of: " Terms of Services")
        let rangeWord2 = (attributedString.string as NSString).range(of: "Privacy Policy")
        
        // Apply attributes to word1
        attributedString.addAttribute(.underlineStyle, value: NSUnderlineStyle.single.rawValue, range: rangeWord1)
        attributedString.addAttribute(.foregroundColor, value: UIColor.solidBlue, range: rangeWord1)
        
        // Apply attributes to word2
        attributedString.addAttribute(.underlineStyle, value: NSUnderlineStyle.single.rawValue, range: rangeWord2)
        attributedString.addAttribute(.foregroundColor, value: UIColor.solidBlue, range: rangeWord2)
        
        // Assign the attributed string to the label
        lblTermsAndServices.attributedText = attributedString
        
        // Enable user interaction on the label
        lblTermsAndServices.isUserInteractionEnabled = true
        
        // Add tap gesture recognizer
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
        lblTermsAndServices.addGestureRecognizer(tapGesture)
    }
    
    
    
    @objc func handleTap(_ gestureRecognizer: UITapGestureRecognizer) {
        guard let text = lblTermsAndServices.attributedText else { return }
        
        let layoutManager = NSLayoutManager()
        let textContainer = NSTextContainer(size: .zero)
        let textStorage = NSTextStorage(attributedString: text)
        
        layoutManager.addTextContainer(textContainer)
        textStorage.addLayoutManager(layoutManager)
        
        let touchLocation = gestureRecognizer.location(in: lblTermsAndServices)
        let index = layoutManager.characterIndex(for: touchLocation, in: textContainer, fractionOfDistanceBetweenInsertionPoints: nil)
        
        // Define ranges for word1 and word2
        let rangeWord1 = (text.string as NSString).range(of: " Terms of Services")
        let rangeWord2 = (text.string as NSString).range(of: "Privacy Policy")
        
        if NSLocationInRange(index, rangeWord1) {
            print("Touched on word1")
            let termsAndConditionVC = UIStoryboard(name: "Main", bundle: nil) .instantiateViewController(identifier: "TermsAndConditionsVC") as! TermsAndConditionsVC
            termsAndConditionVC.modalPresentationStyle = .overCurrentContext
            self.navigationController?.present(termsAndConditionVC, animated: false)
        }
        else if NSLocationInRange(index, rangeWord2) {
            print("Touched on word2")
            let privacyPolicyVC = UIStoryboard(name: "Main", bundle: nil) .instantiateViewController(identifier: "PrivacyPolicyVC") as! PrivacyPolicyVC
            privacyPolicyVC.modalPresentationStyle = .overCurrentContext
            self.navigationController?.present(privacyPolicyVC, animated: false)
        }
    }
    
    
    private func setUI() {
        self.otpView.isHidden = true
        self.btnNextAndContinue.layer.cornerRadius = 12.0
        self.btnSignIn.layer.borderWidth = 1
        self.btnSignIn.layer.borderColor = UIColor(red: 53/255, green: 95/255, blue: 246/255, alpha: 1).cgColor
        self.btnSignIn.layer.cornerRadius = 12.0
        
        let att = NSMutableAttributedString(string: "Already registered? Sign in")
        att.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor(red: 53/255, green: 95/255, blue: 246/255, alpha: 1), range: NSRange(location: 20, length: 7))
        btnSignIn.setAttributedTitle(att, for: .normal)
    }
    
    // MARK: =========================================== Send OTP Mutation Call Method ===============================================
    private func sendOTPMutationCall() {
        Loader.show()
        signUpVM.sendOtpByPhoneNumber(phoneNumber: txtPhoneNo.text ?? "") { [weak self] sucess, message in
            Loader.hide()
            switch sucess {
            case .success:
                AlertView.show(title: "", message: message, okTitle: "Ok", cancelTitle: "") { [weak self] (index) in
                    if index == 1 {
                        self?.otpView.isHidden = false
                        self?.btnNextAndContinue.setTitle("Continue", for: .normal)
                    }
                }
            default:
                AlertView.show(title: "", message: message)
            }
        }
    }
    
    // MARK: =============================================== OTP Verify Query Calling Method ===============================================
    private func verifyOTPQueryCall(){
        
        Loader.show()
        
        signUpVM.verifyOtpByPhoneNumber(phoneNumber: txtPhoneNo.text ?? "", otp: txtOTP.text ?? "") { [weak self] status, message in
            Loader.hide()
            switch status {
            case .success:
                AlertView.show(title: "", message: message, okTitle: "Ok", cancelTitle: "") { [weak self] (index) in
                    if index == 1 {
                        let createAccountVC = self?.storyboard?.instantiateViewController(identifier: "CreateAccountController") as! CreateAccountController
                        createAccountVC.createAccountVM.signupPhoneNumber =  self?.txtPhoneNo.text
                        self?.navigationController?.pushViewController(createAccountVC, animated: true)
                    }
                }
            default:
                AlertView.show(title: "", message: message)
                
            }
        }
    }
    
    
    // MARK: =============================================== Private Validation Method ===============================================
    private func isPhoneNumberValidation() {
        guard signUpVM.isTextFieldValidation(phoneNumber: txtPhoneNo.text ?? "") else { return }
        if btnNextAndContinue.titleLabel?.text == "Continue" {
            guard signUpVM.otpNumberValidation(otpNumber: txtOTP.text ?? "") else { return }
            verifyOTPQueryCall()
        } else {
            sendOTPMutationCall()
        }
    }
    
    //MARK: =============================================== IBAction ===============================================
    @IBAction func btnResendOtpAction(_ sender: UIButton) {
        txtOTP.text = ""
        sendOTPMutationCall()
    }
    
    @IBAction func btnNextAndContinueAction(_ sender: UIButton) {
        isPhoneNumberValidation()
    }
    
    @IBAction func btnSignInAction(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
}

// MARK: =============================================== UITextField Delegate Methods ===============================================
extension SignUpViewController: UITextFieldDelegate {
    private func textFieldRangeAndCharCount(_ string: String, _ textField: UITextField, _ textCount: Int) -> Bool {
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
        if textField == txtPhoneNo {
            return textFieldRangeAndCharCount(string, textField, 10)
        } else if textField == txtOTP {
            return textFieldRangeAndCharCount(string, textField, 6)
        }
        return true
    }
}
