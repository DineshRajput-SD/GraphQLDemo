//
//  SubscriptionPlanCollectionCell.swift
//  Vidhik
//
//  Created by NumeroEins on 28/03/24.
//

import UIKit

class SubscriptionPlanCollectionCell: UICollectionViewCell {
    
    //MARK: =============== IBOutlet =============== 
    @IBOutlet weak var imgActivePlan: UIImageView!
    @IBOutlet weak var lblPlanType: UILabel!
    @IBOutlet weak var lblPlanLevel: UILabel!
    @IBOutlet weak var lblPlanPrice: UILabel!
    @IBOutlet weak var imgChatRoom: UIImageView!
    @IBOutlet weak var lblChatRoom: UILabel!
    @IBOutlet weak var imgCaseDairy: UIImageView!
    @IBOutlet weak var lblCaseDairy: UILabel!
    @IBOutlet weak var imgBlog: UIImageView!
    @IBOutlet weak var lblBlog: UILabel!
    @IBOutlet weak var imgTopListing: UIImageView!
    @IBOutlet weak var lblTopListing: UILabel!
    @IBOutlet weak var btnChoosePlan: UIButton!
    
    var currentActivePlan: Bool?
}

