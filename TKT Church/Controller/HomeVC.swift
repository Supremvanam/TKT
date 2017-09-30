//
//  HomeVC.swift
//  TKT Church
//
//  Created by Suprem Vanam on 30/09/17.
//  Copyright © 2017 Suprem Vanam. All rights reserved.
//

import UIKit
import FirebaseAuth

class HomeVC: UIViewController {
    
    @IBOutlet weak var descLabel: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        descLabel.text = "The current user is \(Auth.auth().currentUser?.phoneNumber)"

    }
    
    @IBAction func LogoutTapped(sender: UIButton!) {
        
        do {
            try Auth.auth().signOut()
            print("Logout successful")
            self.performSegue(withIdentifier: "logout", sender: Any?.self)
            print("Segue successful")
            descLabel.text = "The current user is \(Auth.auth().currentUser)"
            
        } catch {
            print("Error logging out \(String(describing: error.localizedDescription))")
            print("Logout error")
        }
        
    }
    
}
