//
//  UIApplication+Extension.swift
//  Vidhik
//
//  Created by Dinesh Rajput on 01/04/24.
//

import Foundation
import UIKit

public extension UIApplication {
    
    // Returns current Top Most ViewController in hierarchy of Window.
    class func topMostWindowController() -> UIViewController? {
        let window = UIApplication.shared.windows.filter {$0.isKeyWindow}.first
        //topController = window?.rootViewController
        var topController = window?.rootViewController
        while let presentedController = topController?.presentedViewController {
            topController = presentedController
        }
        return topController
    }
    
    // Returns the topViewController from stack of topMostWindowController (if in navigation).
    class func currentViewController() -> UIViewController? {
        var currentViewController = UIApplication.topMostWindowController()
        while currentViewController != nil && currentViewController is UINavigationController && (currentViewController as! UINavigationController).topViewController != nil {
            currentViewController = (currentViewController as! UINavigationController).topViewController
        }
        return currentViewController
    }
}
