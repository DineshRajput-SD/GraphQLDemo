//
//  MemberDirectoryVC.swift
//  Vidhik
//
//  Created by NumeroEins on 09/02/24.
//

import UIKit

class MemberDirectoryVC: UIViewController {
    
    //MARK: ======================  IBOutlet Properties ======================
    @IBOutlet weak var navigationView: NavigationBarView!
    @IBOutlet weak var lblMemberDirectoryHeading: UILabel!
    @IBOutlet weak var lblMemberDirectorySubHeading: UILabel!
    @IBOutlet weak var btnAddMember: UIButton!
    @IBOutlet weak var imgMemberDirectory: UIImageView!
    
    //MARK: ====================== View Contoller Life Cycle Method ======================
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpUi()
    }
    
    //MARK: ====================== Private Method Setup UI Navigation Bar Title ======================
    private func setUpUi() {
        self.navigationView.delegate = self
        self.navigationView.lblTitle.text = "Members"
    }
    
    //MARK: ====================== IBAction Method ======================
    @IBAction func btnAddMemberAction(_ sender: UIButton) {
        let vc = UIStoryboard(name: "Member", bundle: nil).instantiateViewController(withIdentifier: "MemberListVC")as! MemberListVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

//MARK: ======================   Extension NavigationBarView Delegate Methods ======================
extension MemberDirectoryVC: NavigationBarViewDelegate {
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
