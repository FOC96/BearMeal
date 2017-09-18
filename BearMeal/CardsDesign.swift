//
//  CardsDesign.swift
//  BearMeal
//
//  Created by Fernando Ortiz Rico Celio on 9/17/17.
//  Copyright © 2017 Fernando Ortiz Rico Celio. All rights reserved.
//

import UIKit

@IBDesignable
class CardsDesign: UIView {

    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.layer.shadowOpacity = 0.08
        self.layer.shadowRadius = 6
        self.layer.shadowOffset = CGSize(width: 0.0, height: 12.0)
        self.layer.cornerRadius = 12
        self.layer.shadowColor = UIColor.black.cgColor
        
    }
    

}
