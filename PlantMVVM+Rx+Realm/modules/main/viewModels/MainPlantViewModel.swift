//
//  MainPlantViewModel.swift
//  PlantMVVM+Rx+Realm
//
//  Created by sawpyaehtun on 15/11/2019.
//  Copyright © 2019 sawpyaehtun. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

class MainPlantViewModel: BaseViewModel {
    let plantListObservable = BehaviorRelay<[PlantVO]>(value: [])
    let favouritePlantListObserable = BehaviorRelay<[PlantVO]>(value: [])
}

extension MainPlantViewModel {
     func fetchPlants(){
        loadingObservable.accept(true)
        getFavouritePlants()
        MainPlantProvider.shared.fetchPlant().subscribe(onNext: { (plantList) in
            self.loadingObservable.accept(false)
            self.plantListObservable.accept(plantList)
        }, onError: { (error) in
            self.errorObservable.accept(error.localizedDescription)
        }).disposed(by: disposableBag)
    }
    
    func addToFavourite(plant : PlantVO) {
        MainPlantProvider.shared.addToFavourite(plantVO: plant)
    }
    
    func removeFromFavourite(plantId : String) {
        MainPlantProvider.shared.removeFromFavourite(plantId: plantId)
    }
    
    func getFavouritePlants(){
        favouritePlantListObserable.accept( MainPlantProvider.shared.getFavouritePlantList())
    }
}
