//
//  SignUpDisclaimerView.swift
//  Vidhik
//
//  Created by NumeroEins on 22/03/24.
//

import Foundation
import UIKit

class SignUpDisclaimerView: UIView {
    
    //MARK: ======================= IBOutlets Properties ==========================
    @IBOutlet weak var lblNoLegal: UILabel!
    @IBOutlet weak var btnTermsAndCond: UIButton!
    @IBOutlet weak var btnPrivacyPolicy: UIButton!
    @IBOutlet weak var btnCookiesPolicy: UIButton!
    @IBOutlet weak var btnCopyrights: UIButton!
    @IBOutlet weak var btnTrustAndSafety: UIButton!
    @IBOutlet weak var btnCommunity: UIButton!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var btnCheckBox: UIButton!
    @IBOutlet weak var btnAccept: UIButton!
    @IBOutlet weak var btnReject: UIButton!
    @IBOutlet weak var btnCancel: UIButton!
    
    let nibName = "SignUpDisclaimerView"
    var view: UIView!
    var vc: UIViewController?
    var tableData = [["mainTitle": "Terms and conditions","title": "1. Use of the Website", "description": "1.1. You must be at least 18 years old to use the Website. By using the Website, you represent and warrant that you are at least 18 years old.1.2. You agree to use the Website only for lawful purposes and in accordance with these Terms and all applicable laws and regulations.1.3. You may not use the Website in any manner that could disable, overburden, damage, or impair the Website or interfere with any other party's use of the Website."], ["mainTitle": "Privacy policy","title": "2. Use of the Website", "description": "1.1. You must be at least 18 years old to use the Website. By using the Website, you represent and warrant that you are at least 18 years old.1.2. You agree to use the Website only for lawful purposes and in accordance with these Terms and all applicable laws and regulations.1.3. You may not use the Website in any manner that could disable, overburden, damage, or impair the Website or interfere with any other party's use of the Website."], ["mainTitle": "Cookies Policy","title": "3. Use of the Website", "description": "1.1. You must be at least 18 years old to use the Website. By using the Website, you represent and warrant that you are at least 18 years old.1.2. You agree to use the Website only for lawful purposes and in accordance with these Terms and all applicable laws and regulations.1.3. You may not use the Website in any manner that could disable, overburden, damage, or impair the Website or interfere with any other party's use of the Website."], ["mainTitle": "Copyrights","title": "3. Use of the Website", "description": "1.1. You must be at least 18 years old to use the Website. By using the Website, you represent and warrant that you are at least 18 years old.1.2. You agree to use the Website only for lawful purposes and in accordance with these Terms and all applicable laws and regulations.1.3. You may not use the Website in any manner that could disable, overburden, damage, or impair the Website or interfere with any other party's use of the Website."],["mainTitle": "Trust and safety","title": "3. Use of the Website", "description": "1.1. You must be at least 18 years old to use the Website. By using the Website, you represent and warrant that you are at least 18 years old.1.2. You agree to use the Website only for lawful purposes and in accordance with these Terms and all applicable laws and regulations.1.3. You may not use the Website in any manner that could disable, overburden, damage, or impair the Website or interfere with any other party's use of the Website."]]
    
    var closerForcancelView:(( _ strdict: String) ->())?
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    init(frame: CGRect, inview: UIViewController) {
        super.init(frame: frame)
        self.xibSetUp(frame: CGRect(x: 0, y: 0, width: frame.width, height: frame.height))
        self.setupUI()
        self.setUpTableView()
        vc = inview
    }

    func xibSetUp(frame: CGRect) {
        self.view = loadNibView()
        view.frame = frame
        addSubview(view)
    }
    
    func loadNibView() -> UIView {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: nibName, bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil).first as! UIView
        return view
    }

     func setUpTableView() {
         self.tableView.dataSource = self
         self.tableView.delegate = self
         self.tableView.register(UINib(nibName: "TermsAndConditionTableCell", bundle: nil), forCellReuseIdentifier: "TermsAndConditionTableCell")
     }
    
    private func setupUI() {
        self.lblNoLegal.font = UIFont(name: "Poppins-Regular", size: 14)
        self.btnTermsAndCond.titleLabel?.font = UIFont(name: "Poppins-Regular", size: 14)
        self.btnPrivacyPolicy.titleLabel?.font = UIFont(name: "Poppins-Regular", size: 14)
        self.btnCookiesPolicy.titleLabel?.font = UIFont(name: "Poppins-Regular", size: 14)
        self.btnCopyrights.titleLabel?.font = UIFont(name: "Poppins-Regular", size: 14)
        self.btnTrustAndSafety.titleLabel?.font = UIFont(name: "Poppins-Regular", size: 14)
        self.btnCommunity.titleLabel?.font = UIFont(name: "Poppins-Regular", size: 14)
        
        let fullString = "1. No Legal Advice: The information contained on the Website is for general informational purposes only and is not intended to provide legal advice. You should consult with a qualified legal professional for advice regarding your individual situation.\n\n2. No Attorney-Client Relationship: Your use of the Website does not create an attorney-client relationship between you and vidhik. Such a relationship can only be established through a specific written agreement with us."
        let attributedString = NSMutableAttributedString(string: fullString)
        
        let boldRange = NSRange(location: 0, length: 19)
        attributedString.addAttribute(.font, value: UIFont.boldSystemFont(ofSize: 14), range: boldRange)
        
        let boldRange2 = NSRange(location: 253, length: 35)
        attributedString.addAttribute(.font, value: UIFont.boldSystemFont(ofSize: 14), range: boldRange2)
        lblNoLegal.attributedText = attributedString
    }
    
    @IBAction func cancelButtonAction(_ sender: Any) {
        self.closerForcancelView?("Close")
    }
}

//MARK: ======================= UITableView Delegate and DataSource Methods =========================
extension SignUpDisclaimerView: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        tableData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TermsAndConditionTableCell", for: indexPath) as! TermsAndConditionTableCell
        let data = tableData[indexPath.row]
        cell.lblmainTitle.text = data["mainTitle"]
        cell.lblTitle.text = data["title"]
        cell.lblDescription.text = data["description"]
        return cell
    }
}
