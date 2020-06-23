//
//  PlayersTableViewController.swift
//  Final Project
//
//  Created by Sarah covey on 1/24/20.
//  Copyright © 2020 Sarah covey. All rights reserved.
//

import UIKit

class PlayersTableViewController: UITableViewController {
    
    
    var playerNumber:Int = 0;
    var numberOfPlayers:Int = 0;
    
    @IBOutlet weak var playerNumberText: UITextField!

    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source

    @IBAction func okButtonTapped(_ sender: Any) {
        
        if let playerNumber = Int(playerNumberText.text!) {
            // inclusive
            if playerNumber >= 2 && playerNumber <= 50 {
                let players = Players(players: playerNumber);
                Players.saveToFile(players: players);
                
                performSegue(withIdentifier: "ServerSegue", sender: nil);
         
            } else {
                playerNumberText.text = "";
                newAlert();
            }
                }
        else {
                    playerNumberText.text = "";
                    newAlert();
                }
    }
    
     func newAlert() {
         let alert = UIAlertController(title: "Error", message: "Please enter a valid number.", preferredStyle: .alert)
         alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
         self.present(alert, animated: true)
     }
    
     @IBAction func unwindToNewGame(_ sender: UIStoryboardSegue){
     }
}
