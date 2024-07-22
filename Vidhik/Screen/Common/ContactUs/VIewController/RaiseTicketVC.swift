//
//  RaiseTicketVC.swift
//  Vidhik
//
//  Created by NumeroEins on 13/03/24.
//

import UIKit

class RaiseTicketVC: UIViewController, UITextViewDelegate  {

    //MARK: =============================== IBOutlets ===============================
    @IBOutlet weak var navigationView: NavigationBarView!
    @IBOutlet weak var txtTitle: UITextField!
    @IBOutlet weak var supportDropDownView: UIView!
    @IBOutlet weak var btnDropDown: UIButton!
    @IBOutlet weak var txtDescription: UITextView!
    @IBOutlet weak var txtSupportType: UITextField!
    @IBOutlet weak var  btnSubmit: UIButton!
    @IBOutlet weak var btnCancel: UIButton!
    @IBOutlet weak var supportTypeDropDownView: CustomDropDownView!
    @IBOutlet weak var supportTypeDropDownViewHeight: NSLayoutConstraint!
    
    var arrData = ["Section Name", "Section Name", "Section Name", "Section Name", "Section Name", "Section Name", "Section Name", "Section Name", "Section Name", "Section Name", "Section Name", "Section Name"]
    
    var placeHolderColor = UIColor(red: 0, green: 0, blue: 0.0980392, alpha: 0.22)
    
    //MARK: =============================== View Controller Life Cycle Methods ===============================
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
        self.setUpNaviagtionBar()
    }
    
    //MARK: =============================== Private Method Setup Navigation Title ===============================
    private func setUpNaviagtionBar() {
        self.navigationView.delegate = self
        self.navigationView.lblTitle.text = "Contact Us"
        self.navigationView.btnNotification.isHidden = true
        self.navigationView.btnSearch.isHidden =  true
        self.navigationView.btnProfile.isHidden = true
    }
    
    private func setupUI() {
        txtDescription.text = "Type your description"
        txtDescription.textColor = placeHolderColor
        txtDescription.delegate = self
        supportDropDownView.isHidden = true
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if txtDescription.textColor == placeHolderColor {
            txtDescription.text = nil
            txtDescription.textColor = UIColor.black
        }
    }
    
    //MARK: =============================== IBAction Methods ===============================
    @IBAction func btnDropDownAction(_ sender: UIButton) {
        supportTypeDropDownViewHeight.constant = 300
        supportTypeDropDownView.tableData = arrData
        supportTypeDropDownView.dropDownTable.reloadData()
        supportTypeDropDownView.isHidden = false
        
        self.supportTypeDropDownView.closerForbackVC = { sttr in
            self.txtSupportType.text = self.supportTypeDropDownView.selectedItemText
            
            self.supportTypeDropDownView.dropDownTable.reloadData()
            self.supportTypeDropDownView.isHidden = true
            
        }
   }
    
    @IBAction func btnsubmitAction(_ sender: UIButton) {
        
    }
    
    @IBAction func btnCancelAction(_ sender: UIButton) {
        
    }
}

//MARK: =============================== Extension ===============================
extension RaiseTicketVC: NavigationBarViewDelegate {
    func navigationBackAction() {
        print("Button back clicked")
        self.navigationController?.popViewController(animated: true)
    }
    
    func navigationNotificationAction() { }
    
    func navigationSearchAction() { }
    
    func naviagtionProfileAction() { }
}
