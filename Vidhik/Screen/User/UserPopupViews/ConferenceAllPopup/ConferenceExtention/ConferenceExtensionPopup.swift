//
//  ConferenceExtensionPopup.swift
//  Vidhik
//
//  Created by Dinesh Rajput on 20/03/24.
//

import UIKit

class ConferenceExtensionPopup: UIView {
    // MARK: ================================ Instance Properties ================================
    var callback: (() -> ())?
    var callbackYesButton: (() -> ())?
    var callbackNoButton: (() -> ())?
    var callbackBackButton: (() -> ())?
    
    //MARK: ================================ Type Method ================================
    static func showConferenceExtensionView(onview view: UIView, callback: @escaping (() -> ())) -> ConferenceExtensionPopup {
        let podNib = UINib(nibName: "ConferenceExtensionPopup", bundle: nil).instantiate(withOwner: nil, options: nil).first as! ConferenceExtensionPopup
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
    
    @IBAction func goYesButtonAction(_ sender: UIButton) {
        callbackYesButton?()
        self.removeFromSuperview()
    }

    @IBAction func goNoButtonAction(_ sender: UIButton) {
        callbackNoButton?()
        self.removeFromSuperview()
    }
}
