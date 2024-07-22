//
//  ApplicationViewVC.swift
//  Vidhik
//
//  Created by NumeroEins on 08/02/24.
//

import UIKit

class ApplicationViewVC: UIViewController {

    //MARK: =========================== IBOutlet Properties ===========================
    @IBOutlet weak var navigationView: NavigationBarView!
    @IBOutlet weak var btnShare: UIButton!
    @IBOutlet weak var viewTriangle: UIView!
    @IBOutlet weak var viewShareOptions: UIView!
    @IBOutlet weak var btnWhatsAppShare: UIButton!
    @IBOutlet weak var btnEmailShare: UIButton!
    @IBOutlet weak var btnPDF: UIButton!
    @IBOutlet weak var btnPrint: UIButton!
    @IBOutlet weak var lblJudge: UILabel!
    @IBOutlet weak var lblCaseNo: UILabel!
    @IBOutlet weak var lblHearingDate: UILabel!
    @IBOutlet weak var lblCriminal: UILabel!
    @IBOutlet weak var lblApplicantName: UILabel!
    @IBOutlet weak var lblRespondentName: UILabel!
    @IBOutlet weak var lblSection: UILabel!
    @IBOutlet weak var lblAbsentReason: UILabel!
    @IBOutlet weak var lblCity: UILabel!
    
    var str = "Out of Station"
    
    //MARK: =========================== View Controller Life Cycle Method ===========================
    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewTriangle.isHidden = true
        self.viewShareOptions.isHidden = true
        self.setUpNaviagtionBar()
        self.lblAbsentReason.text = "2. Applicant responded is \(str) Today."
    }
    
    private func setUpNaviagtionBar() {
        self.navigationView.delegate = self
        self.navigationView.lblTitle.text = "Case Dairy"
    }
    
    //MARK: =========================== IBAction Methods ===========================
    @IBAction func btnShareAction(_ sender: UIButton) {
        self.viewShareOptions.layer.cornerRadius = 12
        self.viewTriangle.isHidden = false
        self.viewShareOptions.isHidden = false
        setUpTriangle(targetView: viewTriangle)
        addShadow(view: viewTriangle, shadowOpacity: 0.5)
        addShadow(view: viewShareOptions, shadowOpacity: 0.5)
    }
    
    @IBAction func btnWhatsAppShareAction(_ sender: UIButton) {
        
    }
    
    @IBAction func btnEmailShareAction(_ sender: UIButton) {
        
    }
    
    @IBAction func btnPDFAction(_ sender: UIButton) {
        
    }
    
    @IBAction func btnPrintAction(_ sender: UIButton) {
        
    }
    
}

//MARK: =========================== Extension ===========================
extension ApplicationViewVC: NavigationBarViewDelegate {
    func navigationBackAction() {
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
