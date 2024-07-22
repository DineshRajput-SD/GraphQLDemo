//
//  WordPhrasesVC.swift
//  Vidhik
//
//  Created by NumeroEins on 07/02/24.
//

import UIKit

class WordPhrasesVC: UIViewController {
    
    //MARK: ===================== IBOutlet Properties =====================
    @IBOutlet weak var navigationView: NavigationBarView!
    @IBOutlet weak var txtSelectWord: UITextField!
    @IBOutlet weak var btnSelectWordDropDown: UIButton!
    @IBOutlet weak var btnSearch: UIButton!
    @IBOutlet weak var btnReset: UIButton!
    @IBOutlet weak var wordPhraseDropDownView: DropDownViewWithSearch!
    @IBOutlet weak var wordPhraseDropDownViewHeight: NSLayoutConstraint!
    
    var checkUserType = ApplicationPreference.getcheckUserType()
    var arrData = ["Word & Phrases", "Word & Phrases", "Word & Phrases", "Word & Phrases", "Word & Phrases", "Word & Phrases", "Word & Phrases", "Word & Phrases", "Word & Phrases", "Word & Phrases", "Word & Phrases", "Word & Phrases"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpNaviagtionBar()
        self.setupUI()
    }
    
    private func setUpNaviagtionBar() {
        self.navigationView.delegate = self
        self.navigationView.lblTitle.text = "Words & Phrases"
        navigationView.btnSearch.isHidden = checkUserType == "Lawyer" ? false : true
        navigationView.btnNotification.isHidden = checkUserType == "Lawyer" ? false : true
        navigationView.btnProfile.isHidden = checkUserType == "Lawyer" ? false : true
    }
    
    private func setupUI() {
        self.wordPhraseDropDownView.isHidden = true
    }
    
    //MARK: ===================== IBAction Methods =====================
    @IBAction func btnWordDropDownAction(_ sender: UIButton) {
        wordPhraseDropDownViewHeight.constant = 300
        wordPhraseDropDownView.tableData = arrData
        wordPhraseDropDownView.dropDownTable.reloadData()
        wordPhraseDropDownView.isHidden = false
        wordPhraseDropDownView.txtSearch.placeholder = "Select word & phrases"
        
        self.wordPhraseDropDownView.closerForbackVC = { sttr in
            let addEventVC = UIStoryboard(name: "CaseLaws", bundle: nil) .instantiateViewController(identifier: "WordPhrasesDefinationVC") as! WordPhrasesDefinationVC
            addEventVC.modalPresentationStyle = .overCurrentContext
            self.tabBarController?.tabBar.isHidden = true
            addEventVC.closerForbackVC = { str in
                self.tabBarController?.tabBar.isHidden = false
            }
            self.navigationController?.present(addEventVC, animated: false)
            self.txtSelectWord.text = self.wordPhraseDropDownView.selectedItemText
            self.wordPhraseDropDownView.isHidden = true
        }
    }
    
    @IBAction func btnSearchAction(_ sender: UIButton) {
        let vc = UIStoryboard(name: "CaseLaws", bundle: nil).instantiateViewController(withIdentifier: "LatestCasesVC")as!LatestCasesVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func btnResetAction(_ sender: UIButton) {
        
    }
}

//MARK: ===================== Extension NavigationBarView Delegate Methods =====================
extension WordPhrasesVC: NavigationBarViewDelegate {
    
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
