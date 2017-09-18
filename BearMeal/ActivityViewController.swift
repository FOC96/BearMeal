//
//  ActivityViewController.swift
//  BearMeal
//
//  Created by Fernando Ortiz Rico Celio on 9/9/17.
//  Copyright © 2017 Fernando Ortiz Rico Celio. All rights reserved.
//

import UIKit

@IBDesignable
class ActivityViewController: UIViewController {

    @IBOutlet weak var bearID: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var bearNumberLabel: UILabel!
    @IBOutlet weak var userCardPicture: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tappedImage = UITapGestureRecognizer(target: self, action: #selector(ActivityViewController.imageWasTapped(tapGestureRecognizer: )))
        bearID.addGestureRecognizer(tappedImage)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @objc func imageWasTapped(tapGestureRecognizer : UITapGestureRecognizer) {
        UIView.animate(withDuration: 0.25, delay: 0, options: .curveEaseOut, animations: {
            self.bearID.transform = CGAffineTransform(scaleX: 0.99, y: 0.99)
            self.userCardPicture.transform = CGAffineTransform(scaleX: 0.99, y: 0.99)
            self.bearNumberLabel.transform = CGAffineTransform(scaleX: 0.99, y: 0.99)
            self.userNameLabel.transform = CGAffineTransform(scaleX: 0.99, y: 0.99)
        }) { (success) in
            self.bearID.transform = CGAffineTransform.identity
            self.userCardPicture.transform = CGAffineTransform.identity
            self.userNameLabel.transform = CGAffineTransform.identity
            self.bearNumberLabel.transform = CGAffineTransform.identity
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
