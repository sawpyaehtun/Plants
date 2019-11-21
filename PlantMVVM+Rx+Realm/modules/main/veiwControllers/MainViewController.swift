//
//  MainViewController.swift
//  PlantMVVM+Rx+Realm
//
//  Created by sawpyaehtun on 18/11/2019.
//  Copyright © 2019 sawpyaehtun. All rights reserved.
//

import UIKit

class MainViewController: BaseViewController {
    @IBOutlet weak var tableViewPlants: UITableView!
    @IBOutlet weak var viewSearch: UIView!
    @IBOutlet weak var imgMainPlantPhoto: RoundedUIImageView!
    
    var favouritePlantList : [PlantVO]!
    
    let viewModel = MainPlantViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupMenuLeftBar()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel.fetchPlants()
    }
    
    override func setUpUIs() {
        super.setUpUIs()
        setupTableView()
    }
    
    override func bindModel() {
        super.bindModel()
        viewModel.bindViewModel(in: self)
    }
    
    private func setupTableView(){
        tableViewPlants.registerForCell(strID: String(describing: PlantTableViewCell.self))
        tableViewPlants.contentInset = UIEdgeInsets(top: 300, left: 0, bottom: 0, right: 0)
        tableViewPlants.separatorStyle = .none
        tableViewPlants.delegate = self
    }
    
    override func bindData() {
        super.bindData()
        
        viewModel.plantListObservable.bind(to: tableViewPlants.rx.items(cellIdentifier: String(describing: PlantTableViewCell.self), cellType: PlantTableViewCell.self)){ row, model, cell in
            cell.plant = model
            
            cell.isFavourite = self.isFavouritePlant(plant: model)
        
        }.disposed(by: disposableBag)
        
        viewModel.favouritePlantListObserable.subscribe(onNext: { (favouriteList) in
            self.favouritePlantList = favouriteList
//            favouriteList.forEach { (plant) in
//                print(plant.plantId)
//            }
            }).disposed(by: disposableBag)
        
        tableViewPlants.rx.modelSelected(PlantVO.self).subscribe(onNext: { (plant) in
            let vc = PlantDetailViewController.init()
            vc.plant = plant
            vc.delegate = self
            
            vc.isFavourite = self.isFavouritePlant(plant: plant)
            
            self.navigationController?.pushViewController(vc, animated: true)
        }).disposed(by: disposableBag)
    }
    
    private func isFavouritePlant(plant : PlantVO) -> Bool {
        if self.favouritePlantList.contains(where: { (plantfav) -> Bool in
            return plant.plantId == plantfav.plantId
        }){
           return true
        } else {
            return false
        }
    }
}

extension MainViewController : UITableViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let contentOffset = scrollView.contentOffset.y
        
        let alphaValue = -(contentOffset/300)
        
        if alphaValue >= 0 && alphaValue <= 1 {
            imgMainPlantPhoto.alpha = alphaValue
            self.viewSearch.frame = CGRect(x: self.viewSearch.frame.origin.x, y: 327 - (300 - (alphaValue * 300)) , width: self.viewSearch.frame.size.width, height: self.viewSearch.frame.size.height)
        }
    }
}

extension MainViewController : PlantDetailDelegate {
    func didTapFavourite(plant: PlantVO, isFavourite: Bool) {
        if isFavourite {
            viewModel.removeFromFavourite(plantId: plant.plantId ?? "")
        } else {
            viewModel.addToFavourite(plant: plant)
        }
    }
}
