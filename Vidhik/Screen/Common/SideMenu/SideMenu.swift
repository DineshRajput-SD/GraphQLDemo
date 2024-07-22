//
//  SideMenu.swift
//  Vidhik
//
//  Created by NumeroEins on 20/03/24.
//

import Foundation
import UIKit

enum SideMenuType: String {
    case activityFeed = "Activity Feed"
    case news = "News"
    case advocates = "Advocates"
    case conference = "Conference"
    case profile = "Profile"
    case contactUs = "Contact Us"
    case aboutUs = "About Us"
    case marketplace = "Marketplace"
    case caseLaws = "Case Laws"
    case myCaseDiary = "My Case Diary"
    case Members = "Members"
    case chatRoom = "Chat Room"
    case importantEvents = "Important Events"
    case logout = "Logout"
}

class SideMenu: UIView {
    
    //MARK: =============================== IBOutlets Properties ===============================
    @IBOutlet weak var imgProfile: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblEmail: UILabel!
    @IBOutlet weak var menuTableView: UITableView!
    @IBOutlet weak var btnFacebook: UIButton!
    @IBOutlet weak var btnInstagram: UIButton!
    @IBOutlet weak var btnTwitter: UIButton!
    @IBOutlet weak var btnWhatsApp: UIButton!
    @IBOutlet weak var blurView: UIView!
    

    let nibName = "SideMenu"
    var view: UIView!
    var vc: UIViewController?
    var menuOptions = [[String: String]]()
    let checkUserType = ApplicationPreference.getcheckUserType()
    let menuType = SideMenuType.activityFeed
    
    let userType = UserSelectionType.lawyer
   
    // MARK: - Menu Event List
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func setMenuContentAccordingUserSelction() {
        print("userType:------------\(userType)")
        
        if checkUserType == "User" {
            menuOptions = [["image": "icon-ActivityFeed", "option": "Activity Feed"],
                           ["image": "icon-News", "option": "News"],
                           ["image": "icon-CaseLaws", "option": "Advocates"],
                           ["image": "icon-Conference", "option": "Conference"],
                           ["image": "icon-Members", "option": "Profile"],
                           ["image": "icon-ContactUs", "option": "Contact Us"],
                           ["image": "icon-AboutUs", "option": "About Us"],
                           ["image": "icon-Marketplace", "option": "Marketplace"],
                           ["image": "Logout", "option": "Logout"]]
            
        } else if checkUserType == "Lawyer" {
            
            menuOptions = [["image": "icon-ActivityFeed", "option": "Activity Feed"],
                           ["image": "icon-News", "option": "News"],
                           ["image": "icon-CaseLaws", "option": "Case Laws"],
                           ["image": "icon-MyCaseDiary", "option": "My Case Diary"],
                           ["image": "icon-Members", "option": "Members"],
                           ["image": "icon-ChatRoom", "option": "Chat Room"],
                           ["image": "icon-Conference", "option": "Conference"],
                           ["image": "icon-ImportentNotes", "option": "Important Events"],
                           ["image": "icon-Marketplace", "option": "Marketplace"],
                           ["image": "icon-AboutUs", "option": "About Us"],
                           ["image": "icon-ContactUs", "option": "Contact Us"],
                           ["image": "Logout", "option": "Logout"]]
            
        } else {
            menuOptions = [["image": "icon-ActivityFeed", "option": "Activity Feed"],
                           ["image": "icon-News", "option": "News"],
                           ["image": "icon-CaseLaws", "option": "Case Laws"],
                           ["image": "icon-Marketplace", "option": "Marketplace"],
                           ["image": "icon-AboutUs", "option": "About Us"],
                           ["image": "icon-ContactUs", "option": "Contact Us"],
                           ["image": "Logout", "option": "Logout"]]
        }
    }
    
    
    init(frame: CGRect, inview: UIViewController) {
        super.init(frame: frame)
        self.xibSetUp(frame: CGRect(x: 0, y: 0, width: frame.width, height: frame.height))
        self.setMenuContentAccordingUserSelction()
        self.setUpTableView()
        vc = inview
    }

    func xibSetUp(frame: CGRect) {
        self.view = loadNibView()
        view.frame = frame
        addSubview(view)
    }
    
    func loadNibView() -> UIView {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: nibName, bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil).first as! UIView
        return view
    }

     func setUpTableView() {
        self.menuTableView.delegate = self
        self.menuTableView.dataSource = self
        self.menuTableView.register(UINib(nibName: "SideMenuCell", bundle: nil), forCellReuseIdentifier: "SideMenuCell")
    }
}

//MARK: ==================== Extension UITableView DataSource Methods =========================
extension SideMenu: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        menuOptions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.menuTableView.dequeueReusableCell(withIdentifier: "SideMenuCell") as! SideMenuCell
        let data = menuOptions[indexPath.row]
        cell.imgIcon.image = UIImage(named: data["image"]!)
        cell.lblMenuOption.text = data["option"]
        if cell.lblMenuOption.text == "Logout" {
            cell.lblMenuOption.textColor = .red
        }
        return cell
    }
}
 
