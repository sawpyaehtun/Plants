//
//  UploadedUserVO.swift
//  PlantMVVM+Rx+Realm
//
//  Created by sawpyaehtun on 14/11/2019.
//  Copyright © 2019 sawpyaehtun. All rights reserved.
//

import Foundation

struct UploadedUserVO : Codable {
    let name : String?
    let userPhoto : String?
    let uploadedTime : String?
    let userRank : String?
}

extension UploadedUserVO {
    func toUploadedUserRO() -> UploadedUserRO {
        return UploadedUserRO(name: self.name, userPhoto: self.userPhoto, uploadedTime: self.uploadedTime, userRank: self.userRank)
    }
}
