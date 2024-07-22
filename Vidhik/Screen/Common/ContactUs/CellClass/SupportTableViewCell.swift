//
//  SupportTableViewCell.swift
//  Vidhik
//
//  Created by NumeroEins on 07/03/24.
//

import UIKit

class SupportTableViewCell: UITableViewCell, UITextViewDelegate {
    
    //MARK: =============================== IBOutlets Properties ===============================
    @IBOutlet weak var problemDropDownView: UIView!
    @IBOutlet weak var btnDropDown: UIButton!
    @IBOutlet weak var txtDescription: UITextView!
    @IBOutlet weak var txtSelectedProblem: UITextField!
    @IBOutlet weak var  btnSubmit: UIButton!
    
    var placeHolderColor = UIColor(red: 0, green: 0, blue: 0.0980392, alpha: 0.22)
    
    override func awakeFromNib() {
        super.awakeFromNib()
        txtDescription.text = "Type your description"
        txtDescription.textColor = placeHolderColor
        txtDescription.delegate = self
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if txtDescription.textColor == placeHolderColor {
            txtDescription.text = nil
            txtDescription.textColor = UIColor.black
        }
    }
    
}
