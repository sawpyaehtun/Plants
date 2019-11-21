//
//  CardView.swift
//  TableViewWithTabBar
//
//  Created by saw pyaehtun on 24/08/2019.
//  Copyright © 2019 saw pyaehtun. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable // to show in storyBoard
class CardView: UIView {
    
    @IBInspectable var topLeftCornerRadius : CGFloat = 2
    @IBInspectable var topRightCornerRadius : CGFloat = 2
    @IBInspectable var bottomLeftCornerRadius : CGFloat = 2
    @IBInspectable var bottomRightCornerRadius : CGFloat = 2
    @IBInspectable var shadowCornerRadius : CGFloat = 2
    @IBInspectable var shadowOffsetWidth : Int = 0
    @IBInspectable var shadowOffsetHeight : Int = 0
    @IBInspectable var showColor : UIColor? = UIColor.black
    @IBInspectable var shadowOpacity : Float = 0.5
    @IBInspectable var borderWidth :  CGFloat = 0.0
    @IBInspectable var borderColor :  UIColor? = UIColor.black
    
    
    override func layoutSubviews() {

        roundCorners(topLeft: topLeftCornerRadius, topRight: topRightCornerRadius, bottomLeft: bottomLeftCornerRadius, bottomRight: bottomRightCornerRadius)
        
        layer.borderWidth = borderWidth
        layer.borderColor = borderColor?.cgColor
        
        let shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: shadowCornerRadius)
        
        layer.masksToBounds = false
        layer.shadowColor = showColor?.cgColor
        layer.shadowOffset = CGSize(width: shadowOffsetWidth, height: shadowOffsetHeight)
        layer.shadowOpacity = shadowOpacity
        layer.shadowPath = shadowPath.cgPath
    }
}
