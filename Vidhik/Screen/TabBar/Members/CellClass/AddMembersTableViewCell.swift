//
//  AddMembersTableViewCell.swift
//  Vidhik
//
//  Created by NumeroEins on 09/02/24.
//

import UIKit

class AddMembersTableViewCell: UITableViewCell {
    //MARK: ====================== IBOutlet Properties ======================
    @IBOutlet weak var lblMemberName: UILabel!
    @IBOutlet weak var lblDesignation: UILabel!
    @IBOutlet weak var lblExperiance: UILabel!
    @IBOutlet weak var lblRating: UILabel!
    @IBOutlet weak var btnAddMember: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.btnAddMember.layer.cornerRadius = 12
    }

}
