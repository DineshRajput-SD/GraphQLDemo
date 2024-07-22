//
//  ConferenceTableViewCell.swift
//  Vidhik
//
//  Created by NumeroEins on 21/02/24.
//

import UIKit

class ConferenceTableViewCell: UITableViewCell {

    //MARK: =================== IBOutlet Properties ===================
    @IBOutlet weak var lblClientName: UILabel!
    @IBOutlet weak var lblClientId: UILabel!
    @IBOutlet weak var lblDate: UILabel!
    @IBOutlet weak var lblTime: UILabel!
    @IBOutlet weak var imgDownUp: UIImageView!
    @IBOutlet weak var btnJoin: UIButton!
    @IBOutlet weak var hiddenView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
