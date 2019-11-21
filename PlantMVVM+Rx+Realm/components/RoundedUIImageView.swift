//
//  RoundedUIImageView.swift
//  PlantMVVM+Rx+Realm
//
//  Created by sawpyaehtun on 21/11/2019.
//  Copyright © 2019 sawpyaehtun. All rights reserved.
//

import UIKit

@IBDesignable
class RoundedUIImageView: UIImageView {
    
    @IBInspectable var cornerRadius : CGFloat = 10

    override func layoutSubviews() {
        layer.cornerRadius = cornerRadius
    }
   
}
