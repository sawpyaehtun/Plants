//
//  LoginViewController.swift
//  PlantMVVM+Rx+Realm
//
//  Created by sawpyaehtun on 18/11/2019.
//  Copyright © 2019 sawpyaehtun. All rights reserved.
//

import UIKit
import LGSideMenuController

class LoginViewController: BaseViewController {
    @IBOutlet weak var viewEmail: LeftRoundedCardView!
    
    @IBOutlet weak var btnLogin: RightRoundedButton!
    @IBOutlet weak var viewPassword: LeftRoundedCardView!
    @IBOutlet weak var lblEmail: UILabel!
    @IBOutlet weak var lblPassword: UILabel!
    @IBOutlet weak var btnForgotPassword: UIButton!
    
    @IBOutlet weak var tfPassword: UITextField!
    @IBOutlet weak var tfEmail: UITextField!
    let viewModel = LoginViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func setUpAnimation() {
        super.setUpAnimation()
        viewEmail.center.x += 350
        viewPassword.center.x += 350
        btnLogin.center.x -= 350
        
        lblEmail.alpha = 0.0
        lblPassword.alpha = 0.0
        btnForgotPassword.alpha = 0.0
        
       
        UIView.animate(withDuration: 1.0) {
            self.viewEmail.center.x -= 350
        }
        
        UIView.animate(withDuration: 1.2) {
            self.viewPassword.center.x -= 350
        }
        
        UIView.animate(withDuration: 1.4, animations: {
             self.btnLogin.center.x += 350
        }) { (_) in
            UIView.animate(withDuration: 1) {
                self.lblPassword.alpha = 1
                self.lblEmail.alpha = 1
                self.btnForgotPassword.alpha = 1
            }
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let isLoggingIn = CommonManger.shared.retrieveBoolFromNSUserDefault(key: CommonManger.IS_USER_LOGIN)
        if isLoggingIn {
            showMain()
        }
    }

    @IBAction func didTapLogin(_ sender: Any) {
        viewModel.login()
    }
    
    override func bindData() {
        super.bindData()
        tfEmail.rx.text.orEmpty.bind(to: viewModel.email).disposed(by: disposableBag)
        tfPassword.rx.text.orEmpty.bind(to: viewModel.password).disposed(by: disposableBag)
        
        viewModel.isSuccessLogin.subscribe(onNext: { (isSuccessLogin) in
            self.showMain()
            }).disposed(by: disposableBag)
    }
    
    override func setUpUIs() {
        super.setUpUIs()
        btnLogin.titleLabel?.textColor = .white
    }
    
    private func showMain(){
        let window = UIApplication.shared.windows.filter {$0.isKeyWindow}.first
                let rootviewcontroller = MainViewController(nibName: String(describing: MainViewController.self), bundle: nil)
                print("rootviewcontroller: \(rootviewcontroller)")
                let navigation = UINavigationController.init(rootViewController: rootviewcontroller)
                
                let sideMenuVC = MenuViewController(nibName: String(describing: MenuViewController.self), bundle: nil)
                let sideMenuController = LGSideMenuController(rootViewController: navigation,
                                                              leftViewController: sideMenuVC,
                                                              rightViewController: nil)
                sideMenuController.leftViewWidth = 280.0
                sideMenuController.leftViewPresentationStyle = .slideBelow
                
                window?.rootViewController = sideMenuController
                window?.makeKeyAndVisible()

    }
}
