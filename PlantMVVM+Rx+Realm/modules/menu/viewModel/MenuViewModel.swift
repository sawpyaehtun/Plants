//
//  MenuViewModel.swift
//  PlantMVVM+Rx+Realm
//
//  Created by sawpyaehtun on 18/11/2019.
//  Copyright © 2019 sawpyaehtun. All rights reserved.
//

import Foundation
import UIKit

enum MenuItem : Int {
    case main
    case favourite
    
    func text() -> String {
        switch self {
            
        case .main :
            return "Main"
        case .favourite:
            return "favourite"
        }
        
    }
    
    func icon() -> UIImage {
        switch self {
        case .main :
            return UIImage(systemName: "house")!
        case .favourite:
            return UIImage(systemName: "suit.heart")!
        }
    }
}

class MenuViewModel {
    var menuItems : [MenuItem] = [.main, .favourite]
       var defaultSelectedIndex = 0
}
