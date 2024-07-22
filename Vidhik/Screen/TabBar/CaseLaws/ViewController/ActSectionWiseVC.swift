//
//  ActSectionWiseVC.swift
//  Vidhik
//
//  Created by NumeroEins on 07/02/24.
//

import UIKit

class ActSectionWiseVC: UIViewController {

    //MARK: ===================== IBOutlet Properties =====================
    @IBOutlet weak var navigationView: NavigationBarView!
    @IBOutlet weak var txtSelectActTitle: UITextField!
    @IBOutlet weak var btnSelectActTitleDropDown: UIButton!
    @IBOutlet weak var txtSelectActType: UITextField!
    @IBOutlet weak var btnSelectActTypeDropDown: UIButton!
    @IBOutlet weak var btnSearch: UIButton!
    @IBOutlet weak var btnReset: UIButton!
    @IBOutlet weak var actTitleDropDownView: DropDownViewWithSearch!
    @IBOutlet weak var actTitleDropDownViewHeight: NSLayoutConstraint!
    @IBOutlet weak var actTypeDropDownView: DropDownViewWithSearch!
    @IBOutlet weak var actTypeDropDownViewHeight: NSLayoutConstraint!
    
    var checkUserType = ApplicationPreference.getcheckUserType()
    var arrData = ["Section Name", "Section Name", "Section Name", "Section Name", "Section Name", "Section Name", "Section Name", "Section Name", "Section Name", "Section Name", "Section Name", "Section Name"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpNaviagtionBar()
        self.setupUI()
    }
    
    private func setUpNaviagtionBar() {
        self.navigationView.delegate = self
        self.navigationView.lblTitle.text = "Act & Section Wise"
        navigationView.btnSearch.isHidden = checkUserType == "Lawyer" ? false : true
        navigationView.btnNotification.isHidden = checkUserType == "Lawyer" ? false : true
        navigationView.btnProfile.isHidden = checkUserType == "Lawyer" ? false : true
    }
    
    private func setupUI() {
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
    
    
    //MARK: ======================= IBAction =======================
    @IBAction func btnActTitleDropDownAction(_ sender: UIButton) {
        self.actTypeDropDownView.isHidden = true
        showDropDown(dropDownHeight: actTitleDropDownViewHeight,
                     dropDownView: actTitleDropDownView,
                     text: txtSelectActTitle, data: arrData)
        actTitleDropDownView.txtSearch.placeholder = "Select act title"
    }
    
    @IBAction func btnActTypeDropDownAction(_ sender: UIButton) {
        self.actTitleDropDownView.isHidden = true
        showDropDown(dropDownHeight: actTypeDropDownViewHeight,
                     dropDownView: actTypeDropDownView,
                     text: txtSelectActType, data: arrData)
        actTypeDropDownView.txtSearch.placeholder = "Select act type"
    }
    
    @IBAction func btnSearchAction(_ sender: UIButton) {
        let vc = UIStoryboard(name: "CaseLaws", bundle: nil).instantiateViewController(withIdentifier: "LatestCasesVC")as!LatestCasesVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func btnResetAction(_ sender: UIButton) {
        
    }
}

//MARK: ======================= Extension =======================
extension ActSectionWiseVC: NavigationBarViewDelegate {
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
