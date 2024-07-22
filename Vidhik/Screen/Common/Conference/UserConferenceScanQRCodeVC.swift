//
//  UserConferenceScanQRCodeVC.swift
//  Vidhik
//
//  Created by Dinesh Rajput on 21/03/24.
//

import UIKit

class UserConferenceScanQRCodeVC: UIViewController {
    
    var isConferencePayment: String?
    
    // MARK: =============================== View Controller Life Cycle Methods ===============================
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: =============================== IBAction Methods ===============================
    @IBAction func backButtonAction(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func scanQRCodeButtonAction(_ sender: Any) {
        let vc = UIStoryboard(name: "Advocates", bundle: nil).instantiateViewController(identifier: "PaymentSuccessFulVC") as! PaymentSuccessFulVC
        vc.isConferencePayment = self.isConferencePayment
        navigationController?.pushViewController(vc, animated: true)
    }
}
