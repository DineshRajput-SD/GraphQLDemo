//
//  AppRespVC.swift
//  Vidhik
//
//  Created by NumeroEins on 07/02/24.
//

import UIKit

class AppRespVC: UIViewController {

    //MARK: ============================== IBOutlet Properties==============================
    @IBOutlet weak var navigationView: NavigationBarView!
    @IBOutlet weak var txtSearchString: UITextField!
    @IBOutlet weak var btnSearch: UIButton!
    @IBOutlet weak var btnRetry: UIButton!
    
    var checkUserType = ApplicationPreference.getcheckUserType()
    
    //MARK: ============================== View Controller Life Cycle Methods ==============================
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpNaviagtionBar()
    }
    
    private func setUpNaviagtionBar() {
        self.navigationView.delegate = self
        self.navigationView.lblTitle.text = "App/Resp"
        navigationView.btnSearch.isHidden = checkUserType == "Lawyer" ? false : true
        navigationView.btnNotification.isHidden = checkUserType == "Lawyer" ? false : true
        navigationView.btnProfile.isHidden = checkUserType == "Lawyer" ? false : true
    }
    
    //MARK: ============================== IBAction Methods ==============================
    @IBAction func btnSearchAction(_ sender: UIButton) {
        let vc = UIStoryboard(name: "CaseLaws", bundle: nil).instantiateViewController(withIdentifier: "LatestCasesVC")as!LatestCasesVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func btnRetryAction(_ sender: UIButton) {
        
    }

}


//MARK: ============================== NavigationBarView Delegate Methods ==============================
extension AppRespVC: NavigationBarViewDelegate {
    
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
