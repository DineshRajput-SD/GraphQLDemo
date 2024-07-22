//
//  ChatProfileUpgradationVC.swift
//  Vidhik
//
//  Created by NumeroEins on 09/02/24.
//

import UIKit

class ChatProfileUpgradationVC: UIViewController {
    // MARK: =========================== IBOutlets Properties ===========================
    @IBOutlet weak var navigationView: NavigationBarView!
    @IBOutlet weak var lblProfileUpgradationHeading: UILabel!
    @IBOutlet weak var lblProfileUpgradationSubHeading: UILabel!
    @IBOutlet weak var btnGoToPremium: UIButton!
    @IBOutlet weak var vwContainer: UIView!
    
    var isBackButtonHide: Bool?
    
    //MARK: =========================== View Controller Life Cycle Method ===========================
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpUi()
        tabBarController?.tabBar.isHidden = false
        self.navigationView.btnBack.isHidden  = isBackButtonHide == true ? true : false
    }
    
    //MARK: =========================== Private Method Setup UI Navigation Title ===========================
    private func setUpUi() {
        self.navigationView.delegate = self
        self.navigationView.lblTitle.text = "Chat Room"
        self.navigationView.btnBack.isHidden = true
        self.vwContainer.layer.masksToBounds = false
        self.vwContainer.layer.shadowColor = UIColor(red: 46/255, green: 91/255, blue: 255/255, alpha: 0.18).cgColor
        self.vwContainer.layer.shadowOpacity = 10
        self.vwContainer.layer.cornerRadius = 20
        self.vwContainer.layer.shadowOffset = CGSize(width: 0, height: 0) // Adjust the values to control the shadow direction
        self.vwContainer.layer.shadowRadius = 20
    }
    
    //MARK: =========================== Button Action Method ===========================
    @IBAction func btnGoToPremiumAction(_ sender: UIButton) {
        let vc = UIStoryboard(name: "Chat", bundle: nil).instantiateViewController(withIdentifier: "CreateChatRoomVC")as! CreateChatRoomVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

 //MARK: ===========================  Extension NavigationBarView Delegate Methods ===========================
extension ChatProfileUpgradationVC: NavigationBarViewDelegate {
    func navigationBackAction() {
        tabBarController?.tabBar.isHidden = true
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
