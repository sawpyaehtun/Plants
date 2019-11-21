//
//  FavouriteViewController.swift
//  PlantMVVM+Rx+Realm
//
//  Created by sawpyaehtun on 18/11/2019.
//  Copyright © 2019 sawpyaehtun. All rights reserved.
//

import UIKit
import RxCocoa

class FavouriteViewController: BaseViewController {
    @IBOutlet weak var collectionViewPlantFavouriteList: UICollectionView!
    
    let viewModel = FavouriteViewModel()
    
    let numberOfItemsInRow : CGFloat = 2.0
    let spacing : CGFloat = 5
    let leadingSpace : CGFloat = 5
    let TrailingSpace : CGFloat = 5
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupMenuLeftBar()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel.getFavouritePlantList()
    }
    
    override func setUpUIs() {
        super.setUpUIs()
        setupCollectionView()
    }
    
    override func bindData() {
        super.bindData()
        
        viewModel.favouritePlantListObserable.bind(to: collectionViewPlantFavouriteList.rx.items(cellIdentifier: String(describing: FavouritePlantCollectionViewCell.self), cellType: FavouritePlantCollectionViewCell.self)){ row, model, cell in
            
            cell.plant = model
            
        }.disposed(by: disposableBag)
        
        collectionViewPlantFavouriteList.rx.modelSelected(PlantVO.self).subscribe(onNext: { (plant) in
            let vc = PlantDetailViewController.init()
            vc.plant = plant
            vc.delegate = self
            vc.isFavourite = true
            self.navigationController?.pushViewController(vc, animated: true)
        }).disposed(by: disposableBag)
    }
    
    override func bindModel() {
        super.bindModel()
        viewModel.bindViewModel(in: self)
    }
    
    private func setupCollectionView(){
        collectionViewPlantFavouriteList.registerForCell(strID: String(describing: FavouritePlantCollectionViewCell.self))
        
        let layout = collectionViewPlantFavouriteList.collectionViewLayout as! UICollectionViewFlowLayout
        layout.minimumLineSpacing = spacing
        layout.minimumInteritemSpacing = spacing
        
        // calculating total padding
        let totalPadding : CGFloat = ((numberOfItemsInRow - 1) * spacing) + leadingSpace + TrailingSpace
        let itemWidth = (self.view.frame.width - totalPadding) / numberOfItemsInRow
        
        layout.itemSize = CGSize(width: itemWidth, height: itemWidth * 1.45)
    }
    
}

extension FavouriteViewController : PlantDetailDelegate {
    func didTapFavourite(plant: PlantVO, isFavourite: Bool) {
        viewModel.removeFromFavourite(plantID: plant.plantId ?? "")
    }
}
