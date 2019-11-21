//
//  PlantTableViewCell.swift
//  PlantMVVM+Rx+Realm
//
//  Created by sawpyaehtun on 15/11/2019.
//  Copyright © 2019 sawpyaehtun. All rights reserved.
//

import UIKit
import SDWebImage

class PlantTableViewCell: BaseTableViewCell {
    
    @IBOutlet weak var btnFavourite: UIButton!
    @IBOutlet weak var lblPlantName: UILabel!
    @IBOutlet weak var imgUpdloadedUser: RoundedImageView!
    @IBOutlet weak var lblUpdloadedUserName: UILabel!
    @IBOutlet weak var imgPlant: UIImageView!
    
    var isFavourite : Bool? {
        didSet {
            if let isFavourite = isFavourite {
                if isFavourite {
                    btnFavourite.setImage(#imageLiteral(resourceName: "heartRed"), for: .normal)
                    btnFavourite.tintColor = .red
                } else {
                    btnFavourite.setImage(UIImage(systemName: "heart"), for: .normal)
                    btnFavourite.tintColor = .white
                    
                }
            }
        }
    }
    
    var plant : PlantVO? {
        didSet {
            lblPlantName.text = plant?.plantName
            lblUpdloadedUserName.text = "by \(plant?.uploadedUser?.name ?? "")"
            imgPlant.sd_setImage(with: URL(string: (plant?.plantPhoto)!))
            imgUpdloadedUser.sd_setImage(with: URL(string: (plant?.uploadedUser?.userPhoto)!))
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    override func setupUIs() {
        super.setupUIs()
        lblPlantName.adjustsFontSizeToFitWidth = true
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
}
