//
//  ProfileVC.swift
//  Vidhik
//
//  Created by NumeroEins on 25/01/24.
//

import UIKit

class ProfileVC: UIViewController {
    
    //MARK: =================== IBOutlet Properties ===================
    @IBOutlet weak var navigationView: NavigationBarView!
    @IBOutlet weak var imgProfilePhoto: UIImageView!
    @IBOutlet weak var btnEditProfile: UIButton!
    @IBOutlet weak var lblCoreCompetency: UILabel!
    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var txtFatherName: UITextField!
    @IBOutlet weak var txtMobileNo: UITextField!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtAddress: UITextField!
    @IBOutlet weak var txtorganizationName: UITextField!
    @IBOutlet weak var txtBranchName: UITextField!
    @IBOutlet weak var txtYearOfPractice: UITextField!
    @IBOutlet weak var txtStatusBar: UITextField!
    @IBOutlet weak var txtLiscenceNo: UITextField!
    @IBOutlet weak var txtpracticingCourt: UITextField!
    @IBOutlet weak var txtPracticingArea: UITextField!
    @IBOutlet weak var btnEditSubscription: UIButton!
    @IBOutlet weak var btnChangePassword: UIButton!
    @IBOutlet weak var btnDeleteAccount: UIButton!
    
    var isBackButtonHide: Bool?
    
    // MARK: ================= View Controller Life Cycle Methods =================
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpNaviagtionBar()
        navigationView.btnBack.isHidden = isBackButtonHide == true ? true : false
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tabBarController?.tabBar.isHidden = false
    }
    
    private func setUpNaviagtionBar() {
        self.navigationView.delegate = self
        self.navigationView.lblTitle.text = "Profile"
    }
    
    //MARK: ================= IBAction Methods =================
    @IBAction func btnEditProfileAction(_ sender: UIButton) {
        let editProfileVC = UIStoryboard(name: "Profile", bundle: nil) .instantiateViewController(identifier: "EditProfileVC") as! EditProfileVC
        navigationController?.pushViewController(editProfileVC, animated: true)
    }
    
    @IBAction func btnEditSubscription(_ sender: UIButton) {
        let subscriptionPlanVC = UIStoryboard(name: "Profile", bundle: nil) .instantiateViewController(identifier: "SubscriptionPlanVC") as! SubscriptionPlanVC
        navigationController?.pushViewController(subscriptionPlanVC, animated: true)
    }
    
    @IBAction func btnChangePasswordAction(_ sender: UIButton) {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ResetPasswordViewController")as! ResetPasswordViewController
        tabBarController?.tabBar.isHidden = true
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func btnDeleteAccountAction(_ sender: UIButton) {
        let deleteAccountVC = UIStoryboard(name: "Profile", bundle: nil).instantiateViewController(withIdentifier: "DeleteAccountVC")as! DeleteAccountVC
        deleteAccountVC.modalPresentationStyle = .overCurrentContext
        navigationController?.present(deleteAccountVC, animated: false)
    }
}

// MARK: ================= NavigationBarView Delegate Methods =================
extension ProfileVC: NavigationBarViewDelegate {
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
