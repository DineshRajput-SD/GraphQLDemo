//
//  ContactUsVC.swift
//  Vidhik
//
//  Created by NumeroEins on 07/03/24.
//

import UIKit

class ContactUsVC: UIViewController {

    //MARK: =============================== IBOutlets ===============================
    @IBOutlet weak var navigationView: NavigationBarView!
    @IBOutlet weak var contactUsTableView: UITableView!
    @IBOutlet weak var btnRaiseTicket: UIButton!
    
    var isBackButtonHide: Bool?
    
    //MARK: =============================== View Controoler Life Cycle Methods ===============================
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpNaviagtionBar()
        self.setUpTableView()
        self.btnRaiseTicket.layer.cornerRadius = 12
        navigationView.btnBack.isHidden = isBackButtonHide == true ? true : false
    }
    
    //MARK: =============================== Private Method SetUp Navigation Bar Title ===============================
    private func setUpNaviagtionBar() {
        self.navigationView.delegate = self
        self.navigationView.lblTitle.text = "Contact Us"
        self.navigationView.btnNotification.isHidden = true
        self.navigationView.btnSearch.isHidden =  true
        self.navigationView.btnProfile.isHidden = true
        tabBarController?.tabBar.isHidden = false
    }
    
    private func setUpTableView() {
        self.contactUsTableView.dataSource = self
        self.contactUsTableView.delegate = self
    }
    
    //MARK: =============================== IBAction ===============================
    @IBAction func btnRaiseTicketAction(_ sender: UIButton) {
        let vc = UIStoryboard(name: "ContactUs", bundle: nil).instantiateViewController(withIdentifier: "RaiseTicketVC")as! RaiseTicketVC
        self.navigationController?.pushViewController(vc, animated: true)
    }

}

//MARK: =============================== UITableViewDelegate, UITableViewDataSource ===============================
extension ContactUsVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let issuesCell = contactUsTableView.dequeueReusableCell(withIdentifier: "IssuesTableViewCell", for: indexPath) as! IssuesTableViewCell
        issuesCell.lblStatus.layer.cornerRadius = 12
        issuesCell.lblStatus.layer.masksToBounds = true
        return issuesCell
    }
}

//MARK: =============================== Extension ===============================
extension ContactUsVC: NavigationBarViewDelegate {
    func navigationBackAction() {
        print("Button back clicked")
        tabBarController?.tabBar.isHidden = true
        self.navigationController?.popViewController(animated: true)
    }
    
    func navigationNotificationAction() { }
    
    func navigationSearchAction() { }
    
    func naviagtionProfileAction() { }
}
