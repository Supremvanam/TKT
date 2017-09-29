//
//  ViewController.swift
//  TKT Church
//
//  Created by Suprem Vanam on 26/09/17.
//  Copyright © 2017 Suprem Vanam. All rights reserved.
//

import UIKit
import FirebaseAuth

class LoginVC: UIViewController {
    
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var nextButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewStyle()
//        UINavigationItem.setHidesBackButton(self)
        navigationItem.hidesBackButton = true;
    }

    @IBAction func nextButtonTapped(_ sender: UIButton) {
        sender.pulsate()
     
//        let alert = UIAlertController(title: "Phone number", message: "Is this your phone number? \n \(phoneTextField.text!)", preferredStyle: .alert)
//        let action = UIAlertAction(title: "Yes", style: .default) { (UIAlertAction) in
        
//            PhoneAuthProvider.provider().verifyPhoneNumber(self.phoneTextField.text!) { (verificationID, error) in
        PhoneAuthProvider.provider().verifyPhoneNumber(self.phoneTextField.text!) { (verificationID, error) in
            if error != nil {
                print("Error : \(String(describing: error?.localizedDescription))")
            } else {
                
                let defaults = UserDefaults.standard
                defaults.set(verificationID, forKey: "authVID")
                self.performSegue(withIdentifier: "code", sender: Any?.self)
                
            }
        }
                   print("Next button tapped")
        }
//        let cancel = UIAlertAction(title: "No", style: .cancel, handler: nil)
//        alert.addAction(action)
//        alert.addAction(cancel)
//        alert.present(alert, animated: true, completion: nil)
        
    func viewStyle() {
        phoneTextField.layer.cornerRadius = phoneTextField.frame.size.height/2
        phoneTextField.layer.masksToBounds = true
        
        nextButton.layer.cornerRadius = nextButton.frame.size.height/2
        nextButton.layer.masksToBounds = true
        
        view.setGradientBackground(colorOne: Colors.lightPurple, colorTwo: Colors.darkPurple)
    }
        

    }

    
    
    
    
    
    
    
    
    
    
    
    
    
    
    

    


