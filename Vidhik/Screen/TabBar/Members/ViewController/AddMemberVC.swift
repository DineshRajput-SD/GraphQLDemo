//
//  AddMemberVC.swift
//  Vidhik
//
//  Created by NumeroEins on 09/02/24.
//

import UIKit

class AddMemberVC: UIViewController {
    //MARK: ====================== IBOutlet Properties ======================
    @IBOutlet weak var addMemberView: UIView!
    @IBOutlet weak var btncancel: UIButton!
    @IBOutlet weak var txtSearch: UITextField!
    @IBOutlet weak var btnSearch: UIButton!
    @IBOutlet weak var btnFilter: UIButton!
    @IBOutlet weak var filterView: UIView!
    @IBOutlet weak var membersTableView: UITableView!
    @IBOutlet weak var txtSelectPlace: UITextField!
    @IBOutlet weak var btnSelectPlaceDropDown: UIButton!
    @IBOutlet weak var txtSelectField: UITextField!
    @IBOutlet weak var btnPopularity: UIButton!
    @IBOutlet weak var btnBestReview: UIButton!
    @IBOutlet weak var btnStarRating: UIButton!
    @IBOutlet weak var btnMostReview: UIButton!
    @IBOutlet weak var btnAnyExp: UIButton!
    @IBOutlet weak var btnTwoFiveYear: UIButton!
    @IBOutlet weak var btnfiveTenYear: UIButton!
    @IBOutlet weak var btnTenPlus: UIButton!
    @IBOutlet weak var btnMale: UIButton!
    @IBOutlet weak var btnFemale: UIButton!
    @IBOutlet weak var btnShowResult: UIButton!
    @IBOutlet weak var btnCancel: UIButton!
    @IBOutlet weak var vwContainer: UIView!
    
    var closerForbackVC:(( _ strdict: String) -> ())?
    
    //MARK: ====================== View Contoller Life Cycle Method ======================
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBarController?.tabBar.isHidden = true
        self.filterView.isHidden = true
        setUpTableView()
    }
    
    private func setUpTableView() {
        self.membersTableView.dataSource = self
        self.membersTableView.delegate = self
        self.membersTableView.register(UINib(nibName: "AddMembersTableViewCell", bundle: nil), forCellReuseIdentifier: "AddMembersTableViewCell")
        self.vwContainer.layer.masksToBounds = false
        self.vwContainer.layer.shadowColor = UIColor(red: 46/255, green: 91/255, blue: 255/255, alpha: 0.18).cgColor
        self.vwContainer.layer.shadowOpacity = 10
        self.vwContainer.layer.shadowOffset = CGSize(width: 0, height: 0) // Adjust the values to control the shadow direction
        self.vwContainer.layer.shadowRadius = 20
        self.filterView.layer.masksToBounds = false
        self.filterView.layer.shadowColor = UIColor(red: 46/255, green: 91/255, blue: 255/255, alpha: 0.18).cgColor
        self.filterView.layer.shadowOpacity = 10
        self.filterView.layer.shadowOffset = CGSize(width: 0, height: 0) // Adjust the values to control the shadow direction
        self.filterView.layer.shadowRadius = 20
    }
    
    
    //MARK: ====================== IBAction Method ======================
    @IBAction func btnAddMembersAction(_ sender: UIButton) {
        self.addMemberView.isHidden = false
    }
    
    @IBAction func btnCancelAction(_ sender: UIButton) {
        self.closerForbackVC?("hyy")
        dismiss(animated: false)
    }
    
    @IBAction func btnSearchAction(_ sender: UIButton) {
        
    }
    
    @IBAction func btnFilterAction(_ sender: UIButton) {
        self.filterView.isHidden = false
        self.vwContainer.isHidden = true
    }
    
    @IBAction func btnCancelFilterAction(_ sender: UIButton) {
        self.filterView.isHidden = true
        self.vwContainer.isHidden = false
    }
    
    @IBAction func btnPlaceDropDownAction(_ sender: UIButton) {
        
    }
    
    @IBAction func btnFieldDropDownAction(_ sender: UIButton) {
        
    }
    
    @IBAction func btnPopularityAction(_ sender: UIButton) {
        
    }
    
    @IBAction func btnBestReviewAction(_ sender: UIButton) {
        
    }
    
    @IBAction func btnStarRatingAction(_ sender: UIButton) {
        
    }
    
    @IBAction func btnMostReviewAction(_ sender: UIButton) {
        
    }
    
    @IBAction func btnAnyExpAction(_ sender: UIButton) {
        
    }
    
    @IBAction func btnTwoFiveYearAction(_ sender: UIButton) {
        
    }
    
    @IBAction func btnFiveTenYearAction(_ sender: UIButton) {
        
    }
    
    @IBAction func btnTenPlusAction(_ sender: UIButton) {
        
    }
    
    @IBAction func btnMaleAction(_ sender: UIButton) {
        
    }
    
    @IBAction func btnFemaleAction(_ sender: UIButton) {
        
    }
    
    @IBAction func btnShowResultAction(_ sender: UIButton) {
        
    }
}

//MARK: ====================== UITableView DataSource & Delegate Method ======================
extension AddMemberVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.membersTableView.dequeueReusableCell(withIdentifier: "AddMembersTableViewCell", for: indexPath) as! AddMembersTableViewCell
        cell.btnAddMember.addTarget(nil, action: #selector(btnAddMemberAction), for: .touchUpInside)
        return cell
    }
    
    @objc func btnAddMemberAction() {
        print("Adding member request sent")
    }
    
}
