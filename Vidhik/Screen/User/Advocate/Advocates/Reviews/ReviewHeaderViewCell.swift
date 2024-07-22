//
//  HeaderViewCell.swift
//  Vidhik
//
//  Created by Dinesh Rajput on 05/03/24.
//

import UIKit

class ReviewHeaderViewCell: UITableViewCell {
    
    // MARK: ================================ IBOutlets Properties ================================
    @IBOutlet weak var ratingCountLabel: UILabel!
    @IBOutlet weak var starRatingShowView: StarRateView!
    @IBOutlet weak var basedOnReviewLabel: UILabel!
    @IBOutlet weak var addRatingView: UIView!
    @IBOutlet weak var addStarRating: StarRateView!
    @IBOutlet weak var ratingButton: UIButton!
    
    var callback:(() -> ())?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        addRatingView.isHidden = true
    }

    // MARK: ================================ IBaction Methods ================================
    @IBAction func ratingButtonAction(_ sender: UIButton) {
        addRatingView.isHidden = false
        callback?()
    }
}


