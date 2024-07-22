//
//  ConfirmDeleteAccountPopup.swift
//  Vidhik
//
//  Created by NumeroEins on 08/04/24.
//

import Foundation
import UIKit

class ConfirmDeleteAccountPopup: UIView {
    // MARK: =============================== IBOutlet Property ===============================
    @IBOutlet weak var btnDelete: UIButton!
    
    // MARK: =============================== Instance Properties ===============================
    var callback: (() -> ())?
    var callbackDeleteButton: (() -> ())?
    var callbackCrossButton: (() -> ())?
    
    //MARK: =============================== Type Methods ===============================
    static func showUserDeleteAccountView(onview view: UIView, callback: @escaping (() -> ())) -> ConfirmDeleteAccountPopup {
        let podNib = UINib(nibName: "ConfirmDeleteAccountPopup", bundle: nil).instantiate(withOwner: nil, options: nil).first as! ConfirmDeleteAccountPopup
        podNib.frame = UIScreen.main.bounds
        podNib.callback = callback
        view.addSubview(podNib)
        podNib.layoutIfNeeded()
        return podNib
    }
    
    
    //MARK: =============================== IBAction Methods ===============================
    @IBAction func crosButtonAction(_ sender: Any) {
        self.removeFromSuperview()
    }
    
    @IBAction func deleteButtonAction(_ sender: UIButton) {
        self.removeFromSuperview()
    }
}
