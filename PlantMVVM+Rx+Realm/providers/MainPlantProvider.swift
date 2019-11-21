//
//  MainPlantProvider.swift
//  PlantMVVM+Rx+Realm
//
//  Created by sawpyaehtun on 15/11/2019.
//  Copyright © 2019 sawpyaehtun. All rights reserved.
//

import Foundation
import RxSwift

class MainPlantProvider {
    static let shared = MainPlantProvider()
}

extension MainPlantProvider {
    func fetchPlant() -> Observable<[PlantVO]> {
        return NetworkClient.shared.request(url: "https://e770532b-3dc4-42af-a70b-05a4553b7b68.mock.pstmn.io/getAllPlants", method: .post).map { (data) -> [PlantVO] in
            guard let data = data as? Data else { return []}
            return (data.filterByKey(key: "data").decode(modelType: [PlantVO].self))!
        }
    }
    
    func addToFavourite(plantVO : PlantVO) {
        DBManager.sharedInstance.addData(object: plantVO.toPlantRO())
    }
    
    func removeFromFavourite(plantId : String) {
        DBManager.sharedInstance.deleteObjectByID(id: plantId, roName: .PlantRO)
    }
    
    func getFavouritePlantList() -> [PlantVO]{
        guard let plantROs = DBManager.sharedInstance.getDataFromDB(roName: .PlantRO) as? [PlantRO] else {
            return []
        }
        return plantROs.toPlantVOs()
    }
}
