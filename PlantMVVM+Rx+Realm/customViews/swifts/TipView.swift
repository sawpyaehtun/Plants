//
//  TipView.swift
//  PlantMVVM+Rx+Realm
//
//  Created by sawpyaehtun on 15/11/2019.
//  Copyright © 2019 sawpyaehtun. All rights reserved.
//

import UIKit

class TipView: UIView {
    
    @IBOutlet weak var imgIcon: RoundedCornerImageView!
    @IBOutlet weak var lblTipLabel: UILabel!
    @IBOutlet weak var lblTipValue: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.commonInitialization()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.commonInitialization()
    }
    
    func commonInitialization() {
        let view = Bundle.main.loadNibNamed(String(describing: TipView.self), owner: self, options: nil)?.first as! UIView
        view.frame = self.bounds
        self.addSubview(view)
    }
}
