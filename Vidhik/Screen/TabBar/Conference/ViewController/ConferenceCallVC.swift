//
//  ConferenceCallVC.swift
//  Vidhik
//
//  Created by NumeroEins on 21/02/24.
//

import UIKit

class ConferenceCallVC: UIViewController {
    //MARK: =================== IBOutlet Properties ===================
    @IBOutlet weak var navigationView: NavigationBarView!
    @IBOutlet weak var conferenceCallView: UIView!
    @IBOutlet weak var endConferenceView: UIView!
    @IBOutlet weak var btnGoToHome: UIButton!
    @IBOutlet weak var imgClientPhoto: UIImageView!
    @IBOutlet weak var lblClientName: UILabel!
    @IBOutlet weak var imgClientCenterImage: UIImageView!
    @IBOutlet weak var btnMute: UIButton!
    @IBOutlet weak var btnEndCall: UIButton!
    @IBOutlet weak var btnChat: UIButton!
    @IBOutlet weak var lblTime: UILabel!
    
    var closerForbackVC:(( _ strdict: String) ->())?
    var timeLabel: UILabel!
    var timer: Timer?
    var currentTime: Float = 0
    let totalTime: Float = 60 // Total time in seconds
    var targetTime: TimeInterval = 3600
    var isConferencePayment = "ConferencePayment"
    
    // MARK: =================== View Controller Life Cycle Method ===================
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpUI()
        self.setUpNaviagtionBar()
        startCountdown()
    }
    
    // MARK: =================== Private Methods Setup UI NavigationBar Title ===================
    private func setUpUI() {
        self.tabBarController?.tabBar.isHidden = true
        self.conferenceCallView.isHidden = false
        self.endConferenceView.isHidden = true
    }
    
    private func setUpNaviagtionBar() {
        self.navigationView.delegate = self
        self.navigationView.lblTitle.text = "Meeting Completed"
        self.navigationView.btnNotification.isHidden = true
        self.navigationView.btnSearch.isHidden =  true
        self.navigationView.btnProfile.isHidden = true
    }
    
    func startCountdown() {
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateCountdown), userInfo: nil, repeats: true)
    }
    
    @objc func updateCountdown() {
        if targetTime > 0 {
            targetTime -= 1
            let hours = Int(targetTime) / 3600
            let minutes = (Int(targetTime) % 3600) / 60
            let seconds = (Int(targetTime) % 3600) % 60
            let countdownString = String(format: "%02d:%02d:%02d", hours, minutes, seconds)
            lblTime.text = countdownString
        } else {
            // Timer finished
            timer?.invalidate()
            self.conferenceCallView.isHidden = true
            self.endConferenceView.isHidden = false
        }
    }
    
    //MARK: =================== IBAction Methods ===================
    @IBAction func btnMuteAction(_ sender: UIButton) {
        btnMute.setImage(UIImage(named: "MuteButton"), for: .selected)
        btnMute.setImage(UIImage(named: "UnMuteButton"), for: .normal)
        btnMute.isSelected = !btnMute.isSelected
        let conferenceExtensionPopup = ConferenceExtensionPopup.showConferenceExtensionView(onview: view) {
            print("Show Advocates Filter View")
        }
        conferenceExtensionPopup.callbackYesButton = {
            let userConferencePaymentVC = UIStoryboard(name: "Conference", bundle: nil).instantiateViewController(withIdentifier: "UserConferencePaymentVC")as! UserConferencePaymentVC
            userConferencePaymentVC.isConferencePayment = self.isConferencePayment
            self.navigationController?.pushViewController(userConferencePaymentVC, animated: true)
        }
    }
    
    @IBAction func btnEndCallAction(_ sender: UIButton) {
        self.closerForbackVC?("Hi")
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func btnChatAction(_ sender: UIButton) {
        let chatVC = UIStoryboard(name: "Conference", bundle: nil).instantiateViewController(withIdentifier: "ConferenceChatVC")as! ConferenceChatVC
        self.navigationController?.present(chatVC, animated: true)
    }
    
    @IBAction func btnGoToHomeAction(_ sender: UIButton) {
        
    }
}

//MARK: =================== Extension NavigationBarView Delegate Methods ===================
extension ConferenceCallVC: NavigationBarViewDelegate {
    func navigationBackAction() {
        tabBarController?.tabBar.isHidden = true
        self.navigationController?.popViewController(animated: true)
    }
    
    func navigationNotificationAction() {
        let vc = UIStoryboard(name: "Notification", bundle: nil).instantiateViewController(withIdentifier: "NotificationVC")as!NotificationVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func navigationSearchAction() {
        let vc = UIStoryboard(name: "Search", bundle: nil).instantiateViewController(withIdentifier: "SearchVC")as! SearchVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func naviagtionProfileAction() {
        let vc = UIStoryboard(name: "Profile", bundle: nil).instantiateViewController(withIdentifier: "ProfileVC")as! ProfileVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
