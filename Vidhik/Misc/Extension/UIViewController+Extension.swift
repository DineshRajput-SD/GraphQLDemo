//
//  Extension.swift
//  Vidhik
//
//  Created by NumeroEins on 02/02/24.
//

import UIKit
import AVFoundation

extension UIViewController {
    
    func setUpTriangle(targetView:UIView?) {
        let heightWidth = targetView!.frame.size.width
        let path = CGMutablePath()
        
        path.move(to: CGPoint(x: 0, y: heightWidth))
        path.addLine(to: CGPoint(x:heightWidth/2, y: heightWidth/2))
        path.addLine(to: CGPoint(x:heightWidth, y:heightWidth))
        path.addLine(to: CGPoint(x:0, y:heightWidth))
        
        let shape = CAShapeLayer()
        shape.path = path
        shape.fillColor = UIColor.white.cgColor
        
        targetView!.layer.insertSublayer(shape, at: 0)
    }
    
    func addShadow(view: UIView, shadowOpacity: Float) {
        view.layer.shadowColor = UIColor(red: 5/255, green: 59/255, blue: 255/255, alpha: 0.4).cgColor
        view.layer.shadowOpacity = shadowOpacity
        view.layer.shadowOffset = CGSize.zero
        view.layer.shadowRadius = 5
    }
    
}

