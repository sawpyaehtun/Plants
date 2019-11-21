//
//  CategoryView.swift
//  PlantMVVM+Rx+Realm
//
//  Created by sawpyaehtun on 21/11/2019.
//  Copyright © 2019 sawpyaehtun. All rights reserved.
//

import UIKit

class CategoryView: UIView {
    @IBOutlet weak var btnRecent: RoundedUIButton!
    @IBOutlet weak var btnAlbum: RoundedUIButton!
    @IBOutlet weak var btnColor: RoundedUIButton!
    @IBOutlet weak var btnOld: RoundedUIButton!
    
    var btnArray : [RoundedUIButton] = []
    
    override init(frame: CGRect) {
      super.init(frame: frame)
      self.commonInitialization()
  }
  
  required init?(coder aDecoder: NSCoder) {
      super.init(coder: aDecoder)
      self.commonInitialization()
  }
  
  func commonInitialization() {
      let view = Bundle.main.loadNibNamed(String(describing: CategoryView.self), owner: self, options: nil)?.first as! UIView
      view.frame = self.bounds
    btnRecent.backgroundColor = #colorLiteral(red: 0.05882352963, green: 0.180392161, blue: 0.2470588237, alpha: 1)
        btnArray = [btnRecent,btnOld,btnColor,btnAlbum]
    var id = 0
    
    btnArray.forEach { (btn) in
        btn.id = id
        id += 1
    }
      self.addSubview(view)
  }
    
    @IBAction func didTapBtn(_ sender: Any) {
        guard let selectedbtn = sender as? RoundedUIButton else {return}
        
        btnArray.forEach { (btn) in
            if btn.id == selectedbtn.id {
                btn.backgroundColor = #colorLiteral(red: 0.05882352963, green: 0.180392161, blue: 0.2470588237, alpha: 1)
            } else {
                btn.backgroundColor = .white
            }
        }
        
    }
    

}
