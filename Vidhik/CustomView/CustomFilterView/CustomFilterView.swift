//
//  CustomFilterView.swift
//  Vidhik
//
//  Created by NumeroEins on 02/02/24.
//

import UIKit

class CustomFilterView: UIView {
    
    //MARK: ================= IBOutlets Properties ====================
    @IBOutlet weak var filterTableView: UITableView!
    @IBOutlet weak var btnDone: UIButton!
    @IBOutlet weak var btnClear: UIButton!
    
    var callBackForDone: (() -> ())?
    var callBackForClear: (() -> ())?
    
    let nibName = "CustomFilterView"
    var view: UIView!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
        self.filterTableView.delegate = self
        self.filterTableView.dataSource = self
        self.filterTableView.register(UINib(nibName: "FilterTableViewCell", bundle: nil), forCellReuseIdentifier: "FilterTableViewCell")
        
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
    
    //MARK: ================= IBAction Methods ====================
    @IBAction func btnDoneAction(_ sender: UIButton) {
        callBackForDone?()
    }
    
    @IBAction func btnClear(_ sender: UIButton) {
        callBackForClear?()
    }
    
}

//MARK:  ===================== Extension UITextField DataSource and Delegates Methods =========================
extension CustomFilterView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = filterTableView.dequeueReusableCell(withIdentifier: "FilterTableViewCell", for: indexPath) as! FilterTableViewCell
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
}
