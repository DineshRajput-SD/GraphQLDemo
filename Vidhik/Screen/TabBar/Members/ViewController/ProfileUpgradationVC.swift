//
//  ProfileUpgradationVC.swift
//  Vidhik
//
//  Created by NumeroEins on 09/02/24.
//

import UIKit

class ProfileUpgradationVC: UIViewController {
    
    // MARK: ====================== IBoutlets Properties ======================
    @IBOutlet weak var navigationView: NavigationBarView!
    @IBOutlet weak var lblProfileUpgradationHeading: UILabel!
    @IBOutlet weak var lblProfileUpgradationSubHeading: UILabel!
    @IBOutlet weak var btnGoToPremium: UIButton!
    @IBOutlet weak var vwContainer: UIView!
    
    // MARK: ====================== View Controller Life Cycle ======================
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpUi()
        tabBarController?.tabBar.isHidden = false
    }
    
    // MARK: ====================== Private Method ======================
    private func setUpUi() {
        self.navigationView.delegate = self
        self.navigationView.lblTitle.text = "Members"
        self.vwContainer.layer.masksToBounds = false
        self.vwContainer.layer.shadowColor = UIColor(red: 46/255, green: 91/255, blue: 255/255, alpha: 0.18).cgColor
        self.vwContainer.layer.shadowOpacity = 10
        self.vwContainer.layer.cornerRadius = 20
        self.vwContainer.layer.shadowOffset = CGSize(width: 0, height: 0) // Adjust the values to control the shadow direction
        self.vwContainer.layer.shadowRadius = 20
    }
    
    // MARK: ====================== IBAction Methods ======================
    @IBAction func btnGoToPremiumAction(_ sender: UIButton) {
        let vc = UIStoryboard(name: "Member", bundle: nil).instantiateViewController(withIdentifier: "MemberDirectoryVC")as! MemberDirectoryVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

// MARK: ====================== NavigationBarView Delegate Methods ======================
extension ProfileUpgradationVC: NavigationBarViewDelegate {
    func navigationBackAction() {
        tabBarController?.tabBar.isHidden = true
        self.navigationController?.popViewController(animated: true)
    }
    
    func navigationNotificationAction() {
        let vc = UIStoryboard(name: "Notification", bundle: nil).instantiateViewController(withIdentifier: "NotificationVC")as! NotificationVC
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
