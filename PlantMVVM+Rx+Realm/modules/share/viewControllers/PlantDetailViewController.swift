//
//  PlantDetailViewController.swift
//  PlantMVVM+Rx+Realm
//
//  Created by sawpyaehtun on 15/11/2019.
//  Copyright © 2019 sawpyaehtun. All rights reserved.
//

import UIKit
import SDWebImage

protocol PlantDetailDelegate {
    func didTapFavourite(plant : PlantVO, isFavourite : Bool)
}

class PlantDetailViewController: BaseViewController {
    @IBOutlet weak var imgPlant: UIImageView!
    @IBOutlet weak var imgUploadedPerson: RoundedImageView!
    @IBOutlet weak var lblUploadedPeronName: UILabel!
    @IBOutlet weak var lblPlantName: UILabel!
    @IBOutlet weak var lblDescription: UILabel!
    @IBOutlet weak var btnFavourite: UIButton!
    @IBOutlet weak var scrollViewTips: UIScrollView!
    
    var plant : PlantVO?
    var isFavourite : Bool = false
    var delegate : PlantDetailDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func didTapBtnFavourite(_ sender: Any) {
        self.delegate.didTapFavourite(plant: plant!, isFavourite: isFavourite)
        if isFavourite {
            btnFavourite.setImage(UIImage(systemName: "heart"), for: .normal)
            btnFavourite.tintColor = .white
        } else {
            
            btnFavourite.setImage(#imageLiteral(resourceName: "heartRed"), for: .normal)
            btnFavourite.tintColor = .red
        }
        
        isFavourite = !isFavourite
    }
    
    override func setUpUIs() {
        super.setUpUIs()
        btnFavourite.layer.cornerRadius = 10
        self.navigationController?.navigationBar.tintColor = .lightGray
        setupNavigaitonRightBarButton()
        if isFavourite {
            btnFavourite.setImage(#imageLiteral(resourceName: "heartRed"), for: .normal)
            btnFavourite.tintColor = .red
        } else {
            btnFavourite.setImage(UIImage(systemName: "heart"), for: .normal)
            btnFavourite.tintColor = .white
        }
        
        if let plant = plant {
            imgPlant.sd_setImage(with: URL(string: plant.plantPhoto!))
            imgUploadedPerson.sd_setImage(with: URL(string: (plant.uploadedUser?.userPhoto)!))
            lblUploadedPeronName.text = plant.uploadedUser?.name
            lblPlantName.text = plant.plantName
            lblDescription.text = plant.description
            setupScrollview()
        }
    }
    
    private func setupNavigaitonRightBarButton(){
        let sendBarButton = UIBarButtonItem(image:  UIImage(systemName: "trash"), style: .plain, target: self, action: nil)
        
        sendBarButton.tintColor = .lightGray
//        navigationItem.rightBarButtonItems = [sendBarButton]
        self.navigationController?.navigationItem.rightBarButtonItems = [sendBarButton]
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    private func setupScrollview(){
        
        let itemWidth = UIScreen.main.bounds.width / 3
        let itemHeight = itemWidth * 1.45
        //        scrollViewTips.contentSize.height = itemHeight + 10
        scrollViewTips.heightAnchor.constraint(equalToConstant: itemHeight).isActive = true
        scrollViewTips.contentSize.width = (itemWidth * 3) + 20
        
        let temperatureTipView = TipView(frame: CGRect(x: 0, y: 0, width: itemWidth, height: itemHeight))
        temperatureTipView.lblTipLabel.text = "Temperature"
        temperatureTipView.imgIcon.image = UIImage(systemName: "thermometer")
        temperatureTipView.lblTipValue.text = plant?.tips?.temperature
        let lightTipView = TipView(frame: CGRect(x: itemWidth + 10, y: 0, width: itemWidth, height: itemHeight))
        lightTipView.lblTipLabel.text = "Light"
        lightTipView.lblTipValue.text = plant?.tips?.light
        lightTipView.imgIcon.image = UIImage(systemName: "sun.max")
        let placementView = TipView(frame: CGRect(x: (itemWidth * 2) + 20, y: 0, width: itemWidth, height: itemHeight))
        placementView.lblTipLabel.text = "Placement"
        placementView.lblTipValue.text = plant?.tips?.placement
        placementView.imgIcon.image = UIImage(systemName: "dot.square")
        
        scrollViewTips.addSubview(temperatureTipView)
        scrollViewTips.addSubview(lightTipView)
        scrollViewTips.addSubview(placementView)
    }
    
    
}

