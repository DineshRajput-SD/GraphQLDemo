//
//  MemberCell.swift
//  Vidhik
//
//  Created by NumeroEins on 09/02/24.
//

import UIKit

class MemberCell: UITableViewCell {
    //MARK: ====================== IBOutlet Properties ======================
    @IBOutlet weak var lblMemberName: UILabel!
    @IBOutlet weak var txtlblMemberName: UILabel!
    @IBOutlet weak var lblContactNumber: UILabel!
    @IBOutlet weak var txtlblContactNumber: UILabel!
    @IBOutlet weak var lblEmailDetail: UILabel!
    @IBOutlet weak var txtlblEmailDetail: UILabel!
    @IBOutlet weak var lblDesignation: UILabel!
    @IBOutlet weak var txtlblDesignation: UILabel!
    @IBOutlet weak var lblBranch: UILabel!
    @IBOutlet weak var txtlblBranch: UILabel!
    @IBOutlet weak var imgPhoneNumber: UIImageView!
    @IBOutlet weak var imgEmailLock: UIImageView!
    @IBOutlet weak var hiddenView: UIView!
    @IBOutlet weak var hiddenViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var imgDownUp: UIImageView!
    @IBOutlet weak var btnDelete: UIButton!
    @IBOutlet weak var imgUser: UIImageView!
    @IBOutlet weak var Vwline: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
