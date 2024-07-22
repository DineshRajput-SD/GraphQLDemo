//
//  CitationWiseVC.swift
//  Vidhik
//
//  Created by NumeroEins on 07/02/24.
//

import UIKit

class CitationWiseVC: UIViewController {
    
    //MARK: ============================== IBOutlet ==============================
    @IBOutlet weak var navigationView: NavigationBarView!
    @IBOutlet weak var txtSelectJournal: UITextField!
    @IBOutlet weak var btnSelectJournalDropDown: UIButton!
    @IBOutlet weak var txtSelectYear: UITextField!
    @IBOutlet weak var btnSelectYearDropDown: UIButton!
    @IBOutlet weak var txtSelectVolume: UITextField!
    @IBOutlet weak var btnSelectVolumeDropDown: UIButton!
    @IBOutlet weak var txtPageNo: UITextField!
    @IBOutlet weak var btnSearch: UIButton!
    @IBOutlet weak var btnRetry: UIButton!
    @IBOutlet weak var journalDropDownView: DropDownViewWithSearch!
    @IBOutlet weak var journalDropDownViewHeight: NSLayoutConstraint!
    @IBOutlet weak var yearDropDownView: CustomDropDownView!
    @IBOutlet weak var yearlDropDownViewHeight: NSLayoutConstraint!
    @IBOutlet weak var volumeDropDownView: CustomDropDownView!
    @IBOutlet weak var volumeDropDownViewHeight: NSLayoutConstraint!
    
    var checkUserType = ApplicationPreference.getcheckUserType()
    var arrData = ["Judge Name", "Judge Name", "Judge Name", "Judge Name", "Judge Name", "Judge Name", "Judge Name", "Judge Name", "Judge Name", "Judge Name", "Judge Name", "Judge Name"]
    var yearData = ["All", "2001", "2002","2003","2004","2005","2006","2007","2008"]
    var volumeData = ["All", "1", "2","3","4","5","6","7","8"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpNaviagtionBar()
        self.setupUI()
    }
    
    private func setUpNaviagtionBar() {
        self.navigationView.delegate = self
        self.navigationView.lblTitle.text = "Citation Wise"
        navigationView.btnSearch.isHidden = checkUserType == "Lawyer" ? false : true
        navigationView.btnNotification.isHidden = checkUserType == "Lawyer" ? false : true
        navigationView.btnProfile.isHidden = checkUserType == "Lawyer" ? false : true
    }
    
    private func setupUI() {
        self.journalDropDownView.isHidden = true
        self.yearDropDownView.isHidden = true
        self.volumeDropDownView.isHidden = true
    }
    
    func showDropDown(dropDownHeight: NSLayoutConstraint, dropDownView: CustomDropDownView, text: UITextField, data: [String]) {
        dropDownHeight.constant = 300
        dropDownView.tableData = data
        dropDownView.dropDownTable.reloadData()
        dropDownView.isHidden = false
        
        dropDownView.closerForbackVC = { sttr in
            text.text = dropDownView.selectedItemText
            dropDownView.isHidden = true
            
        }
    }
    
    //MARK: ============================== IBAction ==============================
    @IBAction func btnJournalDropDownAction(_ sender: UIButton) {
        self.yearDropDownView.isHidden = true
        self.volumeDropDownView.isHidden = true
        journalDropDownViewHeight.constant = 300
        journalDropDownView.tableData = arrData
        journalDropDownView.dropDownTable.reloadData()
        journalDropDownView.isHidden = false
        journalDropDownView.txtSearch.placeholder = "By journal"
        
        self.journalDropDownView.closerForbackVC = { sttr in
            self.txtSelectJournal.text = self.journalDropDownView.selectedItemText
            self.journalDropDownView.isHidden = true
            
        }
    }
    
    @IBAction func btnYearDropDownAction(_ sender: UIButton) {
        journalDropDownView.isHidden = true
        self.volumeDropDownView.isHidden = true
        self.showDropDown(dropDownHeight: yearlDropDownViewHeight, dropDownView: yearDropDownView, text: txtSelectYear, data: yearData)
    }
    
    @IBAction func btnVolumeDropDownAction(_ sender: UIButton) {
        journalDropDownView.isHidden = true
        self.yearDropDownView.isHidden = true
        self.showDropDown(dropDownHeight: volumeDropDownViewHeight , dropDownView: volumeDropDownView, text: txtSelectVolume, data: volumeData)
        
    }
    @IBAction func btnSearchAction(_ sender: UIButton) {
        let vc = UIStoryboard(name: "CaseLaws", bundle: nil).instantiateViewController(withIdentifier: "LatestCasesVC")as!LatestCasesVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func btnRetryAction(_ sender: UIButton) {
        
    }
}

//MARK: ============================== Extension ==============================
extension CitationWiseVC: NavigationBarViewDelegate {
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
