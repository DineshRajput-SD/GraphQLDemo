//
//  AdvocatesListCell.swift
//  Vidhik
//
//  Created by Dinesh Rajput on 27/02/24.
//

import UIKit

class AdvocatesListCell: UITableViewCell {
    // MARK: ================================ IBOutlets Properties ================================
    @IBOutlet weak var advocateProfileImage: UIImageView!
    @IBOutlet weak var advocateAddressLabel: UILabel!
    @IBOutlet weak var advocateSpecilizationLabel: UILabel!
    @IBOutlet weak var advocateExperienceLabel: UILabel!
    @IBOutlet weak var advocateRatingCountLabel: UILabel!
    
    // MARK: ================================ Instance Properties ================================
    var callback:(() -> ())?
    var callbackRating: (() -> ())?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    //MARK: ================================ Instance Method Set Advocate List Data ================================
    func advocateListData() {
        advocateProfileImage.image = UIImage(named: "DummyImage")
        advocateAddressLabel.text = "Bhopal,MP"
        advocateSpecilizationLabel.text = "Criminal Lawyer"
        advocateExperienceLabel.text = "10+ Experience"
        advocateRatingCountLabel.text = "(4.0)"
    }
    
    // MARK: ================================ IBAction Methods ================================
    @IBAction func seeDetailsButton(_ sender: UIButton) {
        callback?()
    }
    
    @IBAction func ratingButtonAction(_ sender: UIButton) {
        callbackRating?()
    }
}
