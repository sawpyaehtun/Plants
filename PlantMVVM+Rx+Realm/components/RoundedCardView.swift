//
//  RoundedCardView.swift
//  PlantMVVM+Rx+Realm
//
//  Created by sawpyaehtun on 21/11/2019.
//  Copyright © 2019 sawpyaehtun. All rights reserved.
//

import UIKit

@IBDesignable
class RoundedCardView: UIView {

    @IBInspectable var borderWidth :  CGFloat = 1.0
    @IBInspectable var borderColor :  UIColor? = UIColor.black
    @IBInspectable var isRounded :  Bool = true
    @IBInspectable var cornerRadius :  CGFloat = 10

    override func layoutSubviews() {

        layer.cornerRadius = isRounded ? self.frame.size.height / 2 : cornerRadius
        
        layer.borderWidth = borderWidth
        layer.borderColor = borderColor?.cgColor
        
    }
    
}
