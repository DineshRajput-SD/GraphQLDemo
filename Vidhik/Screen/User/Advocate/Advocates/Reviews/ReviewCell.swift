//
//  ReviewCell.swift
//  Vidhik
//
//  Created by Dinesh Rajput on 01/03/24.
//

import UIKit

class ReviewCell: UITableViewCell {
    
    
    // MARK: ================================ IBOutlets Properties ================================
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var showRatingView: StarRateView!
    @IBOutlet weak var ratingCount: UILabel!
    @IBOutlet weak var timeShowLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    // MARK: ================================ SetRating View Data Methods ================================
    func setRatingViewListData() {
        profileImage.image = UIImage(named: "test")
        userName.text = ""
        ratingCount.text = "5.0"
        timeShowLabel.text = "1 day ago"
    }
}
