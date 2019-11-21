//
//  PlantRO.swift
//  PlantMVVM+Rx+Realm
//
//  Created by sawpyaehtun on 19/11/2019.
//  Copyright © 2019 sawpyaehtun. All rights reserved.
//

import Foundation
import RealmSwift

@objcMembers class PlantRO : Object{
    dynamic var plantId : String?
    dynamic var plantName : String?
    var plantType = List<String>()
    dynamic var descrip : String?
    dynamic var topTip : String?
    dynamic var tips : TipsRO?
    dynamic var uploadedUser : UploadedUserRO?
    dynamic var plantPhoto : String?
    
    convenience init(plantId : String?,
                     plantName : String?,
                     plantType : List<String>,
                     description : String?,
                     topTip : String?,
                     tips : TipsRO?,
                     uploadedUser : UploadedUserRO?,
                     plantPhoto : String?){
        self.init()
        self.plantId = plantId
        self.plantName = plantName
        self.plantType = plantType
        self.descrip = description
        self.topTip = topTip
        self.tips = tips
        self.uploadedUser = uploadedUser
        self.plantPhoto = plantPhoto
    }
    
    override class func primaryKey() -> String? {
           return "plantId"
       }
}

extension PlantRO {
    func toPlantVO() -> PlantVO {
        let plantTypeStringArray = Array(self.plantType)
        
        return PlantVO(plantId: self.plantId,
                       plantName: self.plantName,
                       plantType: plantTypeStringArray,
                       description: self.descrip,
                       topTip: self.topTip,
                       tips: self.tips?.toTipsVO(),
                       uploadedUser: self.uploadedUser?.toUploadedUserVO(), plantPhoto: self.plantPhoto)
    }
}
