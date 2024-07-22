//
//  AddEventVC.swift
//  Vidhik
//
//  Created by NumeroEins on 14/02/24.
//

import UIKit

class AddEventVC: UIViewController, UITextViewDelegate {
    
    //MARK: =========================== IBOutlet Properties ===========================
    @IBOutlet weak var navigationView: NavigationBarView!
    @IBOutlet weak var txtSelectCase: UITextField!
    @IBOutlet weak var btnSelectCaseDropDown: UIButton!
    @IBOutlet weak var txtEventName: UITextField!
    @IBOutlet weak var txtEventDescription: UITextView!
    @IBOutlet weak var btnAllDay: UIButton!
    @IBOutlet weak var lblStartDate: UILabel!
    @IBOutlet weak var btnStartDate: UIButton!
    @IBOutlet weak var lblEndDate: UILabel!
    @IBOutlet weak var btnEndDate: UIButton!
    @IBOutlet weak var lblStartTime: UILabel!
    @IBOutlet weak var btnStartTime: UIButton!
    @IBOutlet weak var lblEndTime: UILabel!
    @IBOutlet weak var btnEndTime: UIButton!
    @IBOutlet weak var lblRepeat: UILabel!
    @IBOutlet weak var btnRepeat: UIButton!
    @IBOutlet weak var lblReminder: UILabel!
    @IBOutlet weak var btnReminder: UIButton!
    @IBOutlet weak var btnAdd: UIButton!
    @IBOutlet weak var btnDelete: UIButton!
    @IBOutlet weak var caseDropDownView: CustomDropDownView!
    @IBOutlet weak var caseDropDownViewHeight: NSLayoutConstraint!
    
    var arrData = ["Section Name", "Section Name", "Section Name", "Section Name", "Section Name", "Section Name", "Section Name", "Section Name", "Section Name", "Section Name", "Section Name", "Section Name"]
    
    var placeHolderColor = UIColor(red: 0, green: 0, blue: 0.0980392, alpha: 0.22)
    
    // MARK: ===========================  View Controller Life Cycle Methods ===========================
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpNaviagtionBar()
        self.setupUI()
        self.caseDropDownView.isHidden = true
    }
    
    private func setUpNaviagtionBar() {
        self.navigationView.delegate = self
        self.navigationView.lblTitle.text = "Calendar"
    }
    
    private func setupUI() {
        txtEventDescription.text = "Type your description"
        txtEventDescription.textColor = placeHolderColor
        txtEventDescription.delegate = self
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if txtEventDescription.textColor == placeHolderColor {
            txtEventDescription.text = nil
            txtEventDescription.textColor = UIColor.black
        }
    }

    //MARK: ===========================  IBAction Methods ===========================
    @IBAction func btnSelectCaseDropDownAction(_ sender: UIButton) {
        caseDropDownViewHeight.constant = 300
        caseDropDownView.tableData = arrData
        caseDropDownView.dropDownTable.reloadData()
        caseDropDownView.isHidden = false
        
        self.caseDropDownView.closerForbackVC = { sttr in
            self.txtSelectCase.text = self.caseDropDownView.selectedItemText
            
            self.caseDropDownView.dropDownTable.reloadData()
            self.caseDropDownView.isHidden = true
            
        }
    }
    
    @IBAction func btnAllDayAction(_ sender: UIButton) {
        
    }
    
    @IBAction func btnSelectColorAction(_ sender: UIButton) {
        
    }
    
    @IBAction func btnStartDateAction(_ sender: UIButton) {
        
    }
    
    @IBAction func btnEndDateAction(_ sender: UIButton) {
        
    }
    
    @IBAction func btnStartTimeAction(_ sender: UIButton) {
        
    }
    
    @IBAction func btnEndTimeAction(_ sender: UIButton) {
        
    }
    
    @IBAction func btnRepeatAction(_ sender: UIButton) {
        
    }
    
    @IBAction func btnReminderAction(_ sender: UIButton) {
        
    }
    
    @IBAction func btnAddAction(_ sender: UIButton) {
        
    }
    
    @IBAction func btnDeleteAction(_ sender: UIButton) {
        
    }
 }

//MARK: ===========================  Extension NavigationBarView Delegate Methods ===========================
extension AddEventVC: NavigationBarViewDelegate {
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
