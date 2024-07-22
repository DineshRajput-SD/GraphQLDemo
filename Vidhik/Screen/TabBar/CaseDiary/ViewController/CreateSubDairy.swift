//
//  CreateSubDairy.swift
//  Vidhik
//
//  Created by NumeroEins on 08/02/24.
//

import UIKit

class CreateSubDairy: UIViewController {
    //MARK: ===================== IBOutlets Properties =====================
    @IBOutlet weak var navigationView: NavigationBarView!
    @IBOutlet weak var txtCaseName: UITextField!
    @IBOutlet weak var btnSelectCaseNameDropDown: UIButton!
    @IBOutlet weak var txtMembersName: UITextField!
    @IBOutlet weak var btnSelectMembersNameDropDown: UIButton!
    @IBOutlet weak var btnCreate: UIButton!
    @IBOutlet weak var btnReset: UIButton!
    @IBOutlet weak var caseNameDropDownView: DropDownViewWithSearch!
    @IBOutlet weak var caseNameDropDownViewHeight: NSLayoutConstraint!
    @IBOutlet weak var memberDropDownView: DropDownViewWithSearch!
    @IBOutlet weak var memberDropDownViewHeight: NSLayoutConstraint!
    
    var arrData = ["Section Name", "Section Name", "Section Name", "Section Name", "Section Name", "Section Name", "Section Name", "Section Name", "Section Name", "Section Name", "Section Name", "Section Name"]
    
    //MARK: ===================== View Controller Life Cycle =====================
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpNaviagtionBar()
        self.setupUI()
    }
    
    //MARK: ===================== Private Method Setup Navigation Bar Title =====================
    private func setUpNaviagtionBar() {
        self.navigationView.delegate = self
        self.navigationView.lblTitle.text = "Case Dairy"
    }
    
    private func setupUI() {
        self.caseNameDropDownView.isHidden = true
        self.memberDropDownView.isHidden = true
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
    @IBAction func btnCaseNameDropDownAction(_ sender: UIButton) {
        self.memberDropDownView.isHidden = true
        showDropDown(dropDownHeight: caseNameDropDownViewHeight, 
                     dropDownView: caseNameDropDownView,
                     text: txtCaseName, data: arrData)
        caseNameDropDownView.txtSearch.placeholder = "Select application type"
    }
    
    @IBAction func btnMembersNameDropDownAction(_ sender: UIButton) {
        self.caseNameDropDownView.isHidden = true
        showDropDown(dropDownHeight: memberDropDownViewHeight, 
                     dropDownView: memberDropDownView,
                     text: txtMembersName, data: arrData)
        memberDropDownView.txtSearch.placeholder = "Select application type"
    }
    
    @IBAction func btnCreateAction(_ sender: UIButton) {
        
    }
    
    @IBAction func btnResetAction(_ sender: UIButton) {
        
    }
}

//MARK: ===================== Extension NavigationBarView Delegate Methods =====================
extension CreateSubDairy: NavigationBarViewDelegate {
    func navigationBackAction() {
        self.navigationController?.popViewController(animated: true)
    }
    
    func navigationNotificationAction() {
        let vc = UIStoryboard(name: "Notification", bundle: nil).instantiateViewController(withIdentifier: "NotificationVC") as! NotificationVC
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
