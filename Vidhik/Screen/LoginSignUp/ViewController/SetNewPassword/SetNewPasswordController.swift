//
//  SetNewPasswordController.swift
//  Vidhik
//
//  Created by NumeroEins on 16/01/24.
//

import UIKit

class SetNewPasswordController: UIViewController {
    //MARK: ========================================= IBOutlets Properties ===========================================
    @IBOutlet weak var txtNewPassword: UITextField!
    @IBOutlet weak var txtConfirmPassword: UITextField!
    @IBOutlet weak var btnShowHideNewPasswoed: UIButton!
    @IBOutlet weak var btnShowHideConfirmPassword: UIButton!
    
    var iconClick = true
    let setNewPasswordVM = SetNewPasswordVM()
    
    //MARK: ===================================== View Controller Life Cycle Method =====================================
    override func viewDidLoad() {
        super.viewDidLoad()
        txtNewPassword.isSecureTextEntry = true
        txtConfirmPassword.isSecureTextEntry = true
    }
    
    private func hideShowPassword(password: UITextField, showAndHide: UIButton) {
        password.isSecureTextEntry = iconClick == true ? false : true
        showAndHide.setImage(iconClick == true ? UIImage(named: "showPasswordIcon") : UIImage(named: "hidePasswordIcon"), for: .normal)
        iconClick = !iconClick
    }
    
    // MARK: =============================================== Private Method SetNew Password validation and API ===============================================
    private func isValidationAndAPI() {
        guard setNewPasswordVM.isSetNewPasswordTextFieldValidation(newPassword: txtNewPassword.text ?? "", confirmPassword: txtConfirmPassword.text ?? "") else { return }
        setNewPasswordVM.isLoginType == "phoneMumber" ? resetPasswordOnPhone() : resetPasswordOnEmail()
    }
    
    // MARK: ====================================== Private Method On Api Calling ==========================================
    private func resetPasswordOnPhone() {
        
        Loader.show()
        
        setNewPasswordVM.resetPasswordOnPhoneNumber(password: txtNewPassword.text ?? "", confirmPassword: txtConfirmPassword.text ?? "", userType: objAppShareData.strUserType) { responseData, message in
            
            Loader.hide()
            
            switch responseData {
                
            case .success:
                AlertView.show(title: "", message: message, okTitle: "Ok", cancelTitle: "") { index in
                    if index == 1 {
                        ObjAppdelegate.loginScreen()
                    }
                }
            case .failure:
                AlertView.show(title: "", message: message)
                
            default:
                break
                
            }
        }
    }
    
    // MARK: ==================================== Reset Password On Email =========================================
    private func resetPasswordOnEmail() {
        
        Loader.show()
        
        setNewPasswordVM.resetPasswordOnEmail(password: txtNewPassword.text ?? "", confirmPassword: txtConfirmPassword.text ?? "", userType: objAppShareData.strUserType) { responseData, message in
            Loader.hide()
            
            switch responseData {
                
            case .success:
                AlertView.show(title: "", message: message, okTitle: "Ok", cancelTitle: "") { index in
                    if index == 1 {
                        ObjAppdelegate.loginScreen()
                    }
                }
                
            case .failure:
                AlertView.show(title: "", message: message)
                
            default:
                break
            }
        }
    }
    
    
    //MARK: =============================================== IBAction Methods ===============================================
    @IBAction func btnShowHideNPAction(_ sender: UIButton) {
        self.hideShowPassword(password: txtNewPassword, showAndHide: btnShowHideNewPasswoed)
    }
    
    @IBAction func btnShowHideCPAction(_ sender: UIButton) {
        self.hideShowPassword(password: txtConfirmPassword, showAndHide: btnShowHideConfirmPassword)
    }
    
    @IBAction func btnSubmitAction(_ sender: UIButton) {
        isValidationAndAPI()
    }
    
    @IBAction func btnBackAction(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
}
