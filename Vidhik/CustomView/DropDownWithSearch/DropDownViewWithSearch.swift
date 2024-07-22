//
//  DropDownViewWithSearch.swift
//  Vidhik
//
//  Created by NumeroEins on 05/03/24.
//

import UIKit

class DropDownViewWithSearch: UIView {
    //MARK: ============================ IBOutlets Properties ============================
    @IBOutlet weak var dropDownTable: UITableView!
    @IBOutlet weak var txtSearch: UITextField!
    @IBOutlet weak var dropDownView: UIView!
    
    var closerForbackVC:(( _ strdict: String) -> ())?
    let nibName = "DropDownViewWithSearch"
    var view: UIView!
    var selectedItemText: String?
    var tableData: [String]?
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
        self.dropDownTable.delegate = self
        self.dropDownTable.dataSource = self
        self.dropDownTable.register(UINib(nibName: "FilterTableViewCell", bundle: nil), forCellReuseIdentifier: "FilterTableViewCell")
        addShadow(view: dropDownView)
        dropDownView.layer.cornerRadius = 12
        
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
    
    private func addShadow(view: UIView) {
        view.layer.shadowColor = UIColor.systemGray4.cgColor
        view.layer.shadowOpacity = 1
        view.layer.shadowOffset = CGSize.zero
        view.layer.shadowRadius = 5
    }
}

//MARK: ============================ Extension UITextField Delegate and DataSource Methods ============================
extension DropDownViewWithSearch: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        tableData?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = dropDownTable.dequeueReusableCell(withIdentifier: "FilterTableViewCell", for: indexPath) as! FilterTableViewCell
        cell.imgCheckBox.isHidden = true
        cell.lblPlace.text = tableData?[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Something selected")
        self.selectedItemText = tableData?[indexPath.row]
        self.closerForbackVC?("Hi")
    }
}

