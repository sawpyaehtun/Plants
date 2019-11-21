//
//  PlantVO.swift
//  PlantMVVM+Rx+Realm
//
//  Created by sawpyaehtun on 14/11/2019.
//  Copyright © 2019 sawpyaehtun. All rights reserved.
//

import Foundation
import RealmSwift

struct PlantVO : Codable {
    let plantId : String?
    let plantName : String?
    let plantType : [String]?
    let description : String?
    let topTip : String?
    let tips : TipsVO?
    let uploadedUser : UploadedUserVO?
    let plantPhoto : String?
}

extension PlantVO {
    func toPlantRO() -> PlantRO {
        let plantTypeList = List<String>()
        plantType?.forEach({ (type) in
            plantTypeList.append(type)
        })
        return PlantRO(plantId: self.plantId, plantName: self.plantName, plantType: plantTypeList, description: self.description, topTip: self.topTip, tips: self.tips?.toTipsRO(), uploadedUser: self.uploadedUser?.toUploadedUserRO(), plantPhoto: self.plantPhoto)
    }
}
