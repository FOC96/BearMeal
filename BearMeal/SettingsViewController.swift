//
//  SettingsViewController.swift
//  BearMeal
//
//  Created by Fernando Ortiz Rico Celio on 9/10/17.
//  Copyright © 2017 Fernando Ortiz Rico Celio. All rights reserved.
//

import UIKit

var mealPlan = Dictionary<String, String>()
var currentPlan = Dictionary<String, String>()

//var mealPlan : [String : Any] = ["Meals_Per_Week" : 0, "Bonus_Meals" : 0, "Dining_Dollars" : 0.0]
//var currentPlan : [String : Any] = ["Meals_Per_Week" : 0, "Bonus_Meals" : 0, "Dining_Dollars" : 0.0]

class SettingsViewController: UIViewController {

    @IBOutlet weak var mealsOriginal: UITextField!
    @IBOutlet weak var bonusOriginal: UITextField!
    @IBOutlet weak var diningOriginal: UITextField!
    
    @IBOutlet weak var mealsLeft: UITextField!
    @IBOutlet weak var bonusLeft: UITextField!
    @IBOutlet weak var diningLeft: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.backItem?.hidesBackButton = false
        tabBarController?.tabBar.isHidden = true
        // Do any additional setup after loading the view.
        getData()
    }

    override func viewWillAppear(_ animated: Bool) {
        tabBarController?.tabBar.isHidden = true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    
    @IBAction func saveAndUpdate(_ sender: Any) {
        saveData()
        let infoAlert = UIAlertController(title: "Successful!", message: "New settings were saved successfully", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { (action) in
            print("Successful")
        }
        infoAlert.addAction(okAction)
        self.present(infoAlert, animated: true, completion: nil)
    }
    
    
    
    func getData() {
        if let originalPlan = UserDefaults.standard.object(forKey: "mealPlan") as? Dictionary<String, String> {
            mealsOriginal.text = originalPlan["Meals_Per_Week"]
            bonusOriginal.text = originalPlan["Bonus_Meals"]
            diningOriginal.text = originalPlan["Dining_Dollars"]
            mealPlan = originalPlan
        }
        // CurrentPlan
        if let myCurrentPlan = UserDefaults.standard.object(forKey: "currentPlan") as? Dictionary<String, String> {
            mealsLeft.text = myCurrentPlan["Meals_Per_Week"]
            bonusLeft.text = myCurrentPlan["Bonus_Meals"]
            diningLeft.text = myCurrentPlan["Dining_Dollars"]
            currentPlan = myCurrentPlan
        }
    }
    
    
    func saveData() {
        // Original Meal Plan
        if mealsOriginal.text != nil && bonusOriginal.text != nil && diningOriginal.text != nil {
            mealPlan["Meals_Per_Week"] = mealsOriginal.text
            mealPlan["Bonus_Meals"] = bonusOriginal.text
            mealPlan["Dining_Dollars"] = diningOriginal.text
            print("\nOriginal:")
            print(mealPlan)
            UserDefaults.standard.set(mealPlan, forKey: "mealPlan")
        }
        
        // Current Plan
        if mealsLeft.text != nil && bonusLeft.text != nil && diningLeft.text != nil {
            currentPlan["Meals_Per_Week"] = mealsLeft.text
            currentPlan["Bonus_Meals"] = bonusLeft.text
            currentPlan["Dining_Dollars"] = diningLeft.text
            print("\nCurrent:")
            print(currentPlan)
            UserDefaults.standard.set(currentPlan, forKey: "currentPlan")
        }
    }
    
    

}
