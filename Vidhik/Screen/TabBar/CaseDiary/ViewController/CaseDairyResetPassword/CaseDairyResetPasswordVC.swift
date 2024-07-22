//
//  CaseDairyResetPasswordVC.swift
//  Vidhik
//
//  Created by NumeroEins on 07/03/24.
//

import UIKit

class CaseDairyResetPasswordVC: UIViewController {
    
    //MARK: ==================== IBOutlets Properties ====================
    @IBOutlet weak var navigationView: NavigationBarView!
    @IBOutlet weak var viewReset: UIView!
    @IBOutlet weak var txtOldPassword: UITextField!
    @IBOutlet weak var txtNewPassword: UITextField!
    @IBOutlet weak var txtConfirmNewPassword: UITextField!
    @IBOutlet weak var btnHideShowOldPass: UIButton!
    @IBOutlet weak var btnHideShowNewPass: UIButton!
    @IBOutlet weak var btnHideShowConfirmNewPass: UIButton!
    @IBOutlet weak var btnDone: UIButton!
    
    let caseDairyResetPasswordVM = CaseDairyResetPasswordVM()
    
    //MARK: ==================== View Controoler Life Cycle Method ====================
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpUI()
    }
    
    //MARK: ==================== Private Method Setup UI Navigation Bar Title ====================
    private func setUpUI() {
        self.navigationView.delegate = self
        self.navigationView.lblTitle.text = "Case Dairy"
        self.viewReset.layer.masksToBounds = false
        self.viewReset.layer.shadowColor = UIColor(red: 46/255, green: 91/255, blue: 255/255, alpha: 0.18).cgColor
        self.viewReset.layer.shadowOpacity = 10
        self.viewReset.layer.cornerRadius = 20
        self.viewReset.layer.shadowOffset = CGSize(width: 0, height: 0) // Adjust the values to control the shadow direction
        self.viewReset.layer.shadowRadius = 20
    }
    
    // MARK: ==================== Private Method TextField Validation ====================
    private func isTextFieldValidation() {
        guard caseDairyResetPasswordVM.caseDairyResetPasswordValidation(oldPassword: txtOldPassword.text ?? "",
                                                                        newPassword: txtNewPassword.text ?? "",
                                                                        confirmPassword: txtConfirmNewPassword.text ?? "") else {
            return
        }
    }
    
    //MARK: ==================== IBAction Methods ====================
    @IBAction func btnHideShowOldPassAction(_ sender: UIButton) {
        
    }
    
    @IBAction func btnHideShowNewPassAction(_ sender: UIButton) {
        
    }
    
    @IBAction func btnHideShowConfirmNewPassAction(_ sender: UIButton) {
        
    }
    
    @IBAction func btnDoneAction(_ sender: UIButton) {
        isTextFieldValidation()
    }
}

//MARK: ====================  Extension NavigationBarView Delegate Methods ====================
extension CaseDairyResetPasswordVC: NavigationBarViewDelegate {
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

