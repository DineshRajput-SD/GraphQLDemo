//
//  UserConferencePaymentVC.swift
//  Vidhik
//
//  Created by Dinesh Rajput on 21/03/24.
//

import UIKit

enum ConferencePayment {
    case first
    case second
    case third
}


class UserConferencePaymentVC: UIViewController {
    // MARK: ============================ IBOutlets Properties ============================
    @IBOutlet weak var checkButtonFirst: UIButton!
    @IBOutlet weak var profileImageFirst: UIImageView!
    @IBOutlet weak var rateFirstLabel: UILabel!
    @IBOutlet weak var timeFirstLabel: UILabel!
    @IBOutlet weak var checkButtonSecond: UIButton!
    @IBOutlet weak var profileImageSecond: UIImageView!
    @IBOutlet weak var rateSecondLabel: UILabel!
    @IBOutlet weak var timeSecondLabel: UILabel!
    @IBOutlet weak var checkButtonThird: UIButton!
    @IBOutlet weak var profileImageThird: UIImageView!
    @IBOutlet weak var rateThirdLabel: UILabel!
    @IBOutlet weak var timeThirdLabel: UILabel!
    
    var isConferencePayment: String?
    let conferencePayment = ConferencePayment.first
    
    // MARK: ============================ View Controller Life Cycle Methods ============================
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: =============================== Private Method Conference Payment Selection ===============================
    private func didSelectPaymentSelection(conferencePayment: ConferencePayment) {
        // Reset state
        [checkButtonFirst, checkButtonSecond, checkButtonThird].forEach { button in
            button?.setImage(UIImage(named:  "UncheckCircle"), for: .normal)
        }
   
        switch conferencePayment {
        case .first:
            checkButtonFirst.setImage(UIImage(named:  "checkCircle"), for: .normal)
            
        case .second:
            checkButtonSecond.setImage(UIImage(named:  "checkCircle"), for: .normal)
             
        case .third:
            checkButtonThird.setImage(UIImage(named:  "checkCircle"), for: .normal)
        }
    }
    
    // MARK: ============================ IBAction Methods ============================
    @IBAction func backButtonAction(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func hundredRuppesSelectionButtonAction(_ sender: Any) {
        didSelectPaymentSelection(conferencePayment: .first)
    }
 
    @IBAction func twoHundredRuppesSelectionButtonAction(_ sender: Any) {
        didSelectPaymentSelection(conferencePayment: .second)
    }
    
    @IBAction func fiveHundredRuppesSelectionButtonAction(_ sender: Any) {
        didSelectPaymentSelection(conferencePayment: .third)
    }
    
    @IBAction func extendButtonAction(_ sender: Any) {
        let userConferenceScanQRCodeVC = self.storyboard?.instantiateViewController(identifier: "UserConferenceScanQRCodeVC") as! UserConferenceScanQRCodeVC
        userConferenceScanQRCodeVC.isConferencePayment = self.isConferencePayment
        self.navigationController?.pushViewController(userConferenceScanQRCodeVC, animated: true)
    }
    
    @IBAction func cancelButtonAction(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
}
