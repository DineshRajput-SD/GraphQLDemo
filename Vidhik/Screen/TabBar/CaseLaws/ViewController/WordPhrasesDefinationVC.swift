//
//  WordPhrasesDefinationVC.swift
//  Vidhik
//
//  Created by NumeroEins on 05/03/24.
//

import UIKit

class WordPhrasesDefinationVC: UIViewController {

    //MARK: ===================== IBOutlet =====================
    @IBOutlet weak var lblWordPhraseTitle: UILabel!
    @IBOutlet weak var lblDefination: UILabel!
    @IBOutlet weak var btnCancel: UIButton!
    @IBOutlet weak var btnOk: UIButton!
    
    var closerForbackVC:(( _ strdict: String) ->())?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //MARK: IBAction
    @IBAction func btnCancelAction(_ sender: UIButton) {
        self.closerForbackVC?("hyy")
        dismiss(animated: false)
    }

    @IBAction func btnOkAction(_ sender: UIButton) {
        self.closerForbackVC?("hyy")
        dismiss(animated: false)
    }
}
