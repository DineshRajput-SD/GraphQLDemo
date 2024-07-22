//
//  DeleteChatVC.swift
//  Vidhik
//
//  Created by NumeroEins on 07/03/24.
//

import UIKit

class DeleteChatVC: UIViewController {

    //MARK: ============ IBOutlet ============
    @IBOutlet weak var popUpView: UIView!
    @IBOutlet weak var lblPermanentDelete: UILabel!
    @IBOutlet weak var btnConfirm: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addShadow(view: popUpView, shadowOpacity:1.0)
    }
    
    //MARK: IBAction
    @IBAction func btnCancelAction(_ sender: UIButton) {
        dismiss(animated: false)
    }
    
    @IBAction func btnConfirmAction(_ sender: UIButton) {
        
    }
}
