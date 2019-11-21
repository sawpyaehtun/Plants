//
//  LoginViewModel.swift
//  PlantMVVM+Rx+Realm
//
//  Created by sawpyaehtun on 21/11/2019.
//  Copyright © 2019 sawpyaehtun. All rights reserved.
//

import Foundation
import RxCocoa
class LoginViewModel: BaseViewModel {
    let email = BehaviorRelay<String>(value: "")
    let password = BehaviorRelay<String>(value: "")
    let isSuccessLogin = BehaviorRelay<Bool>(value: false)
}

extension LoginViewModel {
    func login() {
        loadingObservable.accept(true)
        LoginProvider.shared.Login(emailID: email.value, password: password.value).subscribe(onNext: { (user) in
            self.loadingObservable.accept(false)
            if let user = user {
                self.isSuccessLogin.accept(true)
                CommonManger.shared.saveBoolToNSUserDefault(value: true, key: CommonManger.IS_USER_LOGIN)
            }
        }, onError: { (error) in
            self.errorObservable.accept(error.localizedDescription)
        }).disposed(by: disposableBag)
    }
}
