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
        
        phoneTextField.delegate = self
        viewStyle()
        navigationItem.hidesBackButton = true;
        
    }

    @IBAction func nextButtonTapped(_ sender: UIButton) {
        sender.pulsate()

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
    
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let DestController = segue.destination as! AuthVC
        DestController.infoLabelText = "We’ve sent  a verification code to \n \(phoneTextField.text!)\n\nPlease enter the code down here to Get Started"
        
    }
        
    func viewStyle() {
        phoneTextField.layer.cornerRadius = phoneTextField.frame.size.height/2
        phoneTextField.layer.masksToBounds = true
        
        nextButton.layer.cornerRadius = nextButton.frame.size.height/2
        nextButton.layer.masksToBounds = true
        
        view.setDiagonalGradientBackground(colorOne: Colors.lightPurple, colorTwo: Colors.darkPurple)
    }
    
}

extension LoginVC: UITextFieldDelegate {

    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.text = "+91"
    }
    
    //    func textViewDidBeginEditing(_ textView: UITextView) {
//        textView.text = ""
//        sendBtn.isEnabled = true
//    }
}
    
    
    
    
    
    
    
    
    
    
    
    
    
    

    


