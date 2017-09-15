//
//  Menus.swift
//  BearMeal
//
//  Created by Fernando Ortiz Rico Celio on 9/8/17.
//  Copyright © 2017 Fernando Ortiz Rico Celio. All rights reserved.
//

import UIKit

@IBDesignable
class Menus: UIViewController  {
    
    let diningHallsArray = ["Holmes", "Tobey-Kendel", "University Center"]
    // Cards (Views)
    @IBOutlet weak var firstCard: UIView!
    @IBOutlet weak var secondCard: UIView!
    @IBOutlet weak var thirdCard: UIView!
    // Contents
    @IBOutlet weak var firstContent: UILabel!
    @IBOutlet weak var secondContent: UILabel!
    @IBOutlet weak var thirdContent: UILabel!
    // Titles
    @IBOutlet weak var firstTitle: UILabel!
    @IBOutlet weak var secondTitle: UILabel!
    @IBOutlet weak var thirdTitle: UILabel!
    // Hours of Operation
    @IBOutlet weak var firstHours: UILabel!
    @IBOutlet weak var secondHours: UILabel!
    @IBOutlet weak var thirdHours: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        design()
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func design() {
        self.navigationController?.navigationBar.layer.shadowColor = UIColor.black.cgColor
        self.navigationController?.navigationBar.layer.shadowOffset = CGSize(width: 0.0, height: 3.0)
        self.navigationController?.navigationBar.layer.shadowRadius = 6
        self.navigationController?.navigationBar.layer.shadowOpacity = 0.15
        self.navigationController?.navigationBar.layer.masksToBounds = false
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
        firstCard.layer.shadowOpacity = 0.12
        firstCard.layer.shadowRadius = 8
        firstCard.layer.shadowOffset = CGSize.zero
        firstCard.layer.cornerRadius = 12
        firstCard.layer.shadowColor = UIColor.black.cgColor
        
        secondCard.layer.shadowOpacity = 0.12
        secondCard.layer.shadowRadius = 8
        secondCard.layer.shadowOffset = CGSize.zero
        secondCard.layer.cornerRadius = 12
        secondCard.layer.shadowColor = UIColor.black.cgColor
        
        thirdCard.layer.shadowOpacity = 0.12
        thirdCard.layer.shadowRadius = 8
        thirdCard.layer.shadowOffset = CGSize.zero
        thirdCard.layer.cornerRadius = 12
        thirdCard.layer.shadowColor = UIColor.black.cgColor
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
