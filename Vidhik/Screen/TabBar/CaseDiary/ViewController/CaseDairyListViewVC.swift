//
//  CaseDairyListViewVC.swift
//  Vidhik
//
//  Created by NumeroEins on 08/02/24.
//

import UIKit
import DropDown

class CaseDairyListViewVC: UIViewController , UIDocumentInteractionControllerDelegate {
    
    //MARK: =========================== IBOutlet Properties ===========================
    @IBOutlet weak var navigationView: NavigationBarView!
    @IBOutlet weak var vwCaseDaairy: UIView!
    @IBOutlet weak var vwCreateSubDairy: UIView!
    @IBOutlet weak var lblCaseDairy: UILabel!
    @IBOutlet weak var lblCreateCaseDairy: UILabel!
    @IBOutlet weak var lblCreateSubDairy: UILabel!
    @IBOutlet weak var imgCaseDairyPencil: UIImageView!
    @IBOutlet weak var imgCaseDairyDropDown: UIImageView!
    @IBOutlet weak var imgCreateSubDairy: UIImageView!
    @IBOutlet weak var tblList: UITableView!
    @IBOutlet weak var vwTble: UIView!
    
    var ishidden = true
    let dropDown = DropDown()
    var arrDummyName = ["Property Case","Aarushi Talwar Murder Case","Nirbhaya Gang Rape Case","Vijay Mallya Fraud Case","Adarsh Housing Society Scam","2G Spectrum Scam","Jessica Lal Murder Case","Babri Masjid Demolition Case","Saradha Group Financial Scam","Rhea Chakraborty Drug Case"]
    var arrselectCase = ["Case Dairy", "Sub Dairy"]
    var arr =  [CaseDairyModel]()
    
    //MARK: =========================== View Controller Life Cycle Method ===========================
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for i in arrDummyName{
            let dict = ["name": i] as [String : Any]
            let obj = CaseDairyModel.init(dict: dict)
            self.arr.append(obj)
        }
        self.lblCaseDairy.text = "Case Dairy"
        self.tblList.register(UINib(nibName: "CaseDairyCell", bundle: nil), forCellReuseIdentifier: "CaseDairyCell")
        self.setUpNaviagtionBar()
    }
    
    //MARK: =========================== Private Method Setup UI Navigation Bar Title ===========================
    private func setUpNaviagtionBar() {
        self.vwCaseDaairy.layer.borderWidth = 0.5
        self.vwCaseDaairy.layer.borderColor = UIColor.gray.cgColor
        self.vwCaseDaairy.layer.cornerRadius = 10
        self.navigationView.delegate = self
        self.navigationView.lblTitle.text = "Case Dairy"
    }
    
    //MARK: =========================== IBActions Methods ===========================
    @IBAction func btnCreateSubDairyAction(_ sender: UIButton) {
        let vc = UIStoryboard(name: "CaseDairy", bundle: nil).instantiateViewController(withIdentifier: "CreateSubDairy")as! CreateSubDairy
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func btnSelectCaseAction(_ sender: UIButton) {
        self.dropDown.dataSource = self.arrselectCase
        dropDown.direction = .bottom
        dropDown.anchorView =  self.vwCaseDaairy   // Replace with the actual button or view you want to anchor to
        dropDown.show()
        // Set the dropdown direction
        // Set a selection action (optional)
        dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
            print("Selected item: \(item) at index \(index)")
            self.lblCaseDairy.text = item
            self.tblList.reloadData()
        }
    }
    
}

//MARK: =========================== UITableView DataSource & Delegate Methods ===========================
extension CaseDairyListViewVC: UITableViewDataSource,UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.arr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CaseDairyCell", for: indexPath)as! CaseDairyCell
        
        let obj = arr[indexPath.row]
        cell.lblCaseName.text = obj.strName
        cell.hiddenView.isHidden = obj.isHidden == false ? false : true
        cell.imgDownUp.image = obj.isHidden == false ? UIImage(named: "BlueUpArrow") : UIImage(named: "BlueDownArrow")
        cell.lblOwnerAndAssignTxt.text = self.lblCaseDairy.text == "Case Dairy" ? "OWNER" : "ASSIGNED TO"
        cell.lblOwnerAndAssign.text = self.lblCaseDairy.text == "Case Dairy" ? "Self" : "Ram Kumar"
        cell.btnViewApplication.tag = indexPath.row
        cell.btnViewApplication.addTarget(self, action: #selector(btnViewAppicationActtions), for: .touchUpInside)
        cell.btnEdit.tag = indexPath.row
        cell.btnEdit.addTarget(self, action: #selector(btnEditAction), for: .touchUpInside)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CaseDairyCell", for: indexPath)as! CaseDairyCell
        print(cell)
        let obj = arr[indexPath.row]
        if obj.isHidden == true {
            obj.isHidden = false
        } else {
            obj.isHidden = true
        }
        self.tblList.reloadData()
    }
    
    
    @objc func btnViewAppicationActtions(sender:UIButton){
        let vc = UIStoryboard(name: "CaseDairy", bundle: nil).instantiateViewController(withIdentifier: "ApplicationViewVC")as! ApplicationViewVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func btnEditAction(sender:UIButton){
        self.navigationController?.popViewController(animated: true)
    }
}

//MARK: =========================== Extension NavigationBarView Delegate Methods ===========================
extension CaseDairyListViewVC: NavigationBarViewDelegate {
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
