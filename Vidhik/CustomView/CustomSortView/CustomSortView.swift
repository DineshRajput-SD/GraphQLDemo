//
//  CustomSortView.swift
//  Vidhik
//
//  Created by NumeroEins on 02/02/24.
//

import UIKit

class CustomSortView: UIView {
    // MARK: ====================== IBoutlets Properties ======================
    @IBOutlet weak var viewSort: UIView!
    @IBOutlet weak var btnRecent: UIButton!
    @IBOutlet weak var btnRelevance: UIButton!
    @IBOutlet weak var btnMostCited: UIButton!
    @IBOutlet weak var btnJudgeBench: UIButton!
    
    // MARK: ====================== Instance Properties ======================
    var callbackForRecent: (() -> ())?
    var callBackForRelevance: (() -> ())?
    var callbackForMostCited: (() -> ())?
    var callBackForJudgeBench: (() -> ())?
    
    let nibName = "CustomSortView"
    var view: UIView!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    private func commonInit() {
        self.view = loadViewFromNib()
        view.frame = bounds
        addSubview(view)
    }
    
    private func loadViewFromNib() -> UIView? {
        let nib = UINib(nibName: nibName, bundle: nil)
        return nib.instantiate(withOwner: self, options: nil).first as? UIView
    }
    
    // MARK: ====================== IBAction Methods ======================
    @IBAction func btnRecentAction(_ sender: UIButton) {
        callbackForRecent?()
    }
    
    @IBAction func btnRelevanceAction(_ sender: UIButton) {
        callBackForRelevance?()
    }
    
    @IBAction func btnMostCitedAction(_ sender: UIButton) {
        callbackForMostCited?()
    }
    
    @IBAction func btnJudgeBenchAction(_ sender: UIButton) {
        callBackForJudgeBench?()
    }
}
