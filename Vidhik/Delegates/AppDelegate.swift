//
//  AppDelegate.swift
//  Vidhik
//
//  Created by NumeroEins on 11/01/24.
//
// Ayushi

import UIKit
import WaveTab
import IQKeyboardManagerSwift
import Firebase


let ObjAppdelegate = AppDelegate.AppDelegateObject()

let appDelegate = UIApplication.shared.delegate as? AppDelegate
let userDefault = UserDefaults.standard
var isLoggedIn = false
var showOnBoarding = false

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    private static var AppDelegateManager: AppDelegate = {
        let manager = UIApplication.shared.delegate as! AppDelegate
        return manager
    }()
    
    // MARK: - Accessors
    class func AppDelegateObject() -> AppDelegate {
        return AppDelegateManager
    }
    
    var isFromDoneSignUp = false
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        FirebaseApp.configure()
        IQKeyboardManager.shared.enable = true
        setUpNavigation()
        return true
    }

    // MARK: ==================== Setup User LoggedIn Navigation ====================
    private func setUpNavigation() {
        isLoggedIn = ApplicationPreference.retriveIsLoggedInUser(isLoggedIn: "isLoggedIn")
        if isLoggedIn {
            setRootViewController()
        } else {
            self.loginScreen()
        }
    }
    
    // MARK: ==================== Session Expired Method ====================
    func sessionExpired() -> Void {
        AlertView.show(title: "Your session has expired", message: "Log in to proceed", okTitle: "Ok", cancelTitle: nil) { _ in
            ApplicationPreference.clean()
            self.loginScreen()
        }
    }
    
    // MARK: ==================== SetOnBoarding VC ====================
    func setOnBoarding() {
        let onBoardingVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "OnBoardingVC") as! OnBoardingVC
        let nav = UINavigationController(rootViewController: onBoardingVC)
         nav.setNavigationBarHidden(true, animated: true)
        self.window?.rootViewController = nav
      }
 
    //MARK: ==================== Methord For Rootviews ====================
    func setRootViewController() {
        let tabBar = UIStoryboard(name: "TabBar", bundle: nil).instantiateViewController(withIdentifier: "BaseTabBar") as! BaseTabBar
        let nav = UINavigationController(rootViewController: tabBar)
        nav.setNavigationBarHidden(true, animated: true)
        self.window?.rootViewController = nav
    }

    
    func setLaunchScreen(){
        let Login = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "LaunchscreenVC") as! LaunchscreenVC
        let nav = UINavigationController(rootViewController: Login)
         nav.setNavigationBarHidden(true, animated: true)
        self.window?.rootViewController = nav
      }
    
    func loginScreen() {
       let Login = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
        DispatchQueue.main.async {
            let nav = UINavigationController(rootViewController: Login)
             nav.setNavigationBarHidden(true, animated: true)
            self.window?.rootViewController = nav
        }
    }
    
    func caseLoginScreen(){
        let tabBar = UIStoryboard(name: "TabBar", bundle: nil).instantiateViewController(withIdentifier: "WaveTabBarController") as! WaveTabBarController
        let nav = UINavigationController(rootViewController: tabBar)
        nav.setNavigationBarHidden(true, animated: true)
        
       let caseDairy = UIStoryboard(name: "CaseDairy", bundle: nil).instantiateViewController(withIdentifier: "CaseDairySecondForgotVC") as! CaseDairySecondForgotVC
       let nav1 = UINavigationController(rootViewController: caseDairy)
        nav1.setNavigationBarHidden(true, animated: true)
       self.window?.rootViewController = nav1
    }
}

// MARK: ==================== get TopViewController ====================
extension UIApplication {
    class func getTopViewController(base: UIViewController? = UIApplication.shared.keyWindow?.rootViewController) -> UIViewController? {
        if let nav = base as? UINavigationController {
            return getTopViewController(base: nav.visibleViewController)
        } else if let tab = base as? UITabBarController, let selected = tab.selectedViewController {
            return getTopViewController(base: selected)
        } else if let presented = base?.presentedViewController {
            return getTopViewController(base: presented)
        }
        return base
    }
}

// MARK: ==================== Created Navigation Methods ====================
extension UIViewController {
    @IBAction func pop() {
        if Thread.isMainThread {
            self.navigationController?.popViewController(animated: true)
        } else {
            _ = DispatchQueue.main.sync {
                self.navigationController?.popViewController(animated: true)
            }
        }
    }
    
    @IBAction func popToSpecificController(_ viewController: Any) {
        if Thread.isMainThread {
                for controller in self.navigationController!.viewControllers as Array {
                   // guard let vc = viewController as? AnyClass  else { return }
                    if controller.isKind(of: viewController as? AnyClass ?? UIViewController.self) {
                    _ =  self.navigationController!.popToViewController(controller, animated: true)
                    break
                }
            }
        } else {
            DispatchQueue.main.sync {
                for controller in self.navigationController!.viewControllers as Array {
                    if controller.isKind(of: viewController as! AnyClass) {
                        _ =  self.navigationController!.popToViewController(controller, animated: true)
                        break
                    }
                }
            }
        }
    }
    
    @IBAction func popToRoot() {
        if Thread.isMainThread {
            self.navigationController?.popToRootViewController(animated: true)
        } else {
            _ = DispatchQueue.main.sync {
                self.navigationController?.popToRootViewController(animated: true)
            }
        }
    }
    
    func pushVC(_ viewController: UIViewController, animated: Bool = true) -> Void {
        if Thread.isMainThread {
            self.navigationController?.pushViewController(viewController, animated: animated)
        } else {
            DispatchQueue.main.sync {
                self.navigationController?.pushViewController(viewController, animated: animated)
            }
        }
    }
}

