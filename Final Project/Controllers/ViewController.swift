//
//  ViewController.swift
//  Final Project
//
//  Created by Sarah covey on 11/12/19.
//  Copyright © 2019 Sarah covey. All rights reserved.
//

import UIKit

//games = [Game] = []

class ViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    var startNumber = 1;
    var endNumber = 1000;


    //Action

    
 override func viewDidLoad() {
    super.viewDidLoad()
    self.animate();
    let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
    imageView.isUserInteractionEnabled = true;
    imageView.addGestureRecognizer(tapGestureRecognizer);
    
    if let userSetting = GameSetting.loadFromFile() {
        startNumber = Int(userSetting.startNumber);
        endNumber = Int(userSetting.endNumber);
    } else {
        startNumber = 1;
        endNumber = 1000;
        }
    
    let userSetting = GameSetting(startNumber: startNumber, endNumber: endNumber);
    GameSetting.saveToFile(gameSetting: userSetting);
    }
    
    @IBAction func unwindToHome(_ sender: UIStoryboardSegue){
    }
    
    @objc func imageTapped(tapGestureRecognizer: UITapGestureRecognizer)
    {
        self.animate();
    }
    
    func animate(){
        UIView.animate(withDuration: 1) {
            self.imageView.transform = CGAffineTransform(scaleX: 0.6, y: 0.6)
        }
        UIView.animate(withDuration: 1) {
            self.imageView.transform = CGAffineTransform(scaleX: 0.9, y: 0.8)
        }
        UIView.animate(withDuration: 0.5) {
            self.imageView.transform = CGAffineTransform.identity
        }
    }
}
