//
//  AdvocateDetailsVC.swift
//  Vidhik
//
//  Created by Dinesh Rajput on 28/02/24.
//

import UIKit

class AdvocateDetailsVC: UIViewController {
    
    // MARK: ================================ IBOutlets Properties ================================
    @IBOutlet weak var advocateProfileImage: UIImageView!
    @IBOutlet weak var advocateName: BlurredLabel!
    @IBOutlet weak var advocateSpecilization: UILabel!
    @IBOutlet weak var advocateCasesCount: UILabel!
    @IBOutlet weak var ratingCount: UILabel!
    @IBOutlet weak var lawyerNameShowView: UIView!
    @IBOutlet weak var persionalInformationDesc: UILabel!
    @IBOutlet weak var location: UILabel!
    @IBOutlet weak var clientCount: UILabel!
    @IBOutlet weak var fileAchievment: UILabel!
    @IBOutlet weak var experience: UILabel!
    @IBOutlet weak var stateBar: UILabel!
    @IBOutlet weak var precticingCourt: UILabel!
    @IBOutlet weak var precticingField: UILabel!
    @IBOutlet weak var barLicenseNo: UILabel!
    @IBOutlet weak var phoneNumber: UILabel!
    @IBOutlet weak var email: UILabel!
    @IBOutlet weak var buttonTitleLabel: UILabel!
    @IBOutlet weak var showDetailButtonTitle: UIButton!
    
    // MARK: ================================ Instance Properties ================================
    let advocateDetailVM = AdvocateDetailVM()
    
    // MARK: ================================ View Controller Life Cycle Methods ================================
    override func viewDidLoad() {
        super.viewDidLoad()
        advocateName.isHidden = true
        phoneNumber.text = "+91 XXXXXXX458"
        email.text = "XXXXXXXXXX.com"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        lawyerNameShowView.layer.shadowOpacity = 0.4
        lawyerNameShowView.layer.shadowColor = #colorLiteral(red: 0.5297590494, green: 0.5963875651, blue: 0.6783153415, alpha: 1)
        lawyerNameShowView.layer.cornerRadius = 10
        self.tabBarController?.tabBar.isHidden = false
        buttonTitleLabel.text = isFirstTimePayment == true ? "Schedule a Meeting" : "Show Details"
        advocateName.isHidden = isFirstTimePayment == true ? false : true
    }
    
    private func moveOnScheduleConferenceMetting() {
        let scheduleConferenceMeetingVC = self.storyboard?.instantiateViewController(identifier: "ScheduleConferenceMeetingVC") as! ScheduleConferenceMeetingVC
        self.navigationController?.pushViewController(scheduleConferenceMeetingVC, animated: true)
        self.phoneNumber.text = "+91 9898988458"
    }
    
    // MARK: ================================ IBAction Methods ================================
    @IBAction func backButton(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func ratingReviewButton(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Advocates", bundle: nil)
        let reviewVc = storyboard.instantiateViewController(identifier: "ReviewVC") as! ReviewVC
        navigationController?.pushViewController(reviewVc, animated: true)
    }
 
    @IBAction func scheduleMeetingButton(_ sender: UIButton) {
        if isFirstTimePayment == true {
            self.tabBarController?.tabBar.isHidden = true
            let scheduleConferencePopup = ScheduleConferencePopup.showScheduleMettingView(onview: view) {
                print("Show Advocates Filter View")
            }
            
            scheduleConferencePopup.callbackOKButton = {
                self.tabBarController?.tabBar.isHidden = false
                self.moveOnScheduleConferenceMetting()
            }
            
            scheduleConferencePopup.callbackCancelButton = {
                self.advocateName.isHidden = false
                self.phoneNumber.text = "+91 9898988458"
                self.email.text = "kapilsibal@gmail.com"
            }
            
        } else {
            let userPaymentQRCodeVC = self.storyboard?.instantiateViewController(identifier: "UserPaymentQRCodeVC") as! UserPaymentQRCodeVC
            self.navigationController?.pushViewController(userPaymentQRCodeVC, animated: true)
        }
        
    }
}
