//
//  NewsFeedTableViewCell.swift
//  Vidhik
//
//  Created by NumeroEins on 23/02/24.
//

import UIKit

class NewsFeedTableViewCell: UITableViewCell {
    
    //MARK: ======================= IBOutlets Properties ========================
    @IBOutlet weak var cellView: UIView!
    @IBOutlet weak var newsImage: UIImageView!
    @IBOutlet weak var lblNewsHeadline: UILabel!
    @IBOutlet weak var lblDetailNews: UILabel!
    @IBOutlet weak var btnReadMore: UIButton!
    
    // MARK: ================ Instance Properties ===============
    var readMoreCallback: (() -> ())?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.cellView.layer.cornerRadius = 10
        cellView.layer.shadowColor = UIColor.lightGray.cgColor
        cellView.layer.shadowOpacity = 0.5
        cellView.layer.shadowOffset = CGSize.zero
        cellView.layer.shadowRadius = 5
    }
    
    // MARK: ================ IBAction Method ===============
    @IBAction func readMoreButtonAction(_ sender: UIButton) {
        readMoreCallback?()
    }
    
}
