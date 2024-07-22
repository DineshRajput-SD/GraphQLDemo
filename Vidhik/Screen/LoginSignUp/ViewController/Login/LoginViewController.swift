//
//  LoginViewController.swift
//  Vidhik
//
//  Created by NumeroEins on 11/01/24.
//

import UIKit
import DropDown
import AVFoundation

class LoginViewController: UIViewController {
    //MARK:  =============================================== IBOutlet ===============================================
    @IBOutlet weak var videoView: UIView!
    @IBOutlet weak var lblWelcome: UILabel!
    @IBOutlet weak var lblSignInMessage: UILabel!
    @IBOutlet weak var txtUserType: UITextField!
    @IBOutlet weak var btnUsingPhoneNo: UIButton!
    @IBOutlet weak var btnUsingEmail: UIButton!
    @IBOutlet weak var lblPhoneLine: UILabel!
    @IBOutlet weak var lblEmailLine: UILabel!
    @IBOutlet weak var imgPhoneAndEmail: UIImageView!
    @IBOutlet weak var phoneNoView: UIView!
    @IBOutlet weak var txtPhoneNoAndEmail: UITextField!
    @IBOutlet weak var passwordView: UIView!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var btnForgetPassword: UIButton!
    @IBOutlet weak var btnHideShowPassword: UIButton!
    @IBOutlet weak var btnSignIn: UIButton!
    @IBOutlet weak var btnSignUp: UIButton!
    
    //MARK:  =============================================== Instance Properties ===============================================
    var iconClick = true
    var looper: AVPlayerLooper?
    var signUpDisclaimerCheck =  true
    var createAccount: CreateAccountController?
    let dropDown = DropDown()
    var arrUserType = ["User","Lawyer","Judge","Seller"]
    var signupDisclaimer: SignUpDisclaimerView?
    var cellToShowIndexPath: IndexPath?
    var checkUserType = ApplicationPreference.getcheckUserType()
    let loginVM = LoginVM()
    
