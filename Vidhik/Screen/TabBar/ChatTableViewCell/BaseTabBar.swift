//
//  CustomOneTabBar.swift
//  Vidhik
//
//  Created by NumeroEins on 19/03/24.
//

import WaveTab
import UIKit

class BaseTabBar: WaveTabBarController {
    // MARK:  =================================== Instance Properties ===================================
    let checkUserType = ApplicationPreference.getcheckUserType()
    var advocateListNav: UINavigationController!
    var chatProfileUpgradationNav: UINavigationController!
    var feedNav: UINavigationController!
    var userProfileNav: UINavigationController!
    var contactUsNav: UINavigationController!
    var caseLowNav: UINavigationController!
    var caseDairyNav: UINavigationController!
    var newsNav: UINavigationController!
    var isBackButtonHide: Bool = true
    let userType = UserKeychainManager.shared.getUserType()
    
    // MARK: =================================== View Controller Life Cycle Method ===================================
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetupTabbar()
        print("userType::::::::: \(userType?.capitalized ?? "")")
    }
    
    
    private func commonTabBar(checkUserType: String) {
        let feedVC = UIStoryboard(name: "Feed", bundle: nil).instantiateViewController(identifier: "FeedVC")
        feedNav = UINavigationController.init(rootViewController: feedVC)
        feedNav?.navigationBar.isHidden = true
        
    }
    
    // MARK:  =================================== Created TabBar Data ===================================
    private func userTabBarData() {
        let advocatesListVC = UIStoryboard(name: "Advocates", bundle: nil).instantiateViewController(identifier: "AdvocatesListVC") as AdvocatesListVC
        advocateListNav = UINavigationController.init(rootViewController: advocatesListVC)
        advocatesListVC.isBackButtonHide = true
        advocateListNav?.navigationBar.isHidden = true
       
        let conferenceClientListVC = UIStoryboard(name: "Conference", bundle: nil).instantiateViewController(identifier: "ConferenceClientListVC") as ConferenceClientListVC
        chatProfileUpgradationNav = UINavigationController.init(rootViewController: conferenceClientListVC)
        conferenceClientListVC.isBackButtonHide = true
        chatProfileUpgradationNav?.navigationBar.isHidden = true
        
        let feedVC = UIStoryboard(name: "Feed", bundle: nil).instantiateViewController(identifier: "FeedVC")
        feedNav = UINavigationController.init(rootViewController: feedVC)
        feedNav?.navigationBar.isHidden = true
        
        let userProfileVC = UIStoryboard(name: "Profile", bundle: nil).instantiateViewController(identifier: "UserProfileVC") as UserProfileVC
        userProfileVC.isBackButtonHide = true
        userProfileNav = UINavigationController.init(rootViewController: userProfileVC)
        userProfileNav?.navigationBar.isHidden = true
        
        let contactUsVC = UIStoryboard(name: "ContactUs", bundle: nil).instantiateViewController(identifier: "ContactUsVC") as ContactUsVC
        contactUsVC.isBackButtonHide = true
        contactUsNav = UINavigationController.init(rootViewController: contactUsVC)
        contactUsNav?.navigationBar.isHidden = true
        
        viewControllers = [advocateListNav, chatProfileUpgradationNav, feedNav, userProfileNav, contactUsNav]
        
        advocateListNav.tabBarItem = UITabBarItem(title: "Advocates", image: #imageLiteral(resourceName: "CaseLaws 1"), selectedImage: UIImage(named: "icon-CaseLaws 1"))
        chatProfileUpgradationNav.tabBarItem = UITabBarItem(title: "Conference", image: #imageLiteral(resourceName: "tabBarChat"), selectedImage: UIImage(named: "icon-ChatRoom 1"))
        feedNav.tabBarItem = UITabBarItem(title: "Feed", image: #imageLiteral(resourceName: "tabBarFeed"), selectedImage: UIImage(named: "icon-ActivityFeed 1"))
        userProfileNav.tabBarItem = UITabBarItem(title: "Profile", image: #imageLiteral(resourceName: "tabBarProfile"), selectedImage: UIImage(named: "icon-AboutUs 1"))
        contactUsNav.tabBarItem = UITabBarItem(title: "Contact Us", image: #imageLiteral(resourceName: "tabBarSupport"), selectedImage: UIImage(named: "icon-ContactUs 1"))
        selectedIndex = 2
    }
    
    private func judgeTabBarData() {
        let caseLawsVC = UIStoryboard(name: "CaseLaws", bundle: nil).instantiateViewController(identifier: "CaseLawsVC") as CaseLawsVC
        caseLawsVC.isBackButtonHide = true
        caseLowNav = UINavigationController.init(rootViewController: caseLawsVC)
        caseLowNav?.navigationBar.isHidden = true
        
        let newsVC = UIStoryboard(name: "News", bundle: nil).instantiateViewController(identifier: "NewsFeedVC") as NewsFeedVC
        newsVC.isBackButtonHide = true
        newsNav = UINavigationController.init(rootViewController: newsVC)
        newsNav?.navigationBar.isHidden = true
        
        let feedVC = UIStoryboard(name: "Feed", bundle: nil).instantiateViewController(identifier: "FeedVC")
         feedNav = UINavigationController.init(rootViewController: feedVC)
        feedNav?.navigationBar.isHidden = true
        
        let userProfileVC = UIStoryboard(name: "Profile", bundle: nil).instantiateViewController(identifier: "JudgeProfileVC") as JudgeProfileVC
        userProfileVC.isBackButtonHide = true
        userProfileNav = UINavigationController.init(rootViewController: userProfileVC)
        userProfileNav?.navigationBar.isHidden = true
        
        let contactUsVC = UIStoryboard(name: "ContactUs", bundle: nil).instantiateViewController(identifier: "ContactUsVC") as ContactUsVC
        contactUsVC.isBackButtonHide = true
        contactUsNav = UINavigationController.init(rootViewController: contactUsVC)
        contactUsNav?.navigationBar.isHidden = true
        
        viewControllers = [caseLowNav, newsNav, feedNav, userProfileNav, contactUsNav]
        caseLowNav.tabBarItem = UITabBarItem(title: "Case Laws", image: #imageLiteral(resourceName: "CaseLaws 1"), selectedImage: UIImage(named: "icon-CaseLaws 1"))
        newsNav.tabBarItem = UITabBarItem(title: "News", image: #imageLiteral(resourceName: "icon-News"), selectedImage: UIImage(named: "icon-News 1"))
        feedNav.tabBarItem = UITabBarItem(title: "Feed", image: #imageLiteral(resourceName: "tabBarFeed"), selectedImage: UIImage(named: "icon-ActivityFeed 1"))
        userProfileNav.tabBarItem = UITabBarItem(title: "Profile", image: #imageLiteral(resourceName: "tabBarProfile"), selectedImage: UIImage(named: "icon-AboutUs 1"))
        contactUsNav.tabBarItem = UITabBarItem(title: "Contact Us", image: #imageLiteral(resourceName: "tabBarSupport"), selectedImage: UIImage(named: "icon-ContactUs 1"))
        selectedIndex = 2
    }
    
    private func lawyerTabBarData() {
        let caseLawsVC = UIStoryboard(name: "CaseLaws", bundle: nil).instantiateViewController(identifier: "CaseLawsVC") as CaseLawsVC
        caseLawsVC.isBackButtonHide = true
        caseLowNav = UINavigationController.init(rootViewController: caseLawsVC)
        caseLowNav?.navigationBar.isHidden = true
        
        let chatProfileUpgradationVC = UIStoryboard(name: "Chat", bundle: nil).instantiateViewController(identifier: "ChatProfileUpgradationVC") as ChatProfileUpgradationVC
        chatProfileUpgradationVC.isBackButtonHide = true
        chatProfileUpgradationNav = UINavigationController.init(rootViewController: chatProfileUpgradationVC)
        chatProfileUpgradationNav?.navigationBar.isHidden = true
        
        let feedVC = UIStoryboard(name: "Feed", bundle: nil).instantiateViewController(identifier: "FeedVC")
        feedNav = UINavigationController.init(rootViewController: feedVC)
        feedNav?.navigationBar.isHidden = true
        
        let profileVC = UIStoryboard(name: "Profile", bundle: nil).instantiateViewController(identifier: "ProfileVC") as ProfileVC
        profileVC.isBackButtonHide = true
        userProfileNav = UINavigationController.init(rootViewController: profileVC)
        userProfileNav?.navigationBar.isHidden = true
        
        let caseDairyVC = UIStoryboard(name: "CaseDairy", bundle: nil).instantiateViewController(identifier: "CaseDairyVC") as CaseDairyLoginVC
        caseDairyVC.isBackButtonHide = true
        caseDairyNav = UINavigationController.init(rootViewController: caseDairyVC)
        caseDairyNav?.navigationBar.isHidden = true
        
        viewControllers = [caseLowNav, chatProfileUpgradationNav, feedNav, userProfileNav, caseDairyNav]
        caseLowNav.tabBarItem = UITabBarItem(title: "Case Laws", image: #imageLiteral(resourceName: "CaseLaws 1"), selectedImage: UIImage(named: "icon-CaseLaws 1"))
        chatProfileUpgradationNav.tabBarItem = UITabBarItem(title: "Chat", image: #imageLiteral(resourceName: "tabBarChat"), selectedImage: UIImage(named: "icon-ChatRoom 1"))
        feedNav.tabBarItem = UITabBarItem(title: "Feed", image: #imageLiteral(resourceName: "tabBarFeed"), selectedImage: UIImage(named: "icon-ActivityFeed 1"))
        userProfileNav.tabBarItem = UITabBarItem(title: "Profile", image: #imageLiteral(resourceName: "tabBarProfile"), selectedImage: UIImage(named: "icon-AboutUs 1"))
        caseDairyNav.tabBarItem = UITabBarItem(title: "Case Dairy", image: #imageLiteral(resourceName: "tabBarCaseDairy"), selectedImage: UIImage(named: "icon-MyCaseDiary 1"))
        
        self.selectedIndex = 2
    }
    
    func initialSetupTabbar() {
        
        if checkUserType == "User" {
            userTabBarData()
        } else if checkUserType == "Lawyer" {
            lawyerTabBarData()
        } else {
            judgeTabBarData()
        }
    }
}

// MARK: =========================== UITabbar Controller Delegate Methods ================================
extension BaseTabBar: UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        return true
    }
    
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        tabBarController.selectedIndex = 2
    }
}
