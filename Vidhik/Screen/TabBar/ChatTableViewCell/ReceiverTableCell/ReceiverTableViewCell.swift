//
//  ReceiverTableViewCell.swift
//  Vidhik
//
//  Created by NumeroEins on 28/02/24.
//

import UIKit

class ReceiverTableViewCell: UITableViewCell {

    //MARK: ================ IBOutlet Properties ================
    @IBOutlet weak var msgView: UIView!
    @IBOutlet weak var receiverImage: UIImageView!
    @IBOutlet weak var lblReceiverName: UILabel!
    @IBOutlet weak var lblMsg: UILabel!
    @IBOutlet weak var lblMsgTime: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
