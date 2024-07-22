//
//  CaseLawsCollectionCell.swift
//  Vidhik
//
//  Created by NumeroEins on 26/02/24.
//

import UIKit

class CaseLawsCollectionCell: UICollectionViewCell {
    // MARK: ============ IBOutlets Properties ============
    @IBOutlet weak var lblCaseLaws: UILabel!
    @IBOutlet weak var cellView: CustomView!
    
    override var isSelected: Bool {
        didSet {
            lblCaseLaws.textColor = isSelected ? .white : .black
            cellView.backgroundColor = isSelected ? .solidBlue : .transparentBlue
        }
    }
}
