//
//  ConferenceExtensionVC.swift
//  Vidhik
//
//  Created by NumeroEins on 22/02/24.
//

import UIKit

class ConferenceExtensionVC: UIViewController {

    //MARK: =================== IBOutlet Properties ===================
    @IBOutlet weak var popUpView: UIView!
    @IBOutlet weak var btnExtend: UIButton!
    @IBOutlet weak var lblExtendMsg: UILabel!
    
    //MARK: =================== View Controller Life Cycle Method ===================
    override func viewDidLoad() {
        super.viewDidLoad()
        addShadow(view: popUpView, shadowOpacity: 1.0)
    }
    
    //MARK: =================== IBAction Methods  ===================
    @IBAction func btnExtendAction(_ sender: UIButton) {
    }
    
    @IBAction func btnCancelAction(_ sender: UIButton) {
        dismiss(animated: false)
    }
}
