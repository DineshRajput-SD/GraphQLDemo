//
//  JudgeWiseVC.swift
//  Vidhik
//
//  Created by NumeroEins on 07/02/24.
//

import UIKit

class JudgeWiseVC: UIViewController {
    
    //MARK: ============================== IBOutlet ==============================
    @IBOutlet weak var navigationView: NavigationBarView!
    @IBOutlet weak var txtSelectJudge: UITextField!
    @IBOutlet weak var btnSearch: UIButton!
    @IBOutlet weak var btnRetry: UIButton!
    @IBOutlet weak var judgeDropDownView: DropDownWithCheckBox!
    @IBOutlet weak var judgeDropDownViewHeight: NSLayoutConstraint!
    
    var checkUserType = ApplicationPreference.getcheckUserType()
    var arrData = ["Judge Name", "Judge Name", "Judge Name", "Judge Name", "Judge Name", "Judge Name", "Judge Name", "Judge Name", "Judge Name", "Judge Name", "Judge Name", "Judge Name"]
    
    //MARK: ============================== View Controller Life Cycle Method ==============================
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpNaviagtionBar()
        self.setupUI()
    }
    
    private func setUpNaviagtionBar() {
        self.navigationView.delegate = self
        self.navigationView.lblTitle.text = "Judge Wise"
        navigationView.btnSearch.isHidden = checkUserType == "Lawyer" ? false : true
        navigationView.btnNotification.isHidden = checkUserType == "Lawyer" ? false : true
        navigationView.btnProfile.isHidden = checkUserType == "Lawyer" ? false : true
    }
    
    private func setupUI() {
        self.judgeDropDownView.isHidden = true
    }
    
    //MARK: ============================== IBAction ==============================
    @IBAction func btnSelectJudgeAction(_ sender: UIButton) {
        judgeDropDownViewHeight.constant = 300
        judgeDropDownView.tableData = arrData
        judgeDropDownView.dropDownTable.reloadData()
        judgeDropDownView.isHidden = false
        judgeDropDownView.txtSearch.placeholder = "Select judge"
        
        judgeDropDownView.callBackForDone = {
            self.judgeDropDownView.isHidden = true
        }
        
        self.judgeDropDownView.closerForbackVC = { sttr in
        }
    }
    
    
    @IBAction func btnSearchAction(_ sender: UIButton) {
        let vc = UIStoryboard(name: "CaseLaws", bundle: nil).instantiateViewController(withIdentifier: "LatestCasesVC")as!LatestCasesVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func btnRetryAction(_ sender: UIButton) {
        
    }
    
}

//MARK: ============================== Extension NavigationBarView Delegate Methods ==============================
extension JudgeWiseVC: NavigationBarViewDelegate {
    
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
