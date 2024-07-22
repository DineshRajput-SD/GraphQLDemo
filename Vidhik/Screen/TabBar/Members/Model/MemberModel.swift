//
//  MemberModel.swift
//  Vidhik
//
//  Created by NumeroEins on 09/02/24.
//

import UIKit


class MemberModel: NSObject {
    
    var strName : String = ""
    var isHidden : Bool = true
    init(dict : [String:Any]) {
      
        if let name = dict["name"] {
            self.strName = name as! String
        }
    }
}

