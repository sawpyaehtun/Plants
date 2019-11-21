//
//  RoundedCornerImageView.swift
//  PlantMVVM+Rx+Realm
//
//  Created by sawpyaehtun on 15/11/2019.
//  Copyright © 2019 sawpyaehtun. All rights reserved.
//

import UIKit

@IBDesignable
class RoundedCornerImageView: UIImageView {
    
    @IBInspectable var cornerRadius : CGFloat = 2

    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = cornerRadius 
    }
}
