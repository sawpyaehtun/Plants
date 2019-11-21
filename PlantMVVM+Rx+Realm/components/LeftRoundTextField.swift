//
//  LeftRoundTextField.swift
//  PlantMVVM+Rx+Realm
//
//  Created by sawpyaehtun on 20/11/2019.
//  Copyright © 2019 sawpyaehtun. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable
class LeftRoundTextField: UITextField {
    
    @IBInspectable var shadowOffsetWidth : Int = 0
    @IBInspectable var shadowOffsetHeight : Int = 0
    @IBInspectable var showColor : UIColor? = UIColor.black
    @IBInspectable var shadowOpacity : Float = 0.5
    @IBInspectable var borderWidth :  CGFloat = 0.0
    @IBInspectable var borderColor :  UIColor? = UIColor.black
    
    override func layoutSubviews() {
        clipsToBounds = true
        layer.cornerRadius = self.frame.height / 2
        
        layer.maskedCorners = [.layerMinXMinYCorner,.layerMinXMaxYCorner]
        
        let shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: self.frame.height / 2)
        
        layer.masksToBounds = false
        layer.shadowColor = showColor?.cgColor
        layer.shadowOffset = CGSize(width: shadowOffsetWidth, height: shadowOffsetHeight)
        layer.shadowOpacity = shadowOpacity
        layer.shadowPath = shadowPath.cgPath
    }
}
