//
//  TipsRO.swift
//  PlantMVVM+Rx+Realm
//
//  Created by sawpyaehtun on 19/11/2019.
//  Copyright © 2019 sawpyaehtun. All rights reserved.
//

import Foundation
import RealmSwift

@objcMembers class TipsRO : Object {
    dynamic var temperature : String?
    dynamic var light : String?
    dynamic var placement : String?
    
    convenience init(temperature : String?, light : String?, placement : String?){
        self.init()
        self.temperature = temperature
        self.light = light
        self.placement = placement
    }
}

extension TipsRO {
    func toTipsVO() -> TipsVO {
        return TipsVO(temperature: self.temperature, light: self.light, placement: self.placement)
    }
}
