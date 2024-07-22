//
//  FeedTableView.swift
//  Vidhik
//
//  Created by NumeroEins on 19/01/24.
//

import UIKit

final class FeedTableView: UITableView {
   
    override var contentSize:CGSize {
        didSet {
            invalidateIntrinsicContentSize()
        }
    }
    
    override var intrinsicContentSize: CGSize {
        layoutIfNeeded()
        return CGSize(width: UIView.noIntrinsicMetric, height: contentSize.height)
    }
}
