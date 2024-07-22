//
//  FilterTableViewCell.swift
//  Vidhik
//
//  Created by NumeroEins on 02/02/24.
//

import UIKit

class FilterTableViewCell: UITableViewCell {

    //MARK: ===================== IBOutlets Properties ======================
    @IBOutlet weak var lblPlace: UILabel!
    @IBOutlet weak var imgCheckBox: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    // MARK: ====================== Instance Method Using Image Check and Uncheck ======================
    func updateCheckboxImage(checked: Bool) {
        imgCheckBox.image = checked == true ? UIImage(named: "FilterCheckBox") : UIImage(named: "FilterEmptyBox")
    }
}
