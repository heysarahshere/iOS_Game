//
//  HistoryTableViewCell.swift
//  Final Project
//
//  Created by Sarah covey on 12/1/19.
//  Copyright © 2019 Sarah covey. All rights reserved.
//

import UIKit

class HistoryTableViewCell: UITableViewCell {
    
    @IBOutlet var speedIndicatorImage: UIImageView!
    @IBOutlet var gameNumberLabel: UILabel!
    @IBOutlet var winningNumberLabel: UILabel!
    @IBOutlet var winningPlayerLabel: UILabel!
    @IBOutlet var datePlayedLabel: UILabel!
    @IBOutlet var numberOfPlayers: UILabel!
    @IBOutlet var numberOfGuessesLabel: UILabel!

    func update(with game: Game) {

        let gameDate = DateFormatter.localizedString(from: game.datePlayed ?? Date(), dateStyle: .long, timeStyle: .medium)

    
        
        gameNumberLabel.text = "\(game.gameNumber) | Rounds: \(game.rounds)";
        winningNumberLabel.text = "\(game.winningNumber) ";
        winningPlayerLabel.text = "Player \(String(game.winningPlayer)) ";
        datePlayedLabel.text = gameDate;
        numberOfPlayers.text = String(game.numberOfPlayers);
        numberOfGuessesLabel.text = "\(game.guesses)";
        
        if game.guesses == 1
            {
                speedIndicatorImage.image = UIImage(systemName: "bolt.fill")
            }
        else if game.guesses <= 5 {
                    speedIndicatorImage.image = UIImage(systemName: "hare.fill")
            }
            else {
                    speedIndicatorImage.image = UIImage(systemName: "tortoise.fill")}
            }
 
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }


}
