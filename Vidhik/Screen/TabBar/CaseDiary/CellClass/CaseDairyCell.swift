//
//  CaseDairyCell.swift
//  Vidhik
//
//  Created by NumeroEins on 08/02/24.
//

import UIKit

class CaseDairyCell: UITableViewCell {
    
    // MARK: =========================== IBoutlets Properties ===========================
    @IBOutlet weak var lblCaseName: UILabel!
    @IBOutlet weak var lblCaseNametxt: UILabel!
    @IBOutlet weak var lblCaseNoTxt: UILabel!
    @IBOutlet weak var lblCaseNo: UILabel!
    @IBOutlet weak var lblRegDatetxt: UILabel!
    @IBOutlet weak var lblRegDate: UILabel!
    @IBOutlet weak var lblCourtNameTxt: UILabel!
    @IBOutlet weak var lblCourtName: UILabel!
    @IBOutlet weak var lblApplicantTxt: UILabel!
    @IBOutlet weak var lblApplicant: UILabel!
    @IBOutlet weak var lblRespoundedTxt: UILabel!
    @IBOutlet weak var lblRespounded: UILabel!
    @IBOutlet weak var lblCaseStageTxt: UILabel!
    @IBOutlet weak var lblCaseStage: UILabel!
    @IBOutlet weak var lblNextHearingTxt: UILabel!
    @IBOutlet weak var lblNextHearing: UILabel!
    @IBOutlet weak var lblApplicatrionTxt: UILabel!
    @IBOutlet weak var lblApplication: UILabel!
    @IBOutlet weak var lblCityTxt: UILabel!
    @IBOutlet weak var lblCity: UILabel!
    @IBOutlet weak var lblOwnerAndAssignTxt: UILabel!
    @IBOutlet weak var lblOwnerAndAssign: UILabel!
    @IBOutlet weak var hiddenView: UIView!
    @IBOutlet weak var hiddenViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var imgDownUp: UIImageView!
    @IBOutlet weak var btnEdit: UIButton!
    @IBOutlet weak var btnViewApplication: UIButton!

    func setHiddenView(hidden: Bool) { }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.lblCaseName.text = "Case Name"
    }
}
