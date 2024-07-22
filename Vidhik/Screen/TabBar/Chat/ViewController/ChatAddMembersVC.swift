//
//  AddMembersVC.swift
//  Vidhik
//
//  Created by NumeroEins on 07/03/24.
//

import UIKit
import DropDown

class ChatAddMembersVC: UIViewController {
    //MARK: ================= IBOutlet =================
    @IBOutlet weak var popUpView: UIView!
    @IBOutlet weak var btnCancel: UIButton!
    @IBOutlet weak var txtSelectedMember:UITextField!
    @IBOutlet weak var selectedMemberView: UIView!
    @IBOutlet weak var btnSelectMemberDropDown: UIButton!
    @IBOutlet weak var btnAdd: UIButton!
    
    let dropDown = DropDown()
    var arrMemberName = ["Ayushi Yadav", "Mangla Nagar", "Aman Mourya", "Roshni", "Aditya Shukla"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addShadow(view: popUpView, shadowOpacity: 1.0)
    }
    
    //MARK: ================= IBAction =================
    @IBAction func btnCancelAction(_ sender: UIButton) {
        dismiss(animated: false)
    }
    
    @IBAction func btnSelectMemberDropDownlAction(_ sender: UIButton) {
        self.dropDown.dataSource = self.arrMemberName
        dropDown.direction = .bottom
        dropDown.anchorView =  self.selectedMemberView   // Replace with the actual button or view you want to anchor to
        dropDown.show()
        
        dropDown.backgroundColor = UIColor.white
        dropDown.cornerRadius = 10
        dropDown.shadowOpacity = 0.2
        dropDown.textFont = UIFont(name: "Poppins-Regular", size: 14)!
        // Set the dropdown direction
        // Set a selection action (optional)
        dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
            print("Selected item: \(item) at index \(index)")
            self.txtSelectedMember.text = item
            print("item:::::\(item)")
        }
    }
    
    @IBAction func btnAddAction(_ sender: UIButton) {
    }
}
