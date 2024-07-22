//
//  EditProfileVC.swift
//  Vidhik
//
//  Created by NumeroEins on 25/01/24.
//

import UIKit

class EditProfileVC: UIViewController {
    
    //MARK: ================= IBOutlet Properties =================
    @IBOutlet weak var navigationView: NavigationBarView!
    @IBOutlet weak  var coreComtencyView: UIView!
    @IBOutlet weak var coreComtencyViewHeight: NSLayoutConstraint!
    @IBOutlet weak var txtCoreComtency: UITextView!
    @IBOutlet weak var txtMobileNo: UITextField!
    @IBOutlet weak var btnSendMobileOTP: UIButton!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var btnSendEmailOTP: UIButton!
    @IBOutlet weak var btnSave: UIButton!
    
    var emailVerifyPopUp: EmailVerificationPopUp?
    let editProfileVM = EditProfileVM()
    
    // MARK: ================= View Controller Life Cycle Method =================
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpUI()
        self.setUpNaviagtionBar()
    }
    
    private func setUpUI() {
        if txtCoreComtency.contentSize.height > coreComtencyView.frame.height {
            self.coreComtencyViewHeight.constant = 100
        }
    }
    
    private func setUpNaviagtionBar() {
        self.navigationView.delegate = self
        self.navigationView.lblTitle.text = "Edit profile"
    }
    
    // MARK: ================= Private Profile TextField Validation Method =================
    private func editProfileValidation() {
        guard editProfileVM.lawyerEditProfileTextFiledValidation(comptency: txtCoreComtency.text ?? "", phoneNumber: txtMobileNo.text ?? "", email: txtEmail.text ?? "") else { return }
        navigationController?.popViewController(animated: true)
    }
    
    //MARK: ================= IBAction Methods =================
    @IBAction func btnMobileOTPAction(_ sender: UIButton) {
        self.emailVerifyPopUp = EmailVerificationPopUp(frame: self.view.frame)
        emailVerifyPopUp?.callbackForResendOtp = {
            
        }
        emailVerifyPopUp?.emailVerifyPopUp.isHidden = false
        emailVerifyPopUp?.accountResgistrationPopup.isHidden = true
        emailVerifyPopUp?.isfrom = "1"
        self.view.addSubview(emailVerifyPopUp ?? UIView())
    }
    
    @IBAction func btnEmailOTP(_ sender: UIButton) {
        self.emailVerifyPopUp = EmailVerificationPopUp(frame: self.view.frame)
        emailVerifyPopUp?.callbackForResendOtp = {
            
        }
        emailVerifyPopUp?.emailVerifyPopUp.isHidden = false
        emailVerifyPopUp?.accountResgistrationPopup.isHidden = true
        emailVerifyPopUp?.isfrom = "2"
        self.view.addSubview(emailVerifyPopUp ?? UIView())
    }
    
    @IBAction func btnSaveAction(_ sender: UIButton) {
        editProfileValidation()
    }
    
    @IBAction func btnCancelAction(_ sender: UIButton) {
        print("Cancel ==>>>" )
        dismiss(animated: false)
    }
}

// MARK: ================= NavigationBarView Delegate Methods =================
extension EditProfileVC: NavigationBarViewDelegate {
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

// MARK: ================= UITextField Delegate Methods =================
extension EditProfileVC: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let tfTextCount = textField.text?.count ?? 0
        let totalTextCount = string.isEmpty ? tfTextCount : tfTextCount + 1
        return totalTextCount <= 10
    }
}

// MARK: ================= UITextView Delegate Methods =================
extension EditProfileVC: UITextViewDelegate {
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        let newText = (textView.text as NSString).replacingCharacters(in: range, with: text)
        let numberOfChars = newText.count
        return numberOfChars < 200    // 220 Limit Value
    }
}
