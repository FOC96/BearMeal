//
//  Menus.swift
//  BearMeal
//
//  Created by Fernando Ortiz Rico Celio on 9/8/17.
//  Copyright © 2017 Fernando Ortiz Rico Celio. All rights reserved.
//

import UIKit

@IBDesignable
class Menus: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate  {
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return diningHallsArray.count
    }
    
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return diningHallsArray[row]
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    @IBOutlet weak var dHPicker: UIPickerView!
    let diningHallsArray = ["Holmes", "Tobey-Kendel", "University Center"]
    
    @IBOutlet weak var breakfastView: UIView!
    @IBOutlet weak var lunchView: UIView!
    @IBOutlet weak var dinnerView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dHPicker.delegate = self
        dHPicker.dataSource = self
        
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
        self.navigationItem.largeTitleDisplayMode = .automatic
        
        breakfastView.layer.shadowOpacity = 0.12
        breakfastView.layer.shadowRadius = 8
        breakfastView.layer.shadowOffset = CGSize.zero
        breakfastView.layer.cornerRadius = 12
        breakfastView.layer.shadowColor = UIColor.black.cgColor
        
        lunchView.layer.shadowOpacity = 0.12
        lunchView.layer.shadowRadius = 8
        lunchView.layer.shadowOffset = CGSize.zero
        lunchView.layer.cornerRadius = 12
        lunchView.layer.shadowColor = UIColor.black.cgColor
        
        dinnerView.layer.shadowOpacity = 0.12
        dinnerView.layer.shadowRadius = 8
        dinnerView.layer.shadowOffset = CGSize.zero
        dinnerView.layer.cornerRadius = 12
        dinnerView.layer.shadowColor = UIColor.black.cgColor
        
        
    }
    
    @objc func animation() {

    }
    
    @objc func cardTapped(UITGR : UITapGestureRecognizer) {
        UIView.animate(withDuration: 0.4, delay: 0, options: .curveEaseInOut, animations: {
//            self.breakfastView.transform = CGAffineTransform(scaleX: 0.99, y: 0.99)
        }) { (success) in
//            self.breakfastView.transform = CGAffineTransform.identity
        }
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
