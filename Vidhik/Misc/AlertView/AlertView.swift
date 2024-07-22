//  AlertView.swift

//

import UIKit
let alertTitle = "Alert"

extension String {
    func localize() -> String {
      return NSLocalizedString(self, comment: "")
    }
}
enum Alert: String {
    case Ok = "Ok"
    case Cancel = "Cancel"
    case retry = "Retry"
    
    func localize() -> String {
        return self.rawValue.localize()
    }
}

protocol AlertViewLocalize {
  func localize() -> String
}

extension String: AlertViewLocalize {

}

class AlertView: UIView {
    
  // MARK: ==================== IBOutlets Properties ====================
  @IBOutlet weak var imgSuccess: UIImageView!
  @IBOutlet weak var constImgHeight: NSLayoutConstraint! // 35
  
  //MARK: ==================== Properties ====================
  @IBOutlet weak var lblTitle: UILabel!
  @IBOutlet weak var lblMessage: UILabel!
  @IBOutlet weak var btnOk: UIButton!
  @IBOutlet weak var btnCancel: UIButton!
  @IBOutlet weak var fitnessAlertBgView: UIView!
  @IBOutlet weak var dialogView: UIView!
    
  var callBack: ((Int) -> ())?
  
    @discardableResult static func show(title: String, message: AlertViewLocalize) -> Bool {
    AlertView.show(title: title, message: message.localize(), okTitle: "Ok", cancelTitle: nil)
    return false
  }

  //MARK: ==================== Type Method Show AlertView ====================
  static func show(title: String?, message: String?, okTitle: String?, cancelTitle: String?, callBack: ((Int?) -> ())? = nil) {
    DispatchQueue.main.async {
      getAddedView()
      let nib = UINib(nibName: "AlertView", bundle: nil)
      let alertView = nib.instantiate(withOwner: nil, options: nil)[0] as! AlertView
      alertView.frame = UIScreen.main.bounds
      let visibleController = self.topViewController()
      visibleController?.view.addSubview(alertView)
      alertView.lblTitle.text = title ?? ""
      alertView.lblMessage.text = message ?? ""
      alertView.callBack = callBack
      alertView.btnOk.setTitle(okTitle ?? "Ok", for: .normal)
      alertView.btnCancel.setTitle(cancelTitle ?? "Cancel", for: .normal)
      alertView.animate()
      //alertView.constImgHeight.constant = isSuccess ? 35.0 : 0.0
      if let cancel = cancelTitle, cancel.count > 0 { return }
      alertView.btnCancel.removeFromSuperview()
    }
  }
  
  //MARK: ==================== Animate ====================
  func animate() {
    self.dialogView.transform = CGAffineTransform(scaleX: 0.6, y: 0.6)
    UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0.5, options: [], animations: {
      self.dialogView.transform = .identity
    }, completion: nil)
  }
  
  // MARK: ==================== remove ====================
  func remove() {
    UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0.5, options: [], animations: {
      self.dialogView.transform = CGAffineTransform(scaleX: 0.6, y: 0.6)
      self.dialogView.alpha = 0
      self.fitnessAlertBgView.alpha = 0
    }, completion: { isFinished in
      self.removeFromSuperview()
    })
  }
  
  // MARK: ==================== getAddedView ====================
  static func getAddedView() {
    let viewcontroller = AlertView.topViewController()
    if let views = viewcontroller?.view.subviews.filter({$0 is AlertView}) {
      let view = views.first
      view?.removeFromSuperview()
    }
  }
  
  static func topViewController() -> UIViewController? {
    var topController : UIViewController?
    let window = UIApplication.shared.windows.filter {$0.isKeyWindow}.first
    topController = window?.rootViewController
    while let presentedController = topController?.presentedViewController {
      topController = presentedController
    }
    return topController
  }
  
  //MARK: ==================== btnAction_Ok Action ====================
  @IBAction func btnAction_Ok(_ sender: UIButton) {
    remove()
    callBack?(sender.tag)
  }
  
  // MARK: ==================== btnAction_Ok ====================
  @IBAction func btnAction_Cancel(_ sender: UIButton) {
    remove()
    callBack?(sender.tag)
  }
}
