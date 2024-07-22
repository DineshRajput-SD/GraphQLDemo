//
//  CommentTableViewCell.swift
//  Vidhik
//
//  Created by NumeroEins on 22/01/24.
//

import UIKit

class CommentTableViewCell: UITableViewCell {

    //MARK: ====================== IBOutlet Properties ======================
    @IBOutlet weak var imgProfilePhoto: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblLocation: UILabel!
    @IBOutlet weak var lblTime: UILabel!
    @IBOutlet weak var lblPostData: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.imgProfilePhoto.layer.cornerRadius = 20
    }
}
