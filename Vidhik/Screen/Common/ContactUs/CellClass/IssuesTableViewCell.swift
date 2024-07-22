//
//  IssuesTableViewCell.swift
//  Vidhik
//
//  Created by NumeroEins on 07/03/24.
//

import UIKit

class IssuesTableViewCell: UITableViewCell {

    //MARK: =============================== IBOutlets Properties ===============================
    @IBOutlet weak var lblSupportType: UILabel!
    @IBOutlet weak var lblIssueDescription: UILabel!
    @IBOutlet weak var lblStatus: UILabel!
    @IBOutlet weak var lblDate: UILabel!
    @IBOutlet weak var btnEdit: UIButton!
    @IBOutlet weak var btnDelete: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

}
