//
//  NavigationBarView.swift
//  Vidhik
//
//  Created by NumeroEins on 31/01/24.
//

import UIKit

protocol NavigationBarViewDelegate {
    func navigationBackAction()
    func navigationNotificationAction()
    func navigationSearchAction()
    func naviagtionProfileAction()
}

class NavigationBarView: UIView {
    //MARK: ======================== IBOutlet Properties =========================
    @IBOutlet weak var btnBack: UIButton!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var btnNotification: UIButton!
    @IBOutlet weak var btnSearch: UIButton!
    @IBOutlet weak var btnProfile: UIButton!
    
    let nibName = "NavigationBarView"
    var delegate: NavigationBarViewDelegate?
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    private func commonInit() {
        guard let view = loadViewFromNib() else { return }
        view.frame = bounds
        addSubview(view)
    }
    
    private func loadViewFromNib() -> UIView? {
        let nib = UINib(nibName: nibName, bundle: nil)
        return nib.instantiate(withOwner: self, options: nil).first as? UIView
    }
    
    //MARK: ====================== IBAction Methods ======================
    @IBAction func btnBackAction(_ sender: UIButton) {
        delegate?.navigationBackAction()
    }
    
    @IBAction func btnNotificationAction(_ sender: UIButton) {
        delegate?.navigationNotificationAction()
    }
    
    @IBAction func btnSearchAction(_ sender: UIButton) {
        delegate?.navigationSearchAction()
    }
    
    @IBAction func btnProfileAction(_ sender: UIButton) {
        delegate?.naviagtionProfileAction()
    }
}
