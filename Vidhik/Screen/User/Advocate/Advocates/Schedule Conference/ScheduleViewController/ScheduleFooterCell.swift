//
//  ScheduleFooterCell.swift
//  Vidhik
//
//  Created by Dinesh Rajput on 07/03/24.
//

import UIKit

class ScheduleFooterCell: UICollectionViewCell {
    
    var makePaymentCallback: (() -> ())?

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    // MARK: ================================ IBAction Method ================================
    @IBAction func makePaymentButton(_ sender: UIButton) {
        makePaymentCallback?()
    }
}
