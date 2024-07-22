//
//  NotificationVC.swift
//  Vidhik
//
//  Created by NumeroEins on 09/02/24.
//

import UIKit

class NotificationVC: UIViewController {
    
    // MARK: ======================= IBoutlets Properties =======================
    @IBOutlet weak var tblNotificationList: UITableView!
    @IBOutlet weak var navigationView: NavigationBarView!
    
    // MARK: ======================= View Controller Life Cycle Methods =======================
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpNaviagtionBar()
        self.tblNotificationList.register(UINib(nibName: "NotificationCell", bundle: nil), forCellReuseIdentifier: "NotificationCell")
        self.tblNotificationList.reloadData()
    }
    
    private func setUpNaviagtionBar() {
        self.navigationView.delegate = self
        self.navigationView.lblTitle.text = "Notification"
        self.navigationView.btnSearch.isHidden = true
        self.navigationView.btnProfile.isHidden = true
        self.navigationView.btnNotification.isHidden = true
    }
    
}

//MARK:  ======================= Extenstion  UITableView DataSource And Delegate Methods =======================
extension NotificationVC: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tblNotificationList.dequeueReusableCell(withIdentifier: "NotificationCell", for: indexPath)as! NotificationCell
        cell.imgUser.image = UIImage(named: "Apoorv Pandey")
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tblNotificationList.dequeueReusableCell(withIdentifier: "NotificationCell", for: indexPath)as! NotificationCell
        print(cell)
        
        let RequestAddRejectVC = UIStoryboard(name: "Notification", bundle: nil) .instantiateViewController(identifier: "RequestAddReject") as! RequestAddReject
        RequestAddRejectVC.modalPresentationStyle = .overCurrentContext
        RequestAddRejectVC.view.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        self.tabBarController?.tabBar.isHidden = true
        
        RequestAddRejectVC.closerForbackVC = {  strdict in
            self.tabBarController?.tabBar.isHidden = false
        }
        navigationController?.present(RequestAddRejectVC, animated: false)
    }
    
}

//MARK: ======================= Extension NavigationBarViewDelegate Methods =======================
extension NotificationVC: NavigationBarViewDelegate {
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
