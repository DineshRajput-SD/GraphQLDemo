//
//  CreateChartRoomListCell.swift
//  Vidhik
//
//  Created by NumeroEins on 09/02/24.
//

import UIKit

class CreateChartRoomListCell: UITableViewCell {
    // MARK: ============ IBOutlets Properties ============
    @IBOutlet weak var lblRoomName: UILabel!
    @IBOutlet weak var txtlblRooName: UILabel!
    @IBOutlet weak var lblRoomId: UILabel!
    @IBOutlet weak var txtlblRoomId: UILabel!
    @IBOutlet weak var lblCreaterd: UILabel!
    @IBOutlet weak var txtlblCreaterd: UILabel!
    @IBOutlet weak var lblOnlineLawyers: UILabel!
    @IBOutlet weak var txtlblOnlineLawyers: UILabel!
    @IBOutlet weak var hiddenView: UIView!
    @IBOutlet weak var hiddenViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var imgDownUp: UIImageView!
    @IBOutlet weak var btnEdit: UIButton!
    @IBOutlet weak var btnDelete: UIButton!
    @IBOutlet weak var btnLeave: UIButton!

    func setHiddenView(hidden: Bool) {
           hiddenView.isHidden = hidden
       }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
