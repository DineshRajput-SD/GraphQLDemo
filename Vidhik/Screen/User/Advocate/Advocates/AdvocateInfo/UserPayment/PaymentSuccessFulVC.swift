//
//  PaymentSuccessFulVC.swift
//  Vidhik
//
//  Created by Dinesh Rajput on 19/03/24.
//

import UIKit

class PaymentSuccessFulVC: UIViewController {
    // MARK: ================================ IBOutlets Properties ================================
    @IBOutlet weak var paymentDetailView: UIView!
    
    var isConferencePayment: String?
    
    // MARK: ================================ View Controller Life Cycle ================================
    override func viewDidLoad() {
        super.viewDidLoad()
        paymentDetailView.layer.borderWidth = 1
        paymentDetailView.layer.borderColor = #colorLiteral(red: 0.9019607902, green: 0.9019607902, blue: 0.9019607902, alpha: 1)
        paymentDetailView.layer.cornerRadius = 8
    }
    
    // MARK: ================================ IBAction Methods ================================
    @IBAction func backButtonAction(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func doneButtonAction(_ sender: UIButton) {
        if isConferencePayment == "ConferencePayment" {
            let meetingCompletedVC = UIStoryboard(name: "Conference", bundle: nil).instantiateViewController(identifier: "MeetingCompletedVC") as! MeetingCompletedVC
            navigationController?.pushViewController(meetingCompletedVC, animated: true)
            
        } else {
            self.popToSpecificController(AdvocateDetailsVC.self)
            isFirstTimePayment = true
        }
    }
    
    @IBAction func downloadReceiptButtonAction(_ sender: UIButton) {
        print("Download Receipt")
    }
}

// MARK: ================== Extension UIView Controller TopMost View Controller Methods =======================
extension UIApplication {
    func topMostViewController() -> UIViewController? {
        return UIApplication.shared.windows.filter { $0.isKeyWindow }.first?.rootViewController?.topMostViewController()
    }
}

extension UIViewController {
    func topMostViewController() -> UIViewController {
        if self.presentedViewController == nil {
            return self
        }
        if let navigation = self.presentedViewController as? UINavigationController {
            return navigation.visibleViewController!.topMostViewController()
        }
        
        if let tab = self.presentedViewController as? UITabBarController {
            if let selectedTab = tab.selectedViewController {
                return selectedTab.topMostViewController()
            }
            return tab.topMostViewController()
        }
        return self.presentedViewController!.topMostViewController()
    }
}
