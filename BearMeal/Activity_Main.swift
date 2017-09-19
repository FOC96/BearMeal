//
//  Activity_Main.swift
//  BearMeal
//
//  Created by Fernando Ortiz Rico Celio on 9/11/17.
//  Copyright © 2017 Fernando Ortiz Rico Celio. All rights reserved.
//

import UIKit

var mealsUsed : Int = 0
var bonusUsed : Int = 0
var dollarUsed : Double = 0.0

class Activity_Main: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
//  VISUAL ELEMENTS
    @IBOutlet weak var bearCard: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var bearNumberLabel: UILabel!
    @IBOutlet weak var userPicture: UIImageView!
    //Buttons
    @IBOutlet weak var mealsButton: CardsDesign!
    @IBOutlet weak var bonusMealsButton: CardsDesign!
    @IBOutlet weak var diningDollarsButton: CardsDesign!
    // Cards
    @IBOutlet weak var MealsView: CardsDesign!
    @IBOutlet weak var BonusView: CardsDesign!
    @IBOutlet weak var diningView: CardsDesign!
    // Totals
    @IBOutlet weak var mealsTotal: UILabel!
    @IBOutlet weak var bonusTotal: UILabel!
    @IBOutlet weak var diningTotal: UILabel!
    
    
    
    func design() {
        // NavBar
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationItem.largeTitleDisplayMode = .automatic
        self.navigationController?.navigationBar.layer.shadowColor = UIColor.black.cgColor
        self.navigationController?.navigationBar.layer.shadowOffset = CGSize(width: 0.0, height: 3.0)
        self.navigationController?.navigationBar.layer.shadowRadius = 6
        self.navigationController?.navigationBar.layer.shadowOpacity = 0.15
        self.navigationController?.navigationBar.layer.masksToBounds = false
        self.navigationController?.navigationBar.shadowImage = UIImage()
        
        // Card design (shadow)
        bearCard.layer.shadowOpacity = 0.08
        bearCard.layer.shadowRadius = 6
        bearCard.layer.shadowOffset = CGSize(width: 0.0, height: 12.0)
        bearCard.layer.cornerRadius = 12
        bearCard.layer.shadowColor = UIColor.black.cgColor
        
        // Card info
        showCardInfo()
        
        let buttonTapped = UITapGestureRecognizer(target: self, action: #selector(Activity_Main.showAdd(tapGestureRecognizer: )))
        buttonTapped.numberOfTapsRequired = 1
        mealsButton.addGestureRecognizer(buttonTapped)
        bonusMealsButton.addGestureRecognizer(buttonTapped)
//        diningDollarsButton.addGestureRecognizer(buttonTapped)
    }
    
    @objc func showAdd(tapGestureRecognizer : UITapGestureRecognizer) {
        print("TAPPED!")
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        let addNewView = storyboard.instantiateViewController(withIdentifier: "RegisterNew")
//        self.present(addNewView, animated: true, completion: nil)
    }
    
    func animations() {
        let tapCard = UITapGestureRecognizer(target: self, action: #selector(Activity_Main.tapOnCard(tapGestureRecognizer:)))
        bearCard.addGestureRecognizer(tapCard)
        
        let longPressedOnCard = UILongPressGestureRecognizer(target: self, action: #selector(Activity_Main.pressedCard(LongPressedGesture:)))
        longPressedOnCard.minimumPressDuration = 1
        bearCard.addGestureRecognizer(longPressedOnCard)
        
    }
    
    
//  TOOLS
    var imagePicker = UIImagePickerController()
    
    
    
    func showCardInfo() {
        if let name = UserDefaults.standard.object(forKey: "name") {
            nameLabel.text = (name as! String)
        } else {
            nameLabel.text = "Long-press this card"
        }
        
        if let bearNumber = UserDefaults.standard.object(forKey: "bearNumber") {
            bearNumberLabel.text = (bearNumber as! String)
        } else {
            bearNumberLabel.text = "to add your info"
        }
    }
    
    @objc func tapOnCard(tapGestureRecognizer : UITapGestureRecognizer) {
        UIView.animate(withDuration: 0.4, delay: 0, options: .curveEaseInOut, animations: {
            self.bearCard.transform = CGAffineTransform(scaleX: 0.99, y: 0.99)
            self.nameLabel.transform = CGAffineTransform(scaleX: 0.99, y: 0.99)
            self.bearNumberLabel.transform = CGAffineTransform(scaleX: 0.99, y: 0.99)
            self.userPicture.transform = CGAffineTransform(scaleX: 0.99, y: 0.99)
        }) { (success) in
            self.bearCard.transform = CGAffineTransform.identity
            self.nameLabel.transform = CGAffineTransform.identity
            self.bearNumberLabel.transform = CGAffineTransform.identity
            self.userPicture.transform = CGAffineTransform.identity
        }
    }
    
    @objc func pressedCard(LongPressedGesture : UILongPressGestureRecognizer) {
        let infoAlert = UIAlertController(title: "About Me", message: nil, preferredStyle: .actionSheet)
        let editInfo = UIAlertAction(title: "Edit my information", style: .default) { (action) in
            self.showInfoAlert()
        }
        let imagePick = UIAlertAction(title: "Select image", style: .default) { (action) in
            self.pickImage()
        }
        let cancelOption = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        let deleteAll = UIAlertAction(title: "Delete personal data", style: .destructive) { (action) in
            self.deleteData()
        }
        
        infoAlert.addAction(imagePick)
        infoAlert.addAction(editInfo)
        infoAlert.addAction(cancelOption)
        infoAlert.addAction(deleteAll)
        
        present(infoAlert, animated: true, completion: nil)
        
    }
    
    func pickImage() {
        present(imagePicker, animated: true, completion: nil)
        if UIImagePickerController.isSourceTypeAvailable(.savedPhotosAlbum) {
            imagePicker.delegate = self
            imagePicker.sourceType = .savedPhotosAlbum
            imagePicker.allowsEditing = false
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        self.dismiss(animated: true) {
            if let pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
                self.userPicture.image = pickedImage
            }
        }
    }
    
    func deleteData() {
        
    }
    
    func showInfoAlert() {
        let infoAlert = UIAlertController(title: "My Info", message: nil, preferredStyle: .alert)
        infoAlert.addTextField { (nameTextfield) in
            nameTextfield.placeholder = "Name"
            nameTextfield.keyboardType = UIKeyboardType.alphabet
        }
        infoAlert.addTextField { (bearNumberTextfield) in
            bearNumberTextfield.placeholder = "Bear number"
            bearNumberTextfield.keyboardType = UIKeyboardType.numberPad
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        let saveAction = UIAlertAction(title: "Save", style: .default) { (action) in
            if let name = infoAlert.textFields![0].text {
                self.save(value: name, key: "name")
            }
            if let bearNumber = infoAlert.textFields![1].text {
                self.save(value: bearNumber, key: "bearNumber")
            }
            self.showCardInfo()
        }
        
        infoAlert.addAction(cancelAction)
        infoAlert.addAction(saveAction)
        present(infoAlert, animated: true) {
            self.showCardInfo()
        }
    }
    
    func save(value : String, key : String) {
        UserDefaults.standard.set(value, forKey: key)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        design()
        animations()
        getData()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        getData()
    }
    
    override func viewWillLayoutSubviews() {
        getData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @objc func getData() {
        if let originalPlan = UserDefaults.standard.object(forKey: "mealPlan") as? Dictionary<String, String> {
            if let myCurrentPlan = UserDefaults.standard.object(forKey: "currentPlan") as? Dictionary<String, String> {
                currentPlan = myCurrentPlan
                mealPlan = originalPlan
                
                let mealsLeft : Int = Int(currentPlan["Meals_Per_Week"]!)!
                let dollarsLeft : Double = Double(currentPlan["Dining_Dollars"]!)!
                let bonusLeft : Int = Int(currentPlan["Bonus_Meals"]!)!
                
                let originalMeals : Int = Int(mealPlan["Meals_Per_Week"]!)!
                let originalDollars : Double = Double(mealPlan["Dining_Dollars"]!)!
                let originalBonus : Int = Int(mealPlan["Bonus_Meals"]!)!
                
                mealsUsed = originalMeals - mealsLeft
                bonusUsed = originalBonus - bonusLeft
                dollarUsed = originalDollars - dollarsLeft
                
                
                mealsTotal.text = "\(mealsUsed)/\(originalMeals)"
                bonusTotal.text = "\(bonusUsed)/\(originalBonus)"
                diningTotal.text = "\(dollarUsed)"
                
            }
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
