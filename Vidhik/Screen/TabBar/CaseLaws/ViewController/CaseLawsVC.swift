//
//  CaseLawsVC.swift
//  Vidhik
//
//  Created by NumeroEins on 30/01/24.
//

import UIKit
import WaveTab

enum CaseLawEnum: Int {
    case latestCases
    case appResp
    case judgeWise
    case citationWise
    case bareActs
    case actSectionWise
    case wordsPhrases
    case overruled
    case universalSearch
    case advanceSearch
}

class CaseLawsVC: UIViewController{
    
    //MARK: ===========================  IBOutlet Properties ===========================
    @IBOutlet weak var navigationView: NavigationBarView!
    @IBOutlet weak var caseLawsTableView: UITableView!
    
    var caselaws = ["Latest Cases", "App/Resp", "Judge Wise", "Citation Wise", "Bare Acts", "Act & Section Wise", "Words & Phrases", "Overruled", "Universal Search", "Advance Search"]
    var isBackButtonHide: Bool?
    var checkUserType = ApplicationPreference.getcheckUserType()
    var caseLaws = CaseLawEnum.latestCases
    
    //MARK: =========================== View Controller Life Cycle Method ===========================
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationView.btnBack.isHidden = isBackButtonHide == true ? true : false
        self.setUpNaviagtionBar()
        self.setUpTableView()
        tabBarController?.tabBar.isHidden = false
    }
    
    private func setUpNaviagtionBar() {
        self.navigationView.delegate = self
        self.navigationView.lblTitle.text = "Case Laws"
        navigationView.btnSearch.isHidden = checkUserType == "Lawyer" ? false : true
        navigationView.btnNotification.isHidden = checkUserType == "Lawyer" ? false : true
        navigationView.btnProfile.isHidden = checkUserType == "Lawyer" ? false : true
    }
    
    private func setUpTableView() {
        self.caseLawsTableView.dataSource = self
        self.caseLawsTableView.delegate = self
    }
}

