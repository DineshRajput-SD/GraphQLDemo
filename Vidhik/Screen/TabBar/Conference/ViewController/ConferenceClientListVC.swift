//
//  ConferenceClientList.swift
//  Vidhik
//
//  Created by NumeroEins on 21/02/24.
//

import UIKit

class ConferenceClientListVC: UIViewController {
    
    //MARK: =================== IBOutlet Properties ===================
    @IBOutlet weak var navigationView: NavigationBarView!
    @IBOutlet weak var clientListTableView: UITableView!
    
    var arrDummyName = ["Anil Soni", "Nitin Naiwal"]
    var arr =  [ConferenceClientListModel]()
    var checkUserType = ApplicationPreference.getcheckUserType()
    var isBackButtonHide: Bool?
    
    //MARK: =================== View Controller Life Cycle Method ===================
    override func viewDidLoad() {
        super.viewDidLoad()
        tabBarController?.tabBar.isHidden = false
        self.setUpNaviagtionBar()
        self.setUpTableView()
        for i in arrDummyName{
            let dict = ["name": i] as [String : Any]
            let obj = ConferenceClientListModel.init(dict: dict)
            self.arr.append(obj)
        }
    }
    
    //MARK: =================== Private Method Setup Navigation Bar Title ===================
    private func setUpNaviagtionBar() {
        self.navigationView.delegate = self
        self.navigationView.lblTitle.text = "Conference"
        navigationView.btnBack.isHidden = isBackButtonHide == true ? true : false
        navigationView.btnSearch.isHidden =  checkUserType == "Lawyer" ? false : true
        navigationView.btnNotification.isHidden =  checkUserType == "Lawyer" ? false : true
        navigationView.btnProfile.isHidden =  checkUserType == "Lawyer" ? false : true
    }
    
    private func setUpTableView() {
        self.clientListTableView.delegate = self
        self.clientListTableView.dataSource = self
        self.clientListTableView.register(UINib(nibName: "ConferenceTableViewCell", bundle: nil), forCellReuseIdentifier: "ConferenceTableViewCell")
    }
    
}

//MARK: =================== UITableViewDelegate, UITableViewDataSource ===================
extension ConferenceClientListVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        arrDummyName.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = clientListTableView.dequeueReusableCell(withIdentifier: "ConferenceTableViewCell", for: indexPath) as! ConferenceTableViewCell
        let obj = arr[indexPath.row]
        
        cell.hiddenView.isHidden = obj.isHidden == false ? false : true
        cell.imgDownUp.image = obj.isHidden == false ? UIImage(named: "BlueUpArrow") : UIImage(named: "BlueDownArrow")
        cell.btnJoin.layer.cornerRadius = 12
        cell.btnJoin.tag = indexPath.row
        cell.btnJoin.addTarget(self, action: #selector(btnJoinAction), for: .touchUpInside)
        return  cell
    }
    
    @objc func btnJoinAction(sender:UIButton) {
        self.tabBarController?.tabBar.isHidden = true
        let joinConferencePopup = JoinConferencePopup.showJoinConferenceView(onview: view) {
            print("Join Conference Popup")
        }
        
        joinConferencePopup.callbackJoinConferenceButton = {
            let callVC = UIStoryboard(name: "Conference", bundle: nil).instantiateViewController(withIdentifier: "ConferenceCallVC")as! ConferenceCallVC
            
            callVC.closerForbackVC = {  strdict in
                self.tabBarController?.tabBar.isHidden = false
            }
            self.navigationController?.pushViewController(callVC, animated: true)
        }
        
        joinConferencePopup.callbackBackButton = {
            self.tabBarController?.tabBar.isHidden = false
        }
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ConferenceTableViewCell", for: indexPath)as! ConferenceTableViewCell
        print(cell)
        let obj = arr[indexPath.row]
        if obj.isHidden == true {
            obj.isHidden = false
        } else {
            obj.isHidden = true
        }
        self.clientListTableView.reloadData()
    }
}

//MARK: =================== Extension NavigationBarView Delegate Methods ===================
extension ConferenceClientListVC: NavigationBarViewDelegate {
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
