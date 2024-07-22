//
//  ScheduleConferencePopup.swift
//  Vidhik
//
//  Created by Dinesh Rajput on 20/03/24.
//

import UIKit

class ScheduleConferencePopup: UIView {
    // MARK: =============================== Instance Properties ===============================
    var callback: (() -> ())?
    var callbackCancelButton: (() -> ())?
    var callbackOKButton: (() -> ())?
    
    
    //MARK: =============================== Type Method ===============================
    static func showScheduleMettingView(onview view: UIView, callback: @escaping (() -> ())) -> ScheduleConferencePopup {
        let podNib = UINib(nibName: "ScheduleConferencePopup", bundle: nil).instantiate(withOwner: nil, options: nil).first as! ScheduleConferencePopup
        podNib.frame = UIScreen.main.bounds
        podNib.callback = callback
        view.addSubview(podNib)
        podNib.layoutIfNeeded()
        return podNib
    }

    // MARK: =============================== IBAction Methods ===============================
    @IBAction func crossButtonAction(_ sender: UIButton) {
        self.removeFromSuperview()
    }
    
    @IBAction func okButtonAction(_ sender: Any) {
        callbackOKButton?()
        self.removeFromSuperview()
    }
    
    @IBAction func cancelButtonAction(_ sender: UIButton) {
        callbackCancelButton?()
        self.removeFromSuperview()
    }
}
