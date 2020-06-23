//
//  DetailsTableViewCell.swift
//  Final Project
//
//  Created by Sarah covey on 12/1/19.
//  Copyright © 2019 Sarah covey. All rights reserved.
//

import UIKit

class DetailsTableViewCell: UITableViewCell {
    
    
    @IBOutlet var hintImage: UIImageView!
    @IBOutlet var playerLabel: UILabel!
    @IBOutlet var playerGuessLabel: UILabel!
    
    
        func update(with turn: Turn) {
            
            playerLabel.text = turn.player;
            playerGuessLabel.text = turn.guess;

            if turn.hint == "A little higher..."
            {
                hintImage.image = UIImage(systemName: "arrow.down.circle.fill")
            }
            else if turn.hint == "A little lower..." {
                    hintImage.image = UIImage(systemName: "arrow.up.circle.fill")
            }
            else {
                    hintImage.image = UIImage(systemName: "star.circle.fill")}
            
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
