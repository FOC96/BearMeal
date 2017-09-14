//
//  Activity_Main.swift
//  BearMeal
//
//  Created by Fernando Ortiz Rico Celio on 9/11/17.
//  Copyright © 2017 Fernando Ortiz Rico Celio. All rights reserved.
//

import UIKit

class Activity_Main: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
//  VISUAL ELEMENTS
    @IBOutlet weak var bearCard: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var bearNumberLabel: UILabel!
    @IBOutlet weak var userPicture: UIImageView!
    
//  TOOLS
    var imagePicker = UIImagePickerController()
    
    
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
        
//        // TabBar
//        self.tabBarController?.tabBar.layer.shadowColor = UIColor.black.cgColor
//        self.tabBarController?.tabBar.layer.shadowOffset = CGSize(width: 0.0, height: 3.0)
//        self.tabBarController?.tabBar.layer.shadowRadius = 6
//        self.tabBarController?.tabBar.layer.shadowOpacity = 0.15
//        self.tabBarController?.tabBar.layer.borderWidth = 0.50
//        self.tabBarController?.tabBar.layer.borderColor = UIColor.white.cgColor
//        self.tabBarController?.tabBar.clipsToBounds = true
//        self.tabBarController?.tabBar.backgroundColor = UIColor.white
//        self.tabBarController?.tabBar.shadowImage = UIImage()
        
        
        // Card design (shadow)
        bearCard.layer.shadowColor = UIColor.black.cgColor
        bearCard.layer.shadowOffset = CGSize(width: 0, height: 8)
        bearCard.layer.shadowRadius = 6
        bearCard.layer.shadowOpacity = 0.25
        
        // Card info
        showCardInfo()
    }
    
    func animations() {
        let tapCard = UITapGestureRecognizer(target: self, action: #selector(Activity_Main.tapOnCard(tapGestureRecognizer:)))
        bearCard.addGestureRecognizer(tapCard)
        
        let longPressedOnCard = UILongPressGestureRecognizer(target: self, action: #selector(Activity_Main.pressedCard(LongPressedGesture:)))
        longPressedOnCard.minimumPressDuration = 1
        bearCard.addGestureRecognizer(longPressedOnCard)
        
    }
    
    
    func showCardInfo() {
        if let name = UserDefaults.standard.object(forKey: "name") {
            nameLabel.text = (name as! String)
        } else {
            nameLabel.text = " "
        }
        
        if let bearNumber = UserDefaults.standard.object(forKey: "bearNumber") {
            bearNumberLabel.text = (bearNumber as! String)
        } else {
            bearNumberLabel.text = " "
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
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
