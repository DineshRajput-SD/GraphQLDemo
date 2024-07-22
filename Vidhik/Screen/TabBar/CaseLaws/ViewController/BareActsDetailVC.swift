//
//  BareActsDetailVC.swift
//  Vidhik
//
//  Created by NumeroEins on 29/02/24.
//

import UIKit

class BareActsDetailVC: UIViewController {
    
    //MARK: ===================== IBOutlet Properties =====================
    @IBOutlet weak var navigationView: NavigationBarView!
    @IBOutlet weak var lblBareActsName: UILabel!
    @IBOutlet weak var txtSelectedSection: UITextField!
    @IBOutlet weak var sectionTableView: UITableView!
    @IBOutlet weak var sectionDropDownView: DropDownViewWithSearch!
    @IBOutlet weak var sectionDropDownViewHeight: NSLayoutConstraint!
    
    var checkUserType = ApplicationPreference.getcheckUserType()
    var dummyData = [["title": "S.1: Title and extent of operation of the Code.", "description": "This Act shall be called the Indian Penal code, and shall 1 [extend to the whole of India 2***].1. The Original words have successively been amended by Act 12 of 1891, s. 2 and Sch. I, the A.O. 1937,the A.O. 1948 and the A.O. 1950 to read as above. 2. The words,except the State of Jammu and Kashmir omitted by Act 34 of 2019, s. 95 and the Fifth Schedule (w.e.f. 31-10-2019)."],
                     ["title": "S.2: Title and extent of operation of the Code.", "description": "This Act shall be called the Indian Penal code, and shall 1 [extend to the whole of India 2***].1. The Original words have successively been amended by Act 12 of 1891, s. 2 and Sch. I, the A.O. 1937,the A.O. 1948 and the A.O. 1950 to read as above. 2. The words,except the State of Jammu and Kashmir omitted by Act 34 of 2019, s. 95 and the Fifth Schedule (w.e.f. 31-10-2019)."]]
    var arrData = ["Section Name", "Section Name", "Section Name", "Section Name", "Section Name", "Section Name", "Section Name", "Section Name", "Section Name", "Section Name", "Section Name", "Section Name"]
    
    // MARK: ======================== View Controller Life Cycle Method ========================
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
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
        self.sectionTableView.dataSource = self
        self.sectionTableView.delegate = self
        self.sectionTableView.register(UINib(nibName: "BareActsDetailTableViewCell", bundle: nil), forCellReuseIdentifier: "BareActsDetailTableViewCell")
    }
    
    private func setupUI() {
        self.sectionDropDownView.isHidden = true
    }
    
    //MARK: ===================== IBAction =====================
    @IBAction func btnSelectSectionAction(_ sender: UIButton) {
        sectionDropDownViewHeight.constant = 300
        sectionDropDownView.tableData = arrData
        sectionDropDownView.dropDownTable.reloadData()
        sectionDropDownView.isHidden = false
        sectionDropDownView.txtSearch.placeholder = "Select section"
        
        self.sectionDropDownView.closerForbackVC = { sttr in
            self.txtSelectedSection.text = self.sectionDropDownView.selectedItemText
            self.sectionDropDownView.isHidden = true
        }
    }
}

//MARK: ===================== Extension =====================
extension BareActsDetailVC: NavigationBarViewDelegate {
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

//MARK: ===================== UITableViewDataSource, UITableViewDelegate =====================
extension BareActsDetailVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        dummyData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.sectionTableView.dequeueReusableCell(withIdentifier: "BareActsDetailTableViewCell", for: indexPath) as! BareActsDetailTableViewCell
        let data = dummyData[indexPath.row]
        cell.lblSectionTitle.text = data["title"]
        cell.lblSectionDescription.text = data["description"]
        return cell
    }
}
