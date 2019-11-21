//
//  FavouritePlantCollectionViewCell.swift
//  PlantMVVM+Rx+Realm
//
//  Created by sawpyaehtun on 21/11/2019.
//  Copyright © 2019 sawpyaehtun. All rights reserved.
//

import UIKit
import SDWebImage

class FavouritePlantCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var imgPlantPhoto: RoundedImageView!
    
    var plant : PlantVO? {
        didSet {
            if let plant = plant {
                imgPlantPhoto.sd_setImage(with: URL(string: plant.plantPhoto!))
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

}
