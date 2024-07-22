//
//  OverruledTableViewCell.swift
//  Vidhik
//
//  Created by NumeroEins on 07/02/24.
//

import UIKit

class OverruledTableViewCell: UITableViewCell {

    // MARK: ================= IBOutlets Properties =================
    @IBOutlet weak var lblPreviousAttorney: UILabel!
    @IBOutlet weak var lblOverruled: UILabel!
    @IBOutlet weak var lblCurrentAttorney: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
