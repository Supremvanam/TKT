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
    
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var weekLabel: UILabel!
    @IBOutlet weak var logoutBtn: UIButton!
    @IBOutlet weak var greetView: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let date = Date()
        let calendar = Calendar.current
        
        let day = calendar.component(.day, from: date)
        let month = calendar.component(.month, from: date)
        let week = calendar.component(.weekday, from: date)
        
        var monthName: String
        var weekName: String
        
        switch month {
        case 1:
            monthName = "JANUARY"
        case 2:
            monthName = "FEBRUARY"
        case 3:
            monthName = "MARCH"
        case 4:
            monthName = "APRIL"
        case 5:
            monthName = "MAY"
        case 6:
            monthName = "JUNE"
        case 7:
            monthName = "JULY"
        case 8:
            monthName = "AUGUST"
        case 9:
            monthName = "SEPTEMBER"
        case 10:
            monthName = "OCTOBER"
        case 11:
            monthName = "NOVEMBER"
        case 12:
            monthName = "DECEMBER"
        default:
            monthName = "OF THIS MONTH"
        }
        
        switch week {
        case 1:
            weekName = "SUNDAY"
        case 2:
            weekName = "MONDAY"
        case 3:
            weekName = "TUESDAY"
        case 4:
            weekName = "WEDNESDAY"
        case 5:
            weekName = "THURSDAY"
        case 6:
            weekName = "FRIDAY"
        case 7:
            weekName = "SATURDAY"
        default:
            weekName = "TODAY"
        }
        
        dateLabel.text = "\(day) \(monthName)"
        weekLabel.text = "\(weekName)"
        
//        greetView.backgroundColor = #colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)
        greetView.layer.cornerRadius = 25
        greetView.layer.masksToBounds = true
        
    }
    
    @IBAction func logoutButtonTapped(_ sender: UIButton) {
        sender.pulsate()
        do {
           try Auth.auth().signOut()
            self.performSegue(withIdentifier: "logout", sender: Any?.self)
            print("Logged out")
        } catch {
            print("Signout error")
        }
    }

    
}
