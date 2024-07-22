//
//  CaseDairyForgotVC.swift
//  Vidhik
//
//  Created by NumeroEins on 07/02/24.
//

import UIKit

class CaseDairyForgotVC: UIViewController {
    // MARK: =================== IBoutlets Properties ==================
    @IBOutlet weak var navigationView: NavigationBarView!
    @IBOutlet weak var lblForgot: UILabel!
    @IBOutlet weak var lblForgotSubHeading: UILabel!
    @IBOutlet weak var txtEnterUserName: UITextField!
    @IBOutlet weak var btnContinue: UIButton!
    @IBOutlet weak var vwContinue: UIView!
    @IBOutlet weak var vwContainer: UIView!
    
    let caseDairyForgotVM = CaseDairyForgotVM()
    
    // MARK: =================== View Controoler Life Cycle Method ==================
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpUi()
    }
    
    //MARK:  =================== Private Method SetUp Ui Method ===================
    private func setUpUi() {
        self.navigationView.delegate = self
        self.navigationView.lblTitle.text = "Case Dairy"
        self.vwContainer.layer.masksToBounds = false
        self.vwContainer.layer.shadowColor = UIColor(red: 46/255, green: 91/255, blue: 255/255, alpha: 0.18).cgColor
        self.vwContainer.layer.shadowOpacity = 10
        self.vwContainer.layer.cornerRadius = 20
        self.vwContainer.layer.shadowOffset = CGSize(width: 0, height: 0) // Adjust the values to control the shadow direction
        self.vwContainer.layer.shadowRadius = 20
    }
    
    // MARK:  =================== Private Method IsTextField Validation ===================
    private func isTextFieldValidation() {
        guard caseDairyForgotVM.caseDairyForgotPasswordValidation(email: txtEnterUserName.text ?? "") else { return }
        let vc = UIStoryboard(name: "CaseDairy", bundle: nil).instantiateViewController(withIdentifier: "CaseDairySecondForgotVC")as! CaseDairySecondForgotVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    //MARK: =================== IBActions Method  ===================
    @IBAction func btnContinueAction(_ sender: UIButton) {
        isTextFieldValidation()
    }
}

//MARK: =================== NavigationBarView Delegate Method  ===================
extension CaseDairyForgotVC: NavigationBarViewDelegate {
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
