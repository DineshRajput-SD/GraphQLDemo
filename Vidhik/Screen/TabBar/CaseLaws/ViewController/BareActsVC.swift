//
//  BareActsVC.swift
//  Vidhik
//
//  Created by NumeroEins on 07/02/24.
//

import UIKit

class BareActsVC: UIViewController {
    
    //MARK: ============================== IBOutlet ==============================
    @IBOutlet weak var navigationView: NavigationBarView!
    @IBOutlet weak var txtSearch: UITextField!
    @IBOutlet weak var btnSearch: UIButton!
    @IBOutlet weak var bareActsTableView: UITableView!
    
    var checkUserType = ApplicationPreference.getcheckUserType()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpNaviagtionBar()
        self.setUpTableView()
    }
    
    private func setUpNaviagtionBar() {
        self.navigationView.delegate = self
        self.navigationView.lblTitle.text = "Bare Acts"
        navigationView.btnSearch.isHidden = checkUserType == "Lawyer" ? false : true
        navigationView.btnNotification.isHidden = checkUserType == "Lawyer" ? false : true
        navigationView.btnProfile.isHidden = checkUserType == "Lawyer" ? false : true
    }
    
    private func setUpTableView() {
        self.bareActsTableView.dataSource = self
        self.bareActsTableView.delegate = self
    }
    
    //MARK:  ============================== IBAction  ==============================
    @IBAction func btnSearchAction(_ sender: UIButton) {
        let vc = UIStoryboard(name: "CaseLaws", bundle: nil).instantiateViewController(withIdentifier: "LatestCasesVC")as!LatestCasesVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

//MARK: ============================== UITableViewDataSource, UITableViewDelegate ==============================
extension BareActsVC: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.bareActsTableView.dequeueReusableCell(withIdentifier: "BareActsTableViewCell", for: indexPath) as! BareActsTableViewCell
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = UIStoryboard(name: "CaseLaws", bundle: nil).instantiateViewController(withIdentifier: "BareActsDetailVC")as! BareActsDetailVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}

//MARK: ============================== Extension NavigationBarView Delegate Methods ==============================
extension BareActsVC: NavigationBarViewDelegate {
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
