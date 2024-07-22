//
//  LatestCasesTableViewCell.swift
//  Vidhik
//
//  Created by NumeroEins on 01/02/24.
//

import UIKit

class LatestCasesTableViewCell: UITableViewCell {

    // MARK: ================= IBOutlets Properties =================
    @IBOutlet weak var lblCaseTitle: UILabel!
    @IBOutlet weak var lblCaseDescription: UILabel!
    @IBOutlet weak var lblCasePlace: UILabel!
    @IBOutlet weak var lblBench: UILabel!
    @IBOutlet weak var lblCited: UILabel!
    @IBOutlet weak var lblActsName: UILabel!
    @IBOutlet weak var btnViewMore: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.lblActsName.setLineSpacing(2)
        self.lblCaseDescription.setLineSpacing(2)
    }

}
