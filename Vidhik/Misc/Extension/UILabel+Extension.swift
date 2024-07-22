//
//  UILabel+Extension.swift
//  Vidhik
//
//  Created by NumeroEins on 05/02/24.
//

import UIKit

extension UILabel {
    func setLineSpacing(_ spacing: CGFloat) {
           guard let text = self.text else { return }

           let attributedString = NSMutableAttributedString(string: text)
           let paragraphStyle = NSMutableParagraphStyle()
           paragraphStyle.lineSpacing = spacing
           attributedString.addAttribute(NSAttributedString.Key.paragraphStyle, value: paragraphStyle, range: NSRange(location: 0, length: attributedString.length))
           self.attributedText = attributedString
       }
}
