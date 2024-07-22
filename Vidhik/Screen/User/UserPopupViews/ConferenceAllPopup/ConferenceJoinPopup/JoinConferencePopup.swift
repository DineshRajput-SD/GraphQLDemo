//
//  JoinConferencePopup.swift
//  Vidhik
//
//  Created by Dinesh Rajput on 20/03/24.
//

import UIKit

class JoinConferencePopup: UIView {
    // MARK: ================================ Instance Properties ================================
    var callback: (() -> ())?
    var callbackJoinConferenceButton: (() -> ())?
    var callbackBackButton: (() -> ())?
    
    
    //MARK: ================================ Type Method ================================
    static func showJoinConferenceView(onview view: UIView, callback: @escaping (() -> ())) -> JoinConferencePopup {
        let podNib = UINib(nibName: "JoinConferencePopup", bundle: nil).instantiate(withOwner: nil, options: nil).first as! JoinConferencePopup
        podNib.frame = UIScreen.main.bounds
        podNib.callback = callback
        view.addSubview(podNib)
        podNib.layoutIfNeeded()
        return podNib
    }
    
    //MARK: ================================ IBAction Methods ================================
    @IBAction func backButtonAction(_ sender: UIButton) {
        callbackBackButton?()
        self.removeFromSuperview()
    }
    
    @IBAction func joinConferenceButtonAction(_ sender: UIButton) {
        callbackJoinConferenceButton?()
        self.removeFromSuperview()
    }
}
