//
//  MenuTableViewCell.swift
//  PlantMVVM+Rx+Realm
//
//  Created by sawpyaehtun on 15/11/2019.
//  Copyright © 2019 sawpyaehtun. All rights reserved.
//

import UIKit

class MenuTableViewCell: BaseTableViewCell {

    @IBOutlet weak var imgMenuIcon: UIImageView!
    @IBOutlet weak var lblMenu: UILabel!
    
    var selectedIndex : Bool?{
        didSet {
            if selectedIndex! {
                imgMenuIcon.tintColor = .darkGray
                lblMenu.textColor = .darkGray
            }
        }
    }
    
    var menuItem : MenuItem?{
        didSet {
            imgMenuIcon.image = menuItem?.icon()
            lblMenu.text = menuItem?.text()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}
