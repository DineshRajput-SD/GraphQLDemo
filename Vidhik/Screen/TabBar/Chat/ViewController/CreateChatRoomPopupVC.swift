//
//  CreateChatRoomPopupVC.swift
//  Vidhik
//
//  Created by NumeroEins on 28/02/24.
//

import UIKit
import DropDown

class CreateChatRoomPopupVC: UIViewController {
    //MARK: =========================== IBOutlet ===========================
    @IBOutlet weak var popUpView: UIView!
    @IBOutlet weak var selectedMemberView: UIView!
    @IBOutlet weak var txtSelectMember: UITextField!
    @IBOutlet weak var btnMemberDropDown: UIButton!
    @IBOutlet weak var txtChatRoomName: UITextField!
    
    var closerForbackVC:(( _ strdict: String) ->())?
    let dropDown = DropDown()
    var arrMemberName = ["Ayushi Yadav", "Mangla Nagar", "Aman Mourya", "Roshni", "Aditya Shukla"]
    var selectedMembers: [String]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addShadow(view: popUpView, shadowOpacity: 1.0)
    }
    
    //MARK: =========================== IBAction ===========================
    @IBAction func btnMemberDropDownAction(_ sender: UIButton) {
        self.dropDown.dataSource = self.arrMemberName
        dropDown.direction = .bottom
        dropDown.anchorView =  self.selectedMemberView   // Replace with the actual button or view you want to anchor to
        dropDown.show()
        
        dropDown.backgroundColor = UIColor.white
        dropDown.cornerRadius = 10
        dropDown.shadowOpacity = 0.2
        dropDown.textFont = UIFont(name: "Poppins-Regular", size: 14)!
        dropDown.selectionBackgroundColor = .systemGray6
        dropDown.multiSelectionAction = { [unowned self] (index: [Int], item: [String]) in
            print("Selected item: \(item) at index \(index)")
            self.selectedMembers = item
            print("item:::::\(item)")
            let concatenatedString = selectedMembers?.joined(separator: ", ")
            txtSelectMember.text = concatenatedString
        }
        
    }
    
    @IBAction func btnCreateAction(_ sender: UIButton) {
        self.closerForbackVC?("Hi")
        dismiss(animated: false)
    }
    
    @IBAction func btnCancelAction(_ sender: UIButton) {
        dismiss(animated: false)
    }
    
}
