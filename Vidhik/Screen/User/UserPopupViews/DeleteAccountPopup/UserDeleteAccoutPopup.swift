//
//  UserDeleteYourAccoutPopup.swift
//  Vidhik
//
//  Created by Dinesh Rajput on 20/03/24.
//

import UIKit

class UserDeleteAccoutPopup: UIView {
    // MARK: ================================ IBOutlet Property ================================
    @IBOutlet weak var btnDelete: UIButton!
    
    // MARK: ================================ Instance Properties ================================
    var callback: (() -> ())?
    var callbackCancelButton: (() -> ())?
    var callbackDeleteButton: (() -> ())?
    var callbackCrossButton: (() -> ())?
    
    //MARK: ================================ Type Method ================================
    static func showUserDeleteAccountView(onview view: UIView, callback: @escaping (() -> ())) -> UserDeleteAccoutPopup {
        let podNib = UINib(nibName: "UserDeleteAccoutPopup", bundle: nil).instantiate(withOwner: nil, options: nil).first as! UserDeleteAccoutPopup
        podNib.frame = UIScreen.main.bounds
        podNib.callback = callback
        view.addSubview(podNib)
        podNib.layoutIfNeeded()
        return podNib
    }
    
    //MARK: ================================ IBAction Methods ================================
    @IBAction func crosButtonAction(_ sender: Any) {
        self.removeFromSuperview()
    }
    
    @IBAction func deleteButtonAction(_ sender: UIButton) {
        callbackDeleteButton?()
        self.removeFromSuperview()
    }
    
    @IBAction func cancelButtonAction(_ sender: UIButton) {
        callbackCancelButton?()
        self.removeFromSuperview()
    }

}
