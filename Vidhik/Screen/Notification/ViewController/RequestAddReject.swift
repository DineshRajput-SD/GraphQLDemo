//
//  RequestAddReject.swift
//  Vidhik
//
//  Created by NumeroEins on 09/02/24.
//

import UIKit

class RequestAddReject: UIViewController {
    
    // MARK: ======================= IBoutlets Properties =======================
    @IBOutlet weak var vwRequestAcceptReject: UIView!
    
    var closerForbackVC:(( _ strdict: String) -> ())?
    
    // MARK: ======================= View Controller Life Cycle Methods =======================
    override func viewDidLoad() {
        super.viewDidLoad()
        addShadow(view: vwRequestAcceptReject, shadowOpacity: 1)
    }
    
    
    // MARK: ======================= IBAction Methods =======================
    @IBAction func btnCancelAction(_ sender: UIButton) {
        self.closerForbackVC?("hyy")
        dismiss(animated: false)
    }
    
    @IBAction func btnAcceptAction(_ sender: UIButton) {
        dismiss(animated: false)
        self.vwRequestAcceptReject.isHidden = true
    }
    
    @IBAction func btnRejectAction(_ sender: UIButton) {
        self.closerForbackVC?("hyy")
        dismiss(animated: false)
    }
    
    @IBAction func btnOkAction(_ sender: UIButton) {
        self.closerForbackVC?("hyy")
        dismiss(animated: false)
    }
    
    @IBAction func btnCncelAction(_ sender: UIButton) {
        self.vwRequestAcceptReject.isHidden = false
    }
}
