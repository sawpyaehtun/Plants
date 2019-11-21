//
//  LoginProvider.swift
//  PlantMVVM+Rx+Realm
//
//  Created by sawpyaehtun on 21/11/2019.
//  Copyright © 2019 sawpyaehtun. All rights reserved.
//

import Foundation
import RxSwift

class LoginProvider {
    static let shared = LoginProvider()
}

extension LoginProvider {
    func Login(emailID : String, password : String) -> Observable<UserVO?> {
        let parameters = [
            "email" : emailID,
            "password" : password
        ]
        return NetworkClient.shared.request(url: "https://e770532b-3dc4-42af-a70b-05a4553b7b68.mock.pstmn.io/login", method: .post, parameters: parameters).map { (data) -> UserVO? in
            guard let data = data as? Data else {return nil}
            return data.filterByKey(key: "data").decode(modelType: UserVO.self)
        }
    }
}
