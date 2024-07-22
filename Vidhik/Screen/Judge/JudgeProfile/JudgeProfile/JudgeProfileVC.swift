//
//  JudgeProfileVC.swift
//  Vidhik
//
//  Created by NumeroEins on 05/04/24.
//

import UIKit

class JudgeProfileVC: UIViewController {
    // MARK: =============================== IBOutlets Properties ===============================
    @IBOutlet weak var navigationView: NavigationBarView!
    @IBOutlet weak var imgProfile: UIImageView!
    @IBOutlet weak var btnEditProfile: UIButton!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblLocation: UILabel!
    @IBOutlet weak var lblMobileNo: UILabel!
    @IBOutlet weak var lblEmail: UILabel!
    @IBOutlet weak var lblAddress: UILabel!
    @IBOutlet weak var lblRegistrationNo: UILabel!
    @IBOutlet weak var lblCurrentState: UILabel!
    @IBOutlet weak var lblCurrentDistrict: UILabel!
    @IBOutlet weak var lblCourtType: UILabel!
    @IBOutlet weak var lblCourtName: UILabel!
    @IBOutlet weak var btnChangePassword: UIButton!
    @IBOutlet weak var btnDeleteAccount: UIButton!
    
    var isBackButtonHide: Bool?
    
    // MARK: =============================== View Controller Life Cycle Methods ===============================
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpUI()
        self.setUpNaviagtionBar()
        navigationView.btnBack.isHidden = isBackButtonHide == true ? true : false
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tabBarController?.tabBar.isHidden = false
    }
    
    // MARK: =============================== Private Methods SetupUI NavigationBar Title ===============================
    private func setUpUI() {
        self.imgProfile.layer.cornerRadius = 40
    }
    
    private func setUpNaviagtionBar() {
        self.navigationView.delegate = self
        self.navigationView.lblTitle.text = "Profile"
        self.navigationView.btnNotification.isHidden = true
        self.navigationView.btnSearch.isHidden =  true
        self.navigationView.btnProfile.isHidden = true
        
    }
    
    //MARK: =============================== IBActions Methods ===============================
    @IBAction func btnEditProfileAction(_ sender: UIButton) {
        tabBarController?.tabBar.isHidden = true
        let vc = UIStoryboard(name: "Profile", bundle: nil).instantiateViewController(withIdentifier: "JudgeEditProfileVC")as! JudgeEditProfileVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func btnChangePasswordAction(_ sender: UIButton) {
        tabBarController?.tabBar.isHidden = true
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ResetPasswordViewController")as! ResetPasswordViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func btnDeleteAccountAction(_ sender: UIButton) {
        self.tabBarController?.tabBar.isHidden = true
        
        let userDeleteAccoutPopup = UserDeleteAccoutPopup.showUserDeleteAccountView(onview: view) {
            print("Delete Your Account")
        }
        
        userDeleteAccoutPopup.callbackDeleteButton = {
            self.tabBarController?.tabBar.isHidden = true
            let loginViewController = self.storyboard?.instantiateViewController(identifier: "LoginViewController") as! LoginViewController
            self.navigationController?.pushViewController(loginViewController, animated: true)
        }
        
        userDeleteAccoutPopup.callbackCancelButton = {
            self.tabBarController?.tabBar.isHidden = false
        }
        
        userDeleteAccoutPopup.callbackCrossButton = {
            self.tabBarController?.tabBar.isHidden = false
        }
        
    }
}

//MARK: =============================== Extension NavigationBar Delegate Methods ===============================
extension JudgeProfileVC: NavigationBarViewDelegate {
    func navigationBackAction() {
        tabBarController?.tabBar.isHidden = false
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
