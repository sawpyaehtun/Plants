//
//  Array+Extension.swift
//  PlantMVVM+Rx+Realm
//
//  Created by sawpyaehtun on 19/11/2019.
//  Copyright © 2019 sawpyaehtun. All rights reserved.
//

import Foundation

extension Array {
    func toPlantVOs() -> [PlantVO] {
        guard let plantROs = self as? [PlantRO] else { return []}
        return plantROs.map { (plantRO) -> PlantVO in
            return plantRO.toPlantVO()
        }
    }
    
    func toPlantROs() -> [PlantRO] {
        guard let plantVOs = self as? [PlantVO] else {
            return []
        }
        return plantVOs.map { (plantVO) -> PlantRO in
            return plantVO.toPlantRO()
        }
    }
}
