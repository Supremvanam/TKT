//
//  LiveStreamVC.swift
//  TKT Church
//
//  Created by Suprem Vanam on 13/10/17.
//  Copyright © 2017 Suprem Vanam. All rights reserved.
//

import UIKit
import AVFoundation
import YouTubePlayer_Swift
import Firebase
import FirebaseDatabase

class LiveStreamVC: UIViewController {
 
    @IBOutlet weak var videoPlayerView: YouTubePlayerView!
    
    let appDel = UIApplication.shared.delegate as! AppDelegate


    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.setHorizontalGradientBackground(colorOne: Colors.white, colorTwo: Colors.black)

        let statusBarView = UIView(frame: UIApplication.shared.statusBarFrame)
        let statusBarColor = UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 1.0)
        statusBarView.backgroundColor = statusBarColor
        view.addSubview(statusBarView)
    
    }
    override func viewDidAppear(_ animated: Bool) {
        
        appDel.ref.child("liveurl").observe(.value, with: { (snapshot) in
            if let value = snapshot.value {
                print("The Live URL Value is \(String(describing: value))")
                self.LiveStreamSuccess(value: value as! String)
            } else {
                print ("Value is not shown")
            }
        }) { (error) in
            print(error.localizedDescription)
        }
    
    }
    
    func LiveStreamSuccess(value: String) {
        
        videoPlayerView.playerVars = ["playsinline": 1 as AnyObject,
                                      "showinfo": 0 as AnyObject,
                                      "modestbranding": 1 as AnyObject]
        let myVideoURL = NSURL(string: value)
        videoPlayerView.loadVideoURL(myVideoURL! as URL)
    
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
}
