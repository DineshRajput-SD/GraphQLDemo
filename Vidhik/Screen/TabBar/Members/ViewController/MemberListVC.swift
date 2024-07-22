//
//  MemberListVC.swift
//  Vidhik
//
//  Created by NumeroEins on 09/02/24.
//

import UIKit
import SDWebImage

class MemberListVC: UIViewController {
    
    //MARK: ====================== IBOutlet ======================
    @IBOutlet weak var navigationView: NavigationBarView!
    @IBOutlet weak var btnAddMember: UIButton!
    @IBOutlet weak var tblMemberList: UITableView!
    
    var arrDummyName = ["Apoorv Pandey","Archana Upadhayay","Bhushan Singh","Kunal Thakre","Manika Da","Jaya Jain"]
    var arr =  [MemberModel]()
    
    //MARK: ====================== View Contoller Life Cycle Method ======================
    override func viewDidLoad() {
        super.viewDidLoad()
        for i in arrDummyName{
            let dict = ["name": i ] as [String : Any]
            let obj = MemberModel.init(dict: dict)
            self.arr.append(obj)
        }
        self.tblMemberList.register(UINib(nibName: "MemberCell", bundle: nil), forCellReuseIdentifier: "MemberCell")
        self.setUpNaviagtionBar()
    }
    
    private func setUpNaviagtionBar() {
        self.navigationView.delegate = self
        self.navigationView.lblTitle.text = "Members"
    }
    
    //MARK: ====================== IBAction Method ======================
    @IBAction func btnAddMemberAction(_ sender: UIButton) {
        let AddMemberVC = UIStoryboard(name: "Member", bundle: nil) .instantiateViewController(identifier: "AddMemberVC") as! AddMemberVC
        AddMemberVC.modalPresentationStyle = .overCurrentContext
        AddMemberVC.view.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        self.tabBarController?.tabBar.isHidden = true
        
        AddMemberVC.closerForbackVC = {  strdict in
            self.tabBarController?.tabBar.isHidden = false
        }
        navigationController?.present(AddMemberVC, animated: false)
    }
}

// MARK:  ======================= UITableView DataSource & Delegate Methods =======================
extension MemberListVC: UITableViewDataSource,UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.arr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MemberCell", for: indexPath)as! MemberCell
        
        let obj = arr[indexPath.row]
        cell.lblMemberName.text = obj.strName
        cell.hiddenView.isHidden = obj.isHidden  == false ? false : true
        cell.Vwline.isHidden = obj.isHidden  == false ? true : false
        cell.imgDownUp.image = obj.isHidden  == false ? UIImage(named: "BlueUpArrow") : UIImage(named: "BlueDownArrow")
        cell.btnDelete.tag = indexPath.row
        cell.btnDelete.addTarget(self, action: #selector(btnDeleteAction), for: .touchUpInside)
        cell.imgUser.image = UIImage(named: "Apoorv Pandey")
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MemberCell", for: indexPath)as! MemberCell
        print(cell)
        let obj = arr[indexPath.row]
        obj.isHidden = obj.isHidden == true ? false : true
        self.tblMemberList.reloadData()
    }
    
    @objc func btnDeleteAction(sender:UIButton){
        
    }
    
    @objc func btnEditAction(sender:UIButton){
        self.navigationController?.popViewController(animated: true)
    }
}

//MARK: ====================== Extension NavigationBarView Delegate Methods ======================
extension MemberListVC: NavigationBarViewDelegate {
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

