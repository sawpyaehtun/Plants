//
//  TipsVO.swift
//  PlantMVVM+Rx+Realm
//
//  Created by sawpyaehtun on 14/11/2019.
//  Copyright © 2019 sawpyaehtun. All rights reserved.
//

import Foundation

struct TipsVO : Codable{
    let temperature : String?
    let light : String?
    let placement : String?
}

extension TipsVO {
    func toTipsRO() -> TipsRO {
        return TipsRO(temperature: self.temperature, light: self.light, placement: self.placement)
    }
}
