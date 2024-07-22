//
//  AdvanceSearchVC.swift
//  Vidhik
//
//  Created by NumeroEins on 07/02/24.
//

import UIKit

class AdvanceSearchVC: UIViewController {
    
    //MARK: ===================== IBOutlet =====================
    @IBOutlet weak var navigationView: NavigationBarView!
    @IBOutlet weak var txtEnterText: UITextField!
    @IBOutlet weak var txtJudgeName: UITextField!
    @IBOutlet weak var btnSelectJNameDropDown: UIButton!
    @IBOutlet weak var txtCaseNo: UITextField!
    @IBOutlet weak var txtCaseYear: UITextField!
    @IBOutlet weak var txtAdvocatest: UITextField!
    @IBOutlet weak var txtAppRespName: UITextField!
    @IBOutlet weak var txtFromDate: UITextField!
    @IBOutlet weak var txtToDate: UITextField!
    @IBOutlet weak var txtActTitle: UITextField!
    @IBOutlet weak var btnSelectActTitleDropDown: UIButton!
    @IBOutlet weak var txtActType: UITextField!
    @IBOutlet weak var btnSelectActTypeDropDown: UIButton!
    @IBOutlet weak var btnSearch: UIButton!
    @IBOutlet weak var btnReset: UIButton!
    @IBOutlet weak var judgeDropDownView: DropDownWithCheckBox!
    @IBOutlet weak var judgeDropDownViewHeight: NSLayoutConstraint!
    @IBOutlet weak var actTitleDropDownView: DropDownViewWithSearch!
    @IBOutlet weak var actTitleDropDownViewHeight: NSLayoutConstraint!
    @IBOutlet weak var actTypeDropDownView: DropDownViewWithSearch!
    @IBOutlet weak var actTypeDropDownViewHeight: NSLayoutConstraint!
    
    var checkUserType = ApplicationPreference.getcheckUserType()
    var arrData = ["Judge Name", "Judge Name", "Judge Name", "Judge Name", "Judge Name", "Judge Name", "Judge Name", "Judge Name", "Judge Name", "Judge Name", "Judge Name", "Judge Name"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpNaviagtionBar()
        self.setupUI()
    }
    
    private func setUpNaviagtionBar() {
        self.navigationView.delegate = self
        self.navigationView.lblTitle.text = "Advance Search"
        navigationView.btnSearch.isHidden = checkUserType == "Lawyer" ? false : true
        navigationView.btnNotification.isHidden = checkUserType == "Lawyer" ? false : true
        navigationView.btnProfile.isHidden = checkUserType == "Lawyer" ? false : true
    }
    
    private func setupUI() {
        self.judgeDropDownView.isHidden = true
        self.actTypeDropDownView.isHidden = true
        self.actTitleDropDownView.isHidden = true
    }
    
    func showDropDown(dropDownHeight: NSLayoutConstraint, dropDownView: DropDownViewWithSearch, text: UITextField, data: [String]) {
        dropDownHeight.constant = 300
        dropDownView.tableData = data
        dropDownView.dropDownTable.reloadData()
        dropDownView.isHidden = false
        
        dropDownView.closerForbackVC = { sttr in
            text.text = dropDownView.selectedItemText
            dropDownView.isHidden = true
            
        }
    }
    
    //MARK: ===================== IBAction Methods =====================
    @IBAction func btnJudgeNameDropDownAction(_ sender: UIButton) {
        self.actTypeDropDownView.isHidden = true
        self.actTitleDropDownView.isHidden = true
        judgeDropDownViewHeight.constant = 300
        judgeDropDownView.tableData = arrData
        judgeDropDownView.dropDownTable.reloadData()
        judgeDropDownView.isHidden = false
        judgeDropDownView.txtSearch.placeholder = "Select judge"
        
        
        self.judgeDropDownView.closerForbackVC = { sttr in
            self.txtJudgeName.text = self.judgeDropDownView.selectedItemText
        }
        
        judgeDropDownView.callBackForDone = {
            self.judgeDropDownView.isHidden = true
        }
    }
    
    @IBAction func btnActTitleDropDownAction(_ sender: UIButton) {
        self.judgeDropDownView.isHidden = true
        self.actTypeDropDownView.isHidden = true
        self.showDropDown(dropDownHeight: actTitleDropDownViewHeight, dropDownView: actTitleDropDownView, text: txtActTitle, data: arrData)
        actTitleDropDownView.txtSearch.placeholder = "Select act title"
        
    }
    
    @IBAction func btnActTypeDropDownAction(_ sender: UIButton) {
        self.judgeDropDownView.isHidden = true
        self.actTitleDropDownView.isHidden = true
        self.showDropDown(dropDownHeight: actTypeDropDownViewHeight, dropDownView: actTypeDropDownView, text: txtActType, data: arrData)
        actTypeDropDownView.txtSearch.placeholder = "Select act type"
    }
    
    @IBAction func btnSearchAction(_ sender: UIButton) {
        let vc = UIStoryboard(name: "CaseLaws", bundle: nil).instantiateViewController(withIdentifier: "LatestCasesVC")as!LatestCasesVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func btnResetAction(_ sender: UIButton) {
        
    }
    
}

//MARK: ===================== Extension NavigationBarView Delegate Methods=====================
extension AdvanceSearchVC: NavigationBarViewDelegate {
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
