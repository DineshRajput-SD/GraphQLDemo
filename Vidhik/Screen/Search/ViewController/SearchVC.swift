//
//  SearchVC.swift
//  Vidhik
//
//  Created by NumeroEins on 26/02/24.
//

import UIKit

class SearchVC: UIViewController {
    //MARK: ================ IBOutlet ================
    @IBOutlet weak var navigationView: NavigationBarView!
    @IBOutlet weak var txtSearch: UITextField!
    @IBOutlet weak var btnClearSearchText: UIButton!
    @IBOutlet weak var caseLawsCollection: UICollectionView!
    @IBOutlet weak var casesTableView: UITableView!
    
    var checkUserType = ApplicationPreference.getcheckUserType()
    var caselaws = ["Latest Cases", "App/Resp", "Judge Wise", "Citation Wise", "Bare Acts", "Act & Section Wise", "Words & Phrases", "Overruled", "Universal Search", "Advance Search"]
    
    //MARK: ================ View Controller Life Cycle Method ================
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpNaviagtionBar()
        self.setCollectionView()
        self.setTableView()
    }
    
    //MARK: ================ Private Methods Setup Navigation Bar Title ================
    private func setUpNaviagtionBar() {
        self.navigationView.delegate = self
        self.navigationView.lblTitle.text = "Search"
        navigationView.btnSearch.isHidden = checkUserType == "Lawyer" ? false : true
        navigationView.btnNotification.isHidden = checkUserType == "Lawyer" ? false : true
        navigationView.btnProfile.isHidden = checkUserType == "Lawyer" ? false : true
    }
    
    private func setCollectionView() {
        self.caseLawsCollection.delegate = self
        self.caseLawsCollection.dataSource = self
    }
    
    private func setTableView() {
        self.casesTableView.delegate = self
        self.casesTableView.dataSource = self
        self.casesTableView.register(UINib(nibName: "LatestCasesTableViewCell", bundle: nil), forCellReuseIdentifier: "LatestCasesTableViewCell")
    }
    
    //MARK: ============= IBAction =============
    @IBAction func btnClearTextAction(_ sender: UIButton) {
    }
}

//MARK: ============== Extension =================
extension SearchVC: NavigationBarViewDelegate {
    func navigationBackAction() {
        self.navigationController?.popViewController(animated: true)
    }
    
    func navigationNotificationAction() {
        let vc = UIStoryboard(name: "Notification", bundle: nil).instantiateViewController(withIdentifier: "NotificationVC")as!NotificationVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func navigationSearchAction() { }
    
    func naviagtionProfileAction() {
        let vc = UIStoryboard(name: "Profile", bundle: nil).instantiateViewController(withIdentifier: "ProfileVC")as! ProfileVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
}


//MARK: ======================== UICollectionView Delegate, DataSource ================
extension SearchVC: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        caselaws.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = caseLawsCollection.dequeueReusableCell(withReuseIdentifier: "CaseLawsCollectionCell", for: indexPath) as! CaseLawsCollectionCell
        cell.lblCaseLaws.text = caselaws[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = caseLawsCollection.dequeueReusableCell(withReuseIdentifier: "CaseLawsCollectionCell", for: indexPath) as! CaseLawsCollectionCell
        cell.isSelected = true
    }
}

//MARK:  ======================== UITableViewDelegate, UITableViewDataSource  ========================
extension SearchVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.casesTableView.dequeueReusableCell(withIdentifier: "LatestCasesTableViewCell") as! LatestCasesTableViewCell
        cell.lblCaseDescription.text = "Electricity Act 2003 - Section 86(1)(a) read with section 62 - Recovery of deduction of monthly tarrif - Discrepancy in term of yield loss of quality of washed cool usually heppens when good quality of cool was diverted under grab of reject in washing process.."
        cell.lblActsName.text = "ELECTRICITY ACT: S62S.86(1)(a), ELECTRICITY ACT: S62S.86(1)(a), ELECTRICITY ACT: S62S.86(1)(a), ELECTRICITY ACT: S62S.86(1)(a)"
        cell.btnViewMore.addTarget(nil, action: #selector(btnViewMoreAction), for: .touchUpInside)
        cell.lblCaseTitle.isUserInteractionEnabled = true
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(btnViewMoreAction))
        cell.lblCaseTitle.addGestureRecognizer(tapGesture)
        return cell
    }
    
    @objc func btnViewMoreAction() {
        let latestCaseDetailVC = UIStoryboard(name: "CaseLaws", bundle: nil).instantiateViewController(withIdentifier: "LatestCasesDetailVC")as! LatestCasesDetailVC
        self.navigationController?.pushViewController(latestCaseDetailVC, animated: true)
    }
    
}
