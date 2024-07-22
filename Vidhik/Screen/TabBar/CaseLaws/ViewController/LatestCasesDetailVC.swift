//
//  LatestCasesDetailVC.swift
//  Vidhik
//
//  Created by NumeroEins on 05/02/24.
//

import UIKit

class LatestCasesDetailVC: UIViewController {

    //MARK: ==============================  IBOutlet Properties ==============================
    @IBOutlet weak var navigationView: NavigationBarView!
    @IBOutlet weak var btnBookmark: UIButton!
    @IBOutlet weak var btnShare: UIButton!
    @IBOutlet weak var btnPDF: UIButton!
    @IBOutlet weak var btnEmail: UIButton!
    @IBOutlet weak var btnPrintOut: UIButton!
    @IBOutlet weak var btnSearch: UIButton!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblCaseDetail: UILabel!
    
    var checkUserType = ApplicationPreference.getcheckUserType()
    
    //MARK: ============================== View Controller Life Cycle Method ==============================
    override func viewDidLoad() {
        super.viewDidLoad()
        self.lblCaseDetail.setLineSpacing(2)
        self.setUpNaviagtionBar()
    }
    
    
    private func setUpNaviagtionBar() {
        self.navigationView.delegate = self
        self.navigationView.lblTitle.text = "Latest Cases"
        navigationView.btnSearch.isHidden = checkUserType == "Lawyer" ? false : true
        navigationView.btnNotification.isHidden = checkUserType == "Lawyer" ? false : true
        navigationView.btnProfile.isHidden = checkUserType == "Lawyer" ? false : true
    }
    
    //MARK: ============================== IBAction Methods ==============================
    @IBAction func btnBookMarkAction(_ sender: UIButton) {
        
    }
    
    @IBAction func btnShareAction(_ sender: UIButton) {
        
    }
    
    @IBAction func btnPDFAction(_ sender: UIButton) {
        
    }
    
    @IBAction func btnEmailAction(_ sender: UIButton) {
        
    }
    
    @IBAction func btnPrintOutAction(_ sender: UIButton) {
        
    }
    
    @IBAction func btnSearchAction(_ sender: UIButton) {
        
    }
}
// MARK: ============================== NavigationBarView Delegate Methods ==============================
extension LatestCasesDetailVC: NavigationBarViewDelegate {
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
