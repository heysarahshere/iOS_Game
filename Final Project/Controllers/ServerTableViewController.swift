//
//  ServerTableViewController.swift
//  Final Project
//
//  Created by Sarah covey on 1/24/20.
//  Copyright © 2020 Sarah covey. All rights reserved.
//

import UIKit

class ServerTableViewController: UITableViewController {

    
    let userSetting = GameSetting.loadFromFile();
    
    
    @IBOutlet var startNumberLabel: UILabel!
    @IBOutlet var endNumberLabel: UILabel!

    @IBOutlet var serverNumberText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let startNumber = Int(userSetting!.startNumber);
        let endNumber = Int(userSetting!.endNumber);

            startNumberLabel.text = String(startNumber);
            endNumberLabel.text = String(endNumber);
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

   @IBAction func okButtonTapped(_ sender: Any) {
       let startNumber = Int(userSetting!.startNumber);
       let endNumber = Int(userSetting!.endNumber);
           if let serverNumber = Int(serverNumberText.text!) {
               if serverNumber >= startNumber && serverNumber <= endNumber {
                   if let players = Players.loadFromFile(){
   
                       let gameData = GameData(datePlayed: Date(), startNumber: String(startNumber), endNumber: String(endNumber), winningNumber: String(serverNumber), numberOfPlayers:
                           String(players.players))
                       
                           GameData.saveToFile(gameData: gameData);
                       
                       print(gameData)
                   } else { return }
                   performSegue(withIdentifier: "GuessSegue", sender: nil);
            
               } else {
                   serverNumberText.text = "";
                   newAlert();
               }
                   }
                    else {
                       serverNumberText.text = "";
                       newAlert();
                   }
   }
   
    func newAlert() {
       let alert = UIAlertController(title: "Error", message: "Please enter a valid number.", preferredStyle: .alert)
       
       alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))

       self.present(alert, animated: true)
       
   }

}
