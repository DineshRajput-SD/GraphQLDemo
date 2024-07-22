//
//  MeetingCompletedVC.swift
//  Vidhik
//
//  Created by Dinesh Rajput on 21/03/24.
//

import UIKit

class MeetingCompletedVC: UIViewController {
    
    // MARK: =============================== View Controoler Life Cycle Methods ===============================
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //MARK: =============================== IBAction Methods ===============================
    @IBAction func backButtonAction(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func goToHomeButtonAction(_ sender: UIButton) {
        self.popToSpecificController(ConferenceClientListVC.self)
    }
}
