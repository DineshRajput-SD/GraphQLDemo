//
//  CustomTextField.swift
//  Vidhik
//
//  Created by NumeroEins on 15/01/24.
//

import Foundation
import UIKit

@IBDesignable
public class CustomView: UIView {
    
    @IBInspectable public var borderWidth: CGFloat = 0.0 {
            didSet {
                layer.borderWidth = borderWidth
            }
        }

        /// Sets the color of the border
        @IBInspectable public var borderColor: UIColor = .clear {
            didSet {
                layer.borderColor = borderColor.cgColor
            }
        }

        /// Make the corners rounded with the specified radius
        @IBInspectable public var cornerRadius: CGFloat = 0.0 {
            didSet {
                layer.cornerRadius = cornerRadius
            }
        }
}
