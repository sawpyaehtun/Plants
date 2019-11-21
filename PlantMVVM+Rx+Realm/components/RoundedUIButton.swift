//
//  RoundedUIButton.swift
//  PlantMVVM+Rx+Realm
//
//  Created by sawpyaehtun on 21/11/2019.
//  Copyright © 2019 sawpyaehtun. All rights reserved.
//

import UIKit

@IBDesignable
class RoundedUIButton: UIButton {
    
    var id : Int?

    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = self.frame.height / 2
    }

}
