//
//  CaseDairySignUpVC.swift
//  Vidhik
//
//  Created by NumeroEins on 07/02/24.
//

import UIKit

class CaseDairySignUpVC: UIViewController {
    //MARK: ===================== IBoutlets Properties =====================
    @IBOutlet weak var navigationView: NavigationBarView!
    @IBOutlet weak var lblSignUp: UILabel!
    @IBOutlet weak var lblLoginSubHeading: UILabel!
    @IBOutlet weak var txtEnterUserName: UITextField!
    @IBOutlet weak var txtEnterPassword: UITextField!
    @IBOutlet weak var btnForgotPassword: UIButton!
    @IBOutlet weak var btnsignUp: UIButton!
    @IBOutlet weak var btnLogin: UIButton!
    @IBOutlet weak var VwSignUp: UIView!
    @IBOutlet weak var VwLogin: UIView!
    @IBOutlet weak var vwContainer: UIView!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    
    let caseDairySignUpVM = CaseDairySignUpVM()
    
    //MARK: ===================== View Controller Life Cycle Method =====================
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpUi()
    }
    
    //MARK: ===================== Private Method Navigation Bar Title =====================
    private func setUpUi() {
        self.navigationView.delegate = self
        self.navigationView.lblTitle.text = "Case Dairy"
        self.vwContainer.layer.masksToBounds = false
        self.vwContainer.layer.shadowColor = UIColor(red: 46/255, green: 91/255, blue: 255/255, alpha: 0.18).cgColor
        self.vwContainer.layer.shadowOpacity = 10
        self.vwContainer.layer.cornerRadius = 20
        self.vwContainer.layer.shadowOffset = CGSize(width: 0, height: 0) // Adjust the values to control the shadow direction
        self.vwContainer.layer.shadowRadius = 20
        VwLogin.layer.borderWidth = 0.5
        VwLogin.layer.borderColor = UIColor.blue.cgColor
        VwLogin.layer.cornerRadius = 10
        let att = NSMutableAttributedString(string: "Already have a case dairy? Login")
        att.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor(red: 53/255, green: 95/255, blue: 246/255, alpha: 1), range: NSRange(location: 26, length: 6))
        btnLogin.setAttributedTitle(att, for: .normal)
    }
    
    // MARK: ===================== Private Method TextField Validation =====================
    private func isTextFieldValidation() {
        guard caseDairySignUpVM.caseDairyLoginTextFieldValidation(userName: txtEnterUserName.text ?? "",
                                                                  password: txtEnterPassword.text ?? "",
                                                                  confirmPassword:  confirmPasswordTextField.text ?? "") else { return }
        print("Success")
    }
    
    //MARK: ===================== IBActions Methods =====================
    @IBAction func btnForgorAction(_ sender: UIButton) {
        let forgetPasswordVC = UIStoryboard(name: "CaseDairy", bundle: nil).instantiateViewController(identifier: "CaseDairyForgotVC") as!CaseDairyForgotVC
        self.navigationController?.pushViewController(forgetPasswordVC, animated: true)    }
    
    @IBAction func btnSignUpAction(_ sender: UIButton) {
        isTextFieldValidation()
    }
    
    @IBAction func btnLoginAction(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
}

//MARK: ===================== NavigationBarView Delegate Methods =====================
extension CaseDairySignUpVC: NavigationBarViewDelegate {
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