//MARK: =============================== UITableView Delegate Method ===============================
extension SideMenu: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as! SideMenuCell
        cell.bgView.backgroundColor = UIColor.blue5
        if indexPath.row == 0 {
            cell.imgIcon.image = UIImage(named: "icon-ActivityFeed 1")
        } else if indexPath.row == 1 {
            cell.imgIcon.image = UIImage(named: "icon-News 1")
            let vc = UIStoryboard(name: "News", bundle:nil).instantiateViewController(withIdentifier: "NewsFeedVC") as! NewsFeedVC
            UIApplication.getTopViewController()?.pushVC(vc)
        } else if indexPath.row == 2 {
            cell.imgIcon.image = UIImage(named: "icon-CaseLaws 1")
            
            if checkUserType == "User" {
                
                let advocatesListVC = UIStoryboard(name: "Advocates", bundle: nil).instantiateViewController(identifier: "AdvocatesListVC") as! AdvocatesListVC
                UIApplication.getTopViewController()?.pushVC(advocatesListVC)
            } else if checkUserType == "Lawyer" {
                let vc = UIStoryboard(name: "CaseLaws", bundle:nil).instantiateViewController(withIdentifier: "CaseLawsVC") as! CaseLawsVC
                UIApplication.getTopViewController()?.pushVC(vc)
            } else {
                let vc = UIStoryboard(name: "CaseLaws", bundle:nil).instantiateViewController(withIdentifier: "CaseLawsVC") as! CaseLawsVC
                UIApplication.getTopViewController()?.pushVC(vc)
            }
            
        } else if indexPath.row == 3 {
            
            if checkUserType == "User" {
                cell.imgIcon.image = UIImage(named: "icon-Conference 1")
                let conferenceClientListVC = UIStoryboard(name: "Conference", bundle:nil).instantiateViewController(withIdentifier: "ConferenceClientListVC") as! ConferenceClientListVC
                UIApplication.getTopViewController()?.pushVC(conferenceClientListVC)
                
            } else if checkUserType == "Lawyer" {
                cell.imgIcon.image = UIImage(named: "icon-MyCaseDiary 1")
                let caseDairyLoginVC = UIStoryboard(name: "CaseDairy", bundle: nil).instantiateViewController(withIdentifier: "CaseDairyVC") as! CaseDairyLoginVC
                UIApplication.getTopViewController()?.pushVC(caseDairyLoginVC)
            } else {
                objAppShareData.showAlert(message: "Market plus Under development", controller: vc.self ?? UIViewController())
            }
            
        } else if indexPath.row == 4 {
            if checkUserType == "User" {
                cell.imgIcon.image = UIImage(named: "icon-Members 1")
                let userProfileVC = UIStoryboard(name: "Profile", bundle: nil).instantiateViewController(withIdentifier: "UserProfileVC")as! UserProfileVC
                UIApplication.getTopViewController()?.pushVC(userProfileVC)
                
            } else if checkUserType == "Lawyer" {
                cell.imgIcon.image = UIImage(named: "icon-Members 1")
                let profileUpgradationVC = UIStoryboard(name: "Member", bundle: nil).instantiateViewController(withIdentifier: "ProfileUpgradationVC")as! ProfileUpgradationVC
                UIApplication.getTopViewController()?.pushVC(profileUpgradationVC)
            } else {
                objAppShareData.showAlert(message: "AboutUs Under development", controller: vc.self ?? UIViewController())
            }
            
        } else if indexPath.row == 5 {
            if checkUserType == "User" {
                cell.imgIcon.image = UIImage(named: "icon-ContactUs 1")
                let contactUsVC = UIStoryboard(name: "ContactUs", bundle: nil).instantiateViewController(withIdentifier: "ContactUsVC")as! ContactUsVC
                UIApplication.getTopViewController()?.pushVC(contactUsVC)
            } else if checkUserType == "Lawyer" {
                cell.imgIcon.image = UIImage(named: "icon-ChatRoom 1")
                let chatProfileUpgradationVC = UIStoryboard(name: "Chat", bundle:nil).instantiateViewController(withIdentifier: "ChatProfileUpgradationVC") as! ChatProfileUpgradationVC
                UIApplication.getTopViewController()?.pushVC(chatProfileUpgradationVC)
            } else {
                cell.imgIcon.image = UIImage(named: "icon-ContactUs 1")
                let contactUsVC = UIStoryboard(name: "ContactUs", bundle:nil).instantiateViewController(withIdentifier: "ContactUsVC") as! ContactUsVC
                UIApplication.getTopViewController()?.pushVC(contactUsVC)
            }
            
            
        } else if indexPath.row == 6 {
            if checkUserType == "User" {
                cell.imgIcon.image = UIImage(named: "icon-AboutUs 1")
                
                //objAppShareData.showAlert(message: "Under development", controller: self)
            } else if checkUserType == "Lawyer" {
                cell.imgIcon.image = UIImage(named: "icon-Conference 1")
                let conferenceClientListVC = UIStoryboard(name: "Conference", bundle:nil).instantiateViewController(withIdentifier: "ConferenceClientListVC") as! ConferenceClientListVC
                UIApplication.getTopViewController()?.pushVC(conferenceClientListVC)
            } else {
                cell.lblMenuOption.textColor = .solidBlue
                if cell.lblMenuOption.text == "Logout" {
                    cell.lblMenuOption.textColor = .red
                }
                userLogout()
            }
        } else if indexPath.row == 7 {
            if checkUserType == "User" {
                cell.imgIcon.image = UIImage(named: "icon-Marketplace 1")
               
            } else if checkUserType == "Lawyer" {
                cell.imgIcon.image = UIImage(named: "icon-ImportentNotes 1")
                let calendarVC = UIStoryboard(name: "ImportantEvents", bundle:nil).instantiateViewController(withIdentifier: "CalendarVC") as! CalendarVC
                UIApplication.getTopViewController()?.pushVC(calendarVC)
            } else {
                
            }
            
        } else if indexPath.row == 8 {
            if checkUserType == "User" {
                
                cell.imgIcon.image = UIImage(named: "Logout")
                if cell.lblMenuOption.text == "Logout" {
                    cell.lblMenuOption.textColor = .red
                }
                userLogout()
                print("User Logout")
            } else if checkUserType == "Lawyer" {
                cell.imgIcon.image = UIImage(named: "icon-Marketplace 1")
                objAppShareData.showAlert(message: "Under development", controller: vc.self ?? UIViewController())
            } else {
                
            }
        } else if indexPath.row == 9 {
            cell.imgIcon.image = UIImage(named: "icon-AboutUs 1")
            objAppShareData.showAlert(message: "Under development", controller: vc.self ?? UIViewController())
        } else if indexPath.row == 10 {
            cell.imgIcon.image = UIImage(named: "icon-ContactUs 1")
            let contactUsVC = UIStoryboard(name: "ContactUs", bundle:nil).instantiateViewController(withIdentifier: "ContactUsVC") as! ContactUsVC
            UIApplication.getTopViewController()?.pushVC(contactUsVC)
        } else {
            userLogout()
        }
        cell.lblMenuOption.textColor = .solidBlue
        if cell.lblMenuOption.text == "Logout" {
            cell.lblMenuOption.textColor = .red
        }
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as! SideMenuCell
        cell.bgView.backgroundColor = UIColor.white
        
        if indexPath.row == 0 {
            cell.imgIcon.image = UIImage(named: "icon-ActivityFeed")
            
        } else if indexPath.row == 1 {
            cell.imgIcon.image = UIImage(named: "icon-News")
            
        } else if indexPath.row == 2 {
            cell.imgIcon.image = UIImage(named: "icon-CaseLaws")
            
        } else if indexPath.row == 3 {
            
            if checkUserType == "User" {
                cell.imgIcon.image = UIImage(named: "icon-Conference")
            } else if checkUserType == "Lawyer" {
                cell.imgIcon.image = UIImage(named: "icon-MyCaseDiary")
            } else {
                cell.imgIcon.image = UIImage(named: "icon-Marketplace")
            }
            
        } else if indexPath.row == 4 {
            cell.imgIcon.image = checkUserType == "Judge" ? UIImage(named: "icon-AboutUs") : UIImage(named: "icon-Members")
        } else if indexPath.row == 5 {
            cell.imgIcon.image = checkUserType == "Lawyer" ? UIImage(named: "icon-ChatRoom") : UIImage(named: "icon-ContactUs")
        } else if indexPath.row == 6 {
           
            if checkUserType == "User" {
                cell.imgIcon.image = UIImage(named: "icon-AboutUs")
            } else if checkUserType == "Lawyer" {
                cell.imgIcon.image = UIImage(named: "icon-Conference")
            } else {
                cell.imgIcon.image = UIImage(named: "Logout")
            }
        } else if indexPath.row == 7 {
            cell.imgIcon.image = checkUserType == "User" ? UIImage(named: "icon-Marketplace") : UIImage(named: "icon-ImportentNotes")
        } else if indexPath.row == 8 {
            cell.imgIcon.image = checkUserType == "User" ? UIImage(named: "Logout") : UIImage(named: "icon-Marketplace")
        } else if indexPath.row == 9 {
            cell.imgIcon.image = UIImage(named: "icon-AboutUs")
        } else if indexPath.row == 10{
            cell.imgIcon.image = UIImage(named: "icon-ContactUs")
        } else {
        }
        cell.lblMenuOption.textColor = .solidBlack60
        if cell.lblMenuOption.text == "Logout" {
            cell.lblMenuOption.textColor = .red
        }
    }
    
    // MARK: =============================== Private Method User Logout ===============================
   private func userLogout() {
        AlertView.show(title: "Alert", message: "Are you sure you want to sign out?", okTitle: "Yes", cancelTitle: "No") { [weak self] index in
            guard let self =  self else { return }
            if index == 1 {
                let loginVC = UIStoryboard(name: "Main", bundle:nil).instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
                ApplicationPreference.clean()
                UserKeychainManager.shared.cleanUserData()
                self.vc?.navigationController?.pushViewController(loginVC, animated: true)
            }
        }
    }
}
