//
//  CaseDairyVC.swift
//  Vidhik
//
//  Created by NumeroEins on 07/02/24.
//

import UIKit

class CaseDairyLoginVC: UIViewController{
    // MARK: ===================== IBOutlets Properties =====================
    @IBOutlet weak var navigationView: NavigationBarView!
    @IBOutlet weak var lblLogin: UILabel!
    @IBOutlet weak var lblLoginSubHeading: UILabel!
    @IBOutlet weak var txtEnterUserName: UITextField!
    @IBOutlet weak var txtEnterPassword: UITextField!
    @IBOutlet weak var btnForgotPassword: UIButton!
    @IBOutlet weak var btnResetPassword: UIButton!
    @IBOutlet weak var btnSignIn: UIButton!
    @IBOutlet weak var btnSignup: UIButton!
    @IBOutlet weak var vwSignIn: UIView!
    @IBOutlet weak var vwSignUp: UIView!
    @IBOutlet weak var vwContainer: UIView!
    
    var isBackButtonHide: Bool?
    let caseDairyLoginVM = CaseDairyLoginVM()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationView.btnBack.isHidden = isBackButtonHide == true ? true : false
        self.navigationView.delegate = self
        self.navigationView.lblTitle.text = "Case Dairy"
        
        
        self.setUpUi()
        tabBarController?.tabBar.isHidden = false
    }
    
    //MARK: =====================  Private Method Setup UI =====================
    private func setUpUi() {
        self.vwContainer.layer.masksToBounds = false
        self.vwContainer.layer.shadowColor = UIColor(red: 46/255, green: 91/255, blue: 255/255, alpha: 0.18).cgColor
        self.vwContainer.layer.shadowOpacity = 10
        self.vwContainer.layer.cornerRadius = 20
        self.vwContainer.layer.shadowOffset = CGSize(width: 0, height: 0)
        self.vwContainer.layer.shadowRadius = 20
        vwSignUp.layer.borderWidth = 0.5
        vwSignUp.layer.borderColor = UIColor.blue.cgColor
        vwSignUp.layer.cornerRadius = 10
        
        let att = NSMutableAttributedString(string: "Don’t have case dairy ? Sign up")
        
        att.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor(red: 53/255, green: 95/255, blue: 246/255, alpha: 1), range: NSRange(location: 24, length: 7))
        btnSignup.setAttributedTitle(att, for: .normal)
        btnForgotPassword.titleLabel?.font = UIFont(name: "Poppins-Regular", size: 12)
        btnResetPassword.titleLabel?.font = UIFont(name: "Poppins-Regular", size: 12)
    }
    
    // MARK: -===================== Private Method TextField Validation =====================
    private func isTextFieldValidation () {
        guard caseDairyLoginVM.caseDairyLoginTextFieldValidation(userName: txtEnterUserName.text ?? "",
                                                                 password: txtEnterPassword.text ?? "") else  { return }
        let vc = UIStoryboard(name: "CaseDairy", bundle: nil).instantiateViewController(withIdentifier: "LegalCaseRepository")as! LegalCaseRepository
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    //MARK: ===================== IBActions Methods =====================
    @IBAction func btnForgetPassAction(_ sender: UIButton) {
        let forgetPasswordVC = UIStoryboard(name: "CaseDairy", bundle: nil).instantiateViewController(identifier: "CaseDairyForgotVC") as!CaseDairyForgotVC
        self.navigationController?.pushViewController(forgetPasswordVC, animated: true)
    }
    
    @IBAction func btnResetPassword(_ sender: UIButton) {
        let resetPasswordVC = UIStoryboard(name: "CaseDairy", bundle: nil).instantiateViewController(identifier: "CaseDairyResetPasswordVC") as! CaseDairyResetPasswordVC
        self.navigationController?.pushViewController(resetPasswordVC, animated: true)
    }
    
    
    @IBAction func btnSignInAction(_ sender: UIButton) {
        isTextFieldValidation ()
    }
    
    @IBAction func btnSignUpAction(_ sender: UIButton) {
        let vc = UIStoryboard(name: "CaseDairy", bundle: nil).instantiateViewController(withIdentifier: "CaseDairySignUpVC")as! CaseDairySignUpVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}
// MARK: =====================  NavigationBarView Delegate Methods =====================
extension CaseDairyLoginVC: NavigationBarViewDelegate {
    func navigationBackAction() {
        tabBarController?.tabBar.isHidden = true
        self.navigationController?.popViewController(animated: true)
    }
    
    func navigationNotificationAction() {
        let vc = UIStoryboard(name: "Notification", bundle: nil).instantiateViewController(withIdentifier: "NotificationVC") as! NotificationVC
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
