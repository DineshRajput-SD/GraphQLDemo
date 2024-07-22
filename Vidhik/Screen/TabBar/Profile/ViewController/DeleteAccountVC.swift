//
//  DeleteAccountVC.swift
//  Vidhik
//
//  Created by NumeroEins on 06/03/24.
//

import UIKit

class DeleteAccountVC: UIViewController {
    
    //MARK: ================= IBOutlet =================
    @IBOutlet weak var lblDelete: UILabel!
    @IBOutlet weak var lblDeletePermission: UILabel!
    @IBOutlet weak var btnDelete:UIButton!
    @IBOutlet weak var popUpView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addShadow(view: popUpView, shadowOpacity: 1.0)
    }
    
    //MARK: ================= IBAction =================
    @IBAction func btnDeleteAction(_ sender: UIButton) {
        
    }
    
    @IBAction func btnCancelAction(_ sender: UIButton) {
        dismiss(animated: false)
    }
}
