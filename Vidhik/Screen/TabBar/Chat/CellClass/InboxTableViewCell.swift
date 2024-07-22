//
//  ChatRoomTableViewCell.swift
//  Vidhik
//
//  Created by NumeroEins on 09/02/24.
//

import UIKit

class InboxTableViewCell: UITableViewCell {

    //MARK: ============ IBOutlet ============
    @IBOutlet weak var imgProfilePhoto: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblMessage: UILabel!
    @IBOutlet weak var btnMoreOptions: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.imgProfilePhoto.layer.cornerRadius = 21
    }
}
