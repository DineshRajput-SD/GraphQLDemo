//
//  LegalCaseRepository.swift
//  Vidhik
//
//  Created by NumeroEins on 08/02/24.
//

import UIKit

class LegalCaseRepository: UIViewController {
    
    // MARK: ==================== IBoutlest Properties ====================
    @IBOutlet weak var navigationView: NavigationBarView!
    @IBOutlet weak var lblHeading: UILabel!
    @IBOutlet weak var lblSubHeading: UILabel!
    @IBOutlet weak var btnCreate: UIButton!
    @IBOutlet weak var imgLeaglCasesRepo: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpUi()
        
    }
    
    //MARK: ==================== Private Method Setup UI Navigation Title ====================
    private func setUpUi() {
        self.navigationView.delegate = self
        self.navigationView.lblTitle.text = "Case Dairy"
    }
    
    //MARK: ==================== IBActions Methods ====================
    @IBAction func btnCreateAction(_ sender: UIButton) {
        let vc = UIStoryboard(name: "CaseDairy", bundle: nil).instantiateViewController(withIdentifier: "CreateCaseDairyVC")as! CreateCaseDairyVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

//MARK: ==================== NavigationBarView Delegate Methods ====================
extension LegalCaseRepository: NavigationBarViewDelegate {
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
