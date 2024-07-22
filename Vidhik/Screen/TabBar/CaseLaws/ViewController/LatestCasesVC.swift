//
//  LatestCasesVC.swift
//  Vidhik
//
//  Created by NumeroEins on 01/02/24.
//

import UIKit

class LatestCasesVC: UIViewController {
    
    //MARK: =========================== IBOutlet Properties ===========================
    @IBOutlet weak var navigationView: NavigationBarView!
    @IBOutlet weak var lblFoundCases: UILabel!
    @IBOutlet weak var btnSort: UIButton!
    @IBOutlet weak var btnFilter: UIButton!
    @IBOutlet weak var latestCasesTableView: UITableView!
    @IBOutlet weak var viewTriangle: UIView!
    @IBOutlet weak var viewSort: CustomSortView!
    @IBOutlet weak var viewTriangleFilter: UIView!
    @IBOutlet weak var viewFilter: CustomFilterView!
    
    var isHidden = false
    var ishiddenSort = true
    var checkUserType = ApplicationPreference.getcheckUserType()

    // MARK: =========================== View Controller Life Cycle Method ===========================
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpNaviagtionBar()
        self.setUpTableView()
        self.showCustomSortView(bool: true)
        self.viewTriangleFilter.isHidden = true
        self.viewFilter.isHidden = true
        self.hideChatOptions()
    }
    
    private func setUpNaviagtionBar() {
        self.navigationView.delegate = self
        self.navigationView.lblTitle.text = "Latest Cases"
        navigationView.btnSearch.isHidden = checkUserType == "Lawyer" ? false : true
        navigationView.btnNotification.isHidden = checkUserType == "Lawyer" ? false : true
        navigationView.btnProfile.isHidden = checkUserType == "Lawyer" ? false : true
    }
    
    private func setUpTableView() {
        self.latestCasesTableView.delegate = self
        self.latestCasesTableView.dataSource = self
        self.latestCasesTableView.register(UINib(nibName: "LatestCasesTableViewCell", bundle: nil), forCellReuseIdentifier: "LatestCasesTableViewCell")
    }
    
    private func showCustomSortView(bool: Bool) {
        self.viewSort.layer.cornerRadius = 12
        self.viewTriangle.isHidden = bool
        self.viewSort.isHidden = bool
        setUpTriangle(targetView: viewTriangle)
        addShadow(view: viewTriangle, shadowOpacity: 0.5)
        addShadow(view: viewSort, shadowOpacity: 0.5)
        
        viewSort.callbackForRecent = {
            print("Recent")
        }
        
        viewSort.callBackForRelevance = {
            print("Relevance")
        }
        
        viewSort.callbackForMostCited = {
            print("Most Cited")
        }
        
        viewSort.callBackForJudgeBench = {
            print("Judge Bench")
        }
       
    }
    
    private func showCustomFilterView(bool: Bool) {
        self.viewFilter.layer.cornerRadius = 12
        self.viewTriangleFilter.isHidden = bool
        self.viewFilter.isHidden = bool
        setUpTriangle(targetView: viewTriangleFilter)
        addShadow(view: viewTriangleFilter, shadowOpacity: 0.5)
        addShadow(view: viewFilter, shadowOpacity:  0.5)
        
        viewFilter.callBackForDone = {
            
        }
        
        viewFilter.callBackForClear = {
            
        }
    }
    
    private func hideChatOptions() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
        view.addGestureRecognizer(tapGesture)
    }
    
    @objc func handleTap(_ sender: UITapGestureRecognizer) {
        self.viewSort.isHidden = true
        self.viewTriangle.isHidden = true
        self.viewFilter.isHidden = true
        self.viewTriangleFilter.isHidden = true
    }
    
    
    //MARK: =========================== IBAction ===========================
    @IBAction func btnSortAction(_ sender: UIButton) {
        if ishiddenSort == true {
            self.ishiddenSort = false
            self.showCustomSortView(bool: false)
            self.viewTriangleFilter.isHidden = true
            self.viewFilter.isHidden = true
        } else {
            self.ishiddenSort = true
            self.showCustomSortView(bool: true)
            self.viewTriangleFilter.isHidden = true
            self.viewFilter.isHidden = true
        }
    }
    
    @IBAction func btnFilterAction(_ sender: UIButton) {
        if isHidden == false {
            isHidden = true
            showCustomFilterView(bool: false)
            self.viewTriangle.isHidden = true
            self.viewSort.isHidden = true
        } else {
            isHidden = false
            showCustomFilterView(bool: true)
            self.viewTriangle.isHidden = true
            self.viewSort.isHidden = true
        }
    }
    
    @objc func btnViewMoreAction() {
        let latestCaseDetailVC = self.storyboard?.instantiateViewController(identifier: "LatestCasesDetailVC") as! LatestCasesDetailVC
        self.navigationController?.pushViewController(latestCaseDetailVC, animated: true)
    }
    
}

//MARK: =========================== UITableView DataSource, UITableView Delegate Methods ===========================
extension LatestCasesVC: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.latestCasesTableView.dequeueReusableCell(withIdentifier: "LatestCasesTableViewCell") as! LatestCasesTableViewCell
        cell.lblCaseDescription.text = "Electricity Act 2003 - Section 86(1)(a) read with section 62 - Recovery of deduction of monthly tarrif - Discrepancy in term of yield loss of quality of washed cool usually heppens when good quality of cool was diverted under grab of reject in washing process.."
        cell.lblActsName.text = "ELECTRICITY ACT: S62S.86(1)(a), ELECTRICITY ACT: S62S.86(1)(a), ELECTRICITY ACT: S62S.86(1)(a), ELECTRICITY ACT: S62S.86(1)(a)"
        cell.btnViewMore.addTarget(nil, action: #selector(btnViewMoreAction), for: .touchUpInside)
        cell.lblCaseTitle.isUserInteractionEnabled = true
                let tapGesture = UITapGestureRecognizer(target: self, action: #selector(btnViewMoreAction))
        cell.lblCaseTitle.addGestureRecognizer(tapGesture)
        return cell
    }
}

// MARK: =========================== NavigationBarView Delegate Methods ===========================
extension LatestCasesVC: NavigationBarViewDelegate {
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

