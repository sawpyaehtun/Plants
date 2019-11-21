//
//  UIView+Extension.swift
//  PlantMVVM+Rx+Realm
//
//  Created by sawpyaehtun on 15/11/2019.
//  Copyright © 2019 sawpyaehtun. All rights reserved.
//

import UIKit

extension UIView {
        func roundCorners(topLeft: CGFloat = 0, topRight: CGFloat = 0, bottomLeft: CGFloat = 0, bottomRight: CGFloat = 0) {//(topLeft: CGFloat, topRight: CGFloat, bottomLeft: CGFloat, bottomRight: CGFloat) {
            let topLeftRadius = CGSize(width: topLeft, height: topLeft)
            let topRightRadius = CGSize(width: topRight, height: topRight)
            let bottomLeftRadius = CGSize(width: bottomLeft, height: bottomLeft)
            let bottomRightRadius = CGSize(width: bottomRight, height: bottomRight)
            let maskPath = UIBezierPath(shouldRoundRect: bounds, topLeftRadius: topLeftRadius, topRightRadius: topRightRadius, bottomLeftRadius: bottomLeftRadius, bottomRightRadius: bottomRightRadius)
            let shape = CAShapeLayer()
            shape.path = maskPath.cgPath
            layer.mask = shape
        }
}
