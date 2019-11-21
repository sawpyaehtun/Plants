//
//  UploadedUserRO.swift
//  PlantMVVM+Rx+Realm
//
//  Created by sawpyaehtun on 19/11/2019.
//  Copyright © 2019 sawpyaehtun. All rights reserved.
//

import Foundation
import RealmSwift

@objcMembers class UploadedUserRO : Object {
    dynamic var name : String?
    dynamic var userPhoto : String?
    dynamic var uploadedTime : String?
    dynamic var userRank : String?
    
    convenience init(name : String?, userPhoto : String?, uploadedTime : String?, userRank : String?){
        self.init()
        self.name = name
        self.userPhoto = userPhoto
        self.uploadedTime = uploadedTime
        self.userRank = userRank
    }
}

extension UploadedUserRO {
    func toUploadedUserVO() -> UploadedUserVO {
        return UploadedUserVO(name: self.name, userPhoto: self.userPhoto, uploadedTime: self.uploadedTime, userRank: self.userRank)
    }
}
