//
//  FavouriteViewModel.swift
//  PlantMVVM+Rx+Realm
//
//  Created by sawpyaehtun on 21/11/2019.
//  Copyright © 2019 sawpyaehtun. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

class FavouriteViewModel: BaseViewModel {
    let favouritePlantListObserable = BehaviorRelay<[PlantVO]>(value: [])
}

extension FavouriteViewModel {
    func getFavouritePlantList() {
        favouritePlantListObserable.accept(MainPlantProvider.shared.getFavouritePlantList())
    }
    
    func removeFromFavourite(plantID : String) {
        MainPlantProvider.shared.removeFromFavourite(plantId: plantID)
    }
}