    // MARK: =============================================== View Controller Life Cycle Methods ===============================================
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUI()
        setUILoginSelection(isLoginType: .phoneMumber)
        txtUserType.text = checkUserType
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.playVideo(url: "https://static.pexels.com/lib/videos/free-videos.mp4", view: self.videoView)
        self.txtUserType.text = self.checkUserType
        self.lblWelcome.text = objAppShareData.isFromDoneSignUp == true ?  "Welcome Back !" : "Welcome!"
     }
    
    // MARK: =================================== Private Method PlayViedo Advtesment ===========================================
   private func playVideo(url: String, view: UIView) {
        let videoURL = URL(string: url)
        let playerAV = AVQueuePlayer()
        looper = AVPlayerLooper(player: playerAV, templateItem: AVPlayerItem(asset: AVAsset(url: videoURL!)))
        let playerLayer = AVPlayerLayer(player: playerAV)
        playerLayer.frame = view.bounds
        playerLayer.videoGravity = .resizeAspectFill
        view.contentMode = .scaleToFill
        view.layer.addSublayer(playerLayer)
        playerAV.play()
    }
 
    // MARK: =================================== Private Method SetUI Login Selection Type ===========================================
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
    
   private func setUI() {
        if let title = btnForgetPassword.titleLabel!.text, title != "" {
            let attributeString = NSMutableAttributedString(string: title)
            attributeString.addAttribute(NSAttributedString.Key.underlineStyle, value: 1, range: NSMakeRange(0, title.count))
            btnForgetPassword.titleLabel?.attributedText = attributeString
        }
        
        self.btnSignIn.layer.cornerRadius = 12.0
        self.btnSignUp.layer.borderWidth = 1
        self.btnSignUp.layer.borderColor = UIColor(red: 53/255, green: 95/255, blue: 246/255, alpha: 1).cgColor
        self.btnSignUp.layer.cornerRadius = 12.0
        let att = NSMutableAttributedString(string: "Don’t have an account? Sign up")
        att.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor(red: 53/255, green: 95/255, blue: 246/255, alpha: 1), range: NSRange(location: 23, length: 7))
        btnSignUp.setAttributedTitle(att, for: .normal)
    }
    
    // MARK: =============================================== Private Method Login API Calling ===============================================
    private func loginAPICalling() {
        Loader.show()
        loginVM.loginPhoneNumberApi(phoneNumber: txtPhoneNoAndEmail.text ?? "", password: txtPassword.text ?? "", userType: self.txtUserType.text?.uppercased() ?? "") { [weak self] status, message in
            Loader.hide()
            switch status {
            case .success:
                AlertView.show(title: "", message: message, okTitle: "Ok", cancelTitle: "") { [weak self] (index) in
                    if index == 1 {
                        self?.setLoginRoot()
                    }
                }
            default:
                AlertView.show(title: "", message: message)
            }
        }
    }
    
    // MARK: =============================================== Private Method Login API Calling ===============================================
    private func loginEmailAPICalling() {
        Loader.show()
        loginVM.loginEmailIDApi(email: txtPhoneNoAndEmail.text ?? "", password: txtPassword.text ?? "", userType: self.txtUserType.text?.uppercased() ?? "") { [weak self] status, message in
            Loader.hide()
            switch status {
            case .success:
                AlertView.show(title: "", message: message, okTitle: "Ok", cancelTitle: "") { [weak self] (index) in
                    if index == 1 {
                        self?.setLoginRoot()
                    }
                }
            default:
                AlertView.show(title: "", message: message)
            }
        }
    }
    
    // MARK: =============================================== Private Method TextField Validation ===============================================
    private func userLoginAPI() {
        switch loginVM.loginType {
        case .email:
            guard loginVM.isValidLoginTextField(email: txtPhoneNoAndEmail.text!, password: txtPassword.text!) else { return }
            loginEmailAPICalling()
            
        case .phoneMumber:
            guard loginVM.isValidLoginTextField(email: txtPhoneNoAndEmail.text!, password: txtPassword.text!) else { return }
            loginAPICalling()
        }
    }
    
    private func checkValidationLoginTextFields() {
        if checkUserType == "User" {
            userLoginAPI()
        } else if checkUserType == "Lawyer" {
            userLoginAPI()
        } else {
            setLoginRoot()
        }
    }
    
   
    // MARK: =============================================== Private Method SetupLogin Root Method ===============================================
    private func setLoginRoot() {
        ApplicationPreference.saveIsLoggedInUser(isLoggedIn: true)
        if !showOnBoarding {
            ObjAppdelegate.setOnBoarding()
        } else {
            if checkUserType == "User" {
                
                if lblWelcome.text == "Welcome Back !" {
                    //            let createAccountVC = self.storyboard?.instantiateViewController(identifier: "CreateAccountController") as! CreateAccountController
                    //            createAccountVC.completeProfile = false
                    //            self.navigationController?.pushViewController(createAccountVC, animated: true)
                    //                let disclaimerVC = self.storyboard?.instantiateViewController(identifier: "OnBoardingVC") as! OnBoardingVC
                    //                navigationController?.pushViewController(disclaimerVC, animated: true)
                    ObjAppdelegate.setRootViewController()
                } else {
                    ObjAppdelegate.setRootViewController()
                }
            } else if checkUserType == "Lawyer" {
                
                if lblWelcome.text == "Welcome Back !" {
                    let disclaimerVC = self.storyboard?.instantiateViewController(identifier: "OnBoardingVC") as! OnBoardingVC
                    navigationController?.pushViewController(disclaimerVC, animated: true)
                    
                } else {
                    ObjAppdelegate.setRootViewController()
                }
                
            } else if checkUserType == "Judge"{
                if lblWelcome.text == "Welcome Back !" {
                    
                } else {
                    ObjAppdelegate.setRootViewController()
                }
            }
        }
    }
    
    private func signupDisclaimerPopupView() {
        self.signupDisclaimer = SignUpDisclaimerView(frame: self.view.frame, inview: self)
        signupDisclaimer?.btnAccept.addTarget(self, action: #selector(acceptButtonAction), for: .touchUpInside)
        signupDisclaimer?.btnTermsAndCond.addTarget(self, action: #selector(btnTermsAndCondAction), for: .touchUpInside)
        signupDisclaimer?.btnPrivacyPolicy.addTarget(self, action: #selector(btnPrivacyPolicyAction), for: .touchUpInside)
        signupDisclaimer?.btnCookiesPolicy.addTarget(self, action: #selector(btnCookiesPolicyAction), for: .touchUpInside)
        signupDisclaimer?.btnCopyrights.addTarget(self, action: #selector(btnCopyRightsAction), for: .touchUpInside)
        signupDisclaimer?.btnTrustAndSafety.addTarget(self, action: #selector(btnTrustAndSafetyAction), for: .touchUpInside)
        signupDisclaimer?.btnCommunity.addTarget(self, action: #selector(btnCommunityStandardsAction), for: .touchUpInside)
        signupDisclaimer?.btnCheckBox.addTarget(self, action: #selector(disclaimercheckBox), for: .touchUpInside)
        signupDisclaimer?.closerForcancelView = { str in
            self.signupDisclaimer?.removeFromSuperview()
        }
        self.view.addSubview(signupDisclaimer ?? UIView())
    }
    
    //MARK: =============================================== IBAction ===============================================
    @IBAction func btnPhoneNoAction(_ sender: UIButton) {
        loginVM.loginType = .phoneMumber
        txtPhoneNoAndEmail.text = ""
        txtPassword.text = ""
        setUILoginSelection(isLoginType: .phoneMumber)
    }
    
    @IBAction func btnEmailAction(_ sender: UIButton) {
        loginVM.loginType = .email
        txtPhoneNoAndEmail.text = ""
        txtPassword.text = ""
        setUILoginSelection(isLoginType: .email)
    }
    
    @IBAction func btnSelctUserType(_ sender: UIButton) {
        
        self.dropDown.dataSource = self.arrUserType
        dropDown.direction = .bottom
        dropDown.anchorView =  self.phoneNoView   // Replace with the actual button or view you want to anchor to
        dropDown.show()
        
        dropDown.backgroundColor = UIColor.white
        dropDown.cornerRadius = 10
        dropDown.shadowOpacity = 0.2
        dropDown.textFont = UIFont(name: "Poppins-Regular", size: 14)!
        // Set the dropdown direction
        // Set a selection action (optional)
        dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
            print("Selected item: \(item) at index \(index)")
            self.txtUserType.text = item
            ApplicationPreference.savecheckUserType(saveStatus: item)
            self.checkUserType = item
            print("item:::::\(item)")
        }
        
    }
    
    @IBAction func btnShowHidePasswordAction(_ sender: UIButton) {
        txtPassword.isSecureTextEntry = iconClick == true ? false : true
        self.btnHideShowPassword.setImage(iconClick == true ? UIImage(named: "showPasswordIcon") : UIImage(named: "hidePasswordIcon"), for: .normal)
        iconClick = !iconClick
    }
    
    @IBAction func btnForgetPasswordAction(_ sender: UIButton) {
        if checkUserType == "User" || checkUserType == "Lawyer"  {
            let forgetPasswordVC = self.storyboard?.instantiateViewController(identifier: "ForgetPasswordController") as! ForgetPasswordController
            objAppShareData.strUserType = (self.txtUserType.text ?? "").uppercased()
            self.navigationController?.pushViewController(forgetPasswordVC, animated: true)
        } else {
            objAppShareData.showAlert(message: "Under development", controller: self)
        }
    }
    
    
    @IBAction func btnSignInAction(_ sender: UIButton) {
        checkValidationLoginTextFields()
    }
        
    @IBAction func btnSignUpAction(_ sender: UIButton) {
        signupDisclaimerPopupView()
    }
    
    @objc func disclaimercheckBox() {
        self.signupDisclaimer?.btnCheckBox.setImage(signUpDisclaimerCheck == true ? UIImage(named: "FilterCheckBox") : UIImage(named: "checkBox"), for: .normal)
        signUpDisclaimerCheck = !signUpDisclaimerCheck
    }
    
    @objc func acceptButtonAction() {
        if signUpDisclaimerCheck == false {
            let signupVC = self.storyboard?.instantiateViewController(identifier: "SignUpViewController") as! SignUpViewController
            self.navigationController?.pushViewController(signupVC, animated: true)
            signupDisclaimer?.removeFromSuperview()
        }
    }
    
    @objc func btnTermsAndCondAction() {
        cellToShowIndexPath = IndexPath(row: 0, section: 0)
        signupDisclaimer?.tableView.scrollToRow(at: cellToShowIndexPath ?? IndexPath(), at: .middle, animated: true)
    }
    
    @objc func btnPrivacyPolicyAction() {
        cellToShowIndexPath = IndexPath(row: 1, section: 0)
        signupDisclaimer?.tableView.scrollToRow(at: cellToShowIndexPath ?? IndexPath(), at: .middle, animated: true)
    }
    
    @objc func btnCookiesPolicyAction() {
        cellToShowIndexPath = IndexPath(row: 2, section: 0)
        signupDisclaimer?.tableView.scrollToRow(at: cellToShowIndexPath ?? IndexPath(), at: .middle, animated: true)
    }
    
    @objc func btnCopyRightsAction() {
        cellToShowIndexPath = IndexPath(row: 3, section: 0)
        signupDisclaimer?.tableView.scrollToRow(at: cellToShowIndexPath ?? IndexPath(), at: .middle, animated: true)
    }
    
    @objc func btnTrustAndSafetyAction() {
        cellToShowIndexPath = IndexPath(row: 4, section: 0)
        signupDisclaimer?.tableView.scrollToRow(at: cellToShowIndexPath ?? IndexPath(), at: .middle, animated: true)
    }
    
    @objc func btnCommunityStandardsAction() {
      //  cellToShowIndexPath = IndexPath(row: 5, section: 0)
      //  signupDisclaimer?.tableView.scrollToRow(at: cellToShowIndexPath ?? IndexPath(), at: .middle, animated: true)
    }

}

// MARK: =============================================== UITextField Delegate Methods ===============================================
extension LoginViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let tfTextCount = textField.text?.count ?? 0
        let totalTextCount = string.isEmpty ? tfTextCount : tfTextCount + 1
        switch loginVM.loginType  {
        case .phoneMumber:
            return totalTextCount <= 10
        case .email:
            return totalTextCount <= 50
        }
    }
}
