//
//  SenderTableViewCell.swift
//  Vidhik
//
//  Created by NumeroEins on 28/02/24.
//

import UIKit

class SenderTableViewCell: UITableViewCell {

    //MARK: ================ IBOutlet Properties ================
    @IBOutlet weak var msgView: UIView!
    @IBOutlet weak var senderImage: UIImageView!
    @IBOutlet weak var lblSenderMsg: UILabel!
    @IBOutlet weak var lblMsgTime: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

}
