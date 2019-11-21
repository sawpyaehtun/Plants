//
//  MenuViewController.swift
//  PlantMVVM+Rx+Realm
//
//  Created by sawpyaehtun on 15/11/2019.
//  Copyright © 2019 sawpyaehtun. All rights reserved.
//

import UIKit
import RxCocoa
import LGSideMenuController

class MenuViewController: BaseViewController {
    
    @IBOutlet weak var tableMenu: UITableView!
    
    var viewModel = MenuViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func setUpUIs() {
        super.setUpUIs()
        setupTableView()
    }
    
    private func setupTableView(){
        tableMenu.registerForCell(strID: String(describing: MenuTableViewCell.self))
        tableMenu.dataSource = self
        tableMenu.separatorStyle = .none
        
    }
    
    override func bindData() {
        super.bindData()
        tableMenu.rx.itemSelected.subscribe(onNext: { (indexPath) in
            switch indexPath.row {
            case MenuItem.main.rawValue :
                self.showMain()
            case MenuItem.favourite.rawValue :
                self.showFavourite()
            default :
                break
            }
        }).disposed(by: disposableBag)
    }
}

extension MenuViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.menuItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: MenuTableViewCell.self), for: indexPath) as! MenuTableViewCell
        
        cell.selectedIndex = (viewModel.defaultSelectedIndex == indexPath.row) ? true : false
        
        if viewModel.menuItems.count > indexPath.row {
            let menuItem = viewModel.menuItems[indexPath.row]
            cell.menuItem = menuItem
        }
        
        return cell
    }
    
    
}

extension MenuViewController {
    
    func showMain() {
         let rootviewcontroller = MainViewController(nibName: String(describing: MainViewController.self), bundle: nil)
        viewModel.defaultSelectedIndex = MenuItem.main.rawValue
        showVCWithSideMenu(rootViewController: rootviewcontroller)
    }
    
    func showFavourite() {
        let rootviewcontroller = FavouriteViewController(nibName: String(describing: FavouriteViewController.self), bundle: nil)
        viewModel.defaultSelectedIndex = MenuItem.favourite.rawValue
        showVCWithSideMenu(rootViewController: rootviewcontroller)
    }
    
    func showVCWithSideMenu(rootViewController : UIViewController) {
        
        self.hideLeftViewAnimated(self)
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) { [unowned self] in
            
            let window = UIApplication.shared.windows.filter {$0.isKeyWindow}.first
            let rootviewcontroller = rootViewController
            print("rootviewcontroller: \(rootviewcontroller)")
            let navigation = UINavigationController.init(rootViewController: rootviewcontroller)
            
            let sideMenuVC = MenuViewController(nibName: String(describing: MenuViewController.self), bundle: nil)
            sideMenuVC.viewModel = self.viewModel
            let sideMenuController = LGSideMenuController(rootViewController: navigation,
                                                          leftViewController: sideMenuVC,
                                                          rightViewController: nil)
            sideMenuController.leftViewWidth = 280.0
            sideMenuController.leftViewPresentationStyle = .slideBelow
            
            window?.rootViewController = sideMenuController
            window?.makeKeyAndVisible()
        }
        
    }
}
