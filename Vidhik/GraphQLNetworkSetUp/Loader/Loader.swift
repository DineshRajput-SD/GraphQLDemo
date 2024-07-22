
//  Loader.swift
//  CalenderDemoApp
//
//  Created by Dinesh Rajput on 29/03/24.
import UIKit

class Loader: UIView {
    // MARK:  ======================= IBOutlets Properties ==================
    @IBOutlet weak var imgView : UIImageView?
    @IBOutlet weak var viewBg : UIView?
    @IBOutlet weak var viewContainer : UIView?
    @IBOutlet weak var lblLoaderTitle: UILabel!
    
    // MARK:  ======================= Type Properties ==================
    static var loaderView : Loader!
    
    // MARK:  ======================= Type Methods ==================
    class func show() {
        if loaderView != nil {
            return
        }
        
        if Thread.isMainThread {
            Loader.start()
        } else {
            DispatchQueue.main.sync {
                Loader.start()
            }
        }
    }
    
    // MARK:  ======================= Type Private Methods Start Loader ==================
    class private func start(){
        loaderView = UINib(nibName: "Loader", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as? Loader
        let keyWindow = UIApplication.shared.windows.filter {$0.isKeyWindow}.first
        keyWindow?.addSubview(loaderView!)
        loaderView.frame = UIScreen.main.bounds
        loaderView.setupLoaderUI()
        loaderView.showWithAnimation()
    }
    
    // MARK:  ======================= Type Private Methods Hide Loader ==================
    class func hide() {
        if Thread.isMainThread {
            loaderView?.removeFromSuperview()
            loaderView = nil
        } else {
            DispatchQueue.main.sync {
                loaderView?.removeFromSuperview()
                loaderView = nil
            }
        }
    }
    
    // MARK:  ======================= Instance Methods ==================
    func setupLoaderUI() {
        let rotation = CABasicAnimation(keyPath: "transform.rotation")
        rotation.fromValue = 0
        rotation.toValue = 2 * Double.pi
        rotation.duration = 0.8
        rotation.repeatCount = Float.infinity
        self.imgView!.layer.add(rotation, forKey: "Spin")
    }
    
    // MARK:  ======================= Instance Methods Show Loader With Animation ==================
    func showWithAnimation() {
        viewContainer?.transform = CGAffineTransform(scaleX: 0.70, y: 0.70)
        UIView.animate(withDuration: 0.2, delay: 0.0, options: .curveLinear, animations: { () -> Void in
            self.viewContainer?.transform = .identity
        }, completion: nil)
    }
}