//MARK: ===========================  TableView Delegate and DataSource ===========================
extension CaseLawsVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        caselaws.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = caseLawsTableView.dequeueReusableCell(withIdentifier: "CaseLawsTableCell", for: indexPath) as! CaseLawsTableCell
        cell.lblCaseLawType.text = caselaws[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
/*
        switch caseLaws {
        case .latestCases:
            let latestcasesVC = UIStoryboard(name: "CaseLaws", bundle: nil).instantiateViewController(identifier: "LatestCasesVC") as! LatestCasesVC
            self.navigationController?.pushViewController(latestcasesVC, animated: true)
        case .appResp:
            let appRespVC = UIStoryboard(name: "CaseLaws", bundle: nil).instantiateViewController(identifier: "AppRespVC") as! AppRespVC
            self.navigationController?.pushViewController(appRespVC, animated: true)
        case .judgeWise:
            let judgeWiseVC = UIStoryboard(name: "CaseLaws", bundle: nil).instantiateViewController(identifier: "JudgeWiseVC") as! JudgeWiseVC
            self.navigationController?.pushViewController(judgeWiseVC, animated: true)
        case .citationWise:
            let citationWiseVC = UIStoryboard(name: "CaseLaws", bundle: nil).instantiateViewController(identifier: "CitationWiseVC") as! CitationWiseVC
            self.navigationController?.pushViewController(citationWiseVC, animated: true)
        case .bareActs:
            let bareActsVC = UIStoryboard(name: "CaseLaws", bundle: nil).instantiateViewController(identifier: "BareActsVC") as! BareActsVC
            self.navigationController?.pushViewController(bareActsVC, animated: true)
        case .actSectionWise:
            let actSectionWiseVC = UIStoryboard(name: "CaseLaws", bundle: nil).instantiateViewController(identifier: "ActSectionWiseVC") as! ActSectionWiseVC
            self.navigationController?.pushViewController(actSectionWiseVC, animated: true)
        case .wordsPhrases:
            let wordPhrasesVC = UIStoryboard(name: "CaseLaws", bundle: nil).instantiateViewController(identifier: "WordPhrasesVC") as! WordPhrasesVC
            self.navigationController?.pushViewController(wordPhrasesVC, animated: true)
        case .overruled:
            let overruledVC = UIStoryboard(name: "CaseLaws", bundle: nil).instantiateViewController(identifier: "OverruledVC") as! OverruledVC
            self.navigationController?.pushViewController(overruledVC, animated: true)
        case .universalSearch:
            let universalSearchVC = UIStoryboard(name: "CaseLaws", bundle: nil).instantiateViewController(identifier: "UniversalSearchVC") as! UniversalSearchVC
            self.navigationController?.pushViewController(universalSearchVC, animated: true)
        case .advanceSearch:
            let advanceSearchVC = UIStoryboard(name: "CaseLaws", bundle: nil).instantiateViewController(identifier: "AdvanceSearchVC") as! AdvanceSearchVC
            self.navigationController?.pushViewController(advanceSearchVC, animated: true)
      
        }*/

        if indexPath.row == 0 {
            let latestcasesVC = UIStoryboard(name: "CaseLaws", bundle: nil).instantiateViewController(identifier: "LatestCasesVC") as! LatestCasesVC
            self.navigationController?.pushViewController(latestcasesVC, animated: true)
        }
        if indexPath.row == 1 {
            let latestcasesVC = UIStoryboard(name: "CaseLaws", bundle: nil).instantiateViewController(identifier: "AppRespVC") as! AppRespVC
            self.navigationController?.pushViewController(latestcasesVC, animated: true)
        }
         if indexPath.row == 2 {
            let latestcasesVC = UIStoryboard(name: "CaseLaws", bundle: nil).instantiateViewController(identifier: "JudgeWiseVC") as! JudgeWiseVC
            self.navigationController?.pushViewController(latestcasesVC, animated: true)
        }
        if indexPath.row == 3 {
           let latestcasesVC = UIStoryboard(name: "CaseLaws", bundle: nil).instantiateViewController(identifier: "CitationWiseVC") as! CitationWiseVC
           self.navigationController?.pushViewController(latestcasesVC, animated: true)
       }
        if indexPath.row == 4 {
           let latestcasesVC = UIStoryboard(name: "CaseLaws", bundle: nil).instantiateViewController(identifier: "BareActsVC") as! BareActsVC
           self.navigationController?.pushViewController(latestcasesVC, animated: true)
       }
        if indexPath.row == 5 {
           let latestcasesVC = UIStoryboard(name: "CaseLaws", bundle: nil).instantiateViewController(identifier: "ActSectionWiseVC") as! ActSectionWiseVC
           self.navigationController?.pushViewController(latestcasesVC, animated: true)
       }
        if indexPath.row == 6 {
           let latestcasesVC = UIStoryboard(name: "CaseLaws", bundle: nil).instantiateViewController(identifier: "WordPhrasesVC") as! WordPhrasesVC
           self.navigationController?.pushViewController(latestcasesVC, animated: true)
       }
        if indexPath.row == 7 {
           let latestcasesVC = UIStoryboard(name: "CaseLaws", bundle: nil).instantiateViewController(identifier: "OverruledVC") as! OverruledVC
           self.navigationController?.pushViewController(latestcasesVC, animated: true)
       }
        if indexPath.row == 8 {
           let latestcasesVC = UIStoryboard(name: "CaseLaws", bundle: nil).instantiateViewController(identifier: "UniversalSearchVC") as! UniversalSearchVC
           self.navigationController?.pushViewController(latestcasesVC, animated: true)
       }
        if indexPath.row == 9 {
           let latestcasesVC = UIStoryboard(name: "CaseLaws", bundle: nil).instantiateViewController(identifier: "AdvanceSearchVC") as! AdvanceSearchVC
           self.navigationController?.pushViewController(latestcasesVC, animated: true)
       }
    }
}

//MARK: ===========================  Extension ===========================
extension CaseLawsVC: NavigationBarViewDelegate {
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
