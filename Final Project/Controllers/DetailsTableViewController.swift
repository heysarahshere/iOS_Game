//
//  DetailsTableViewController.swift
//  Final Project
//
//  Created by Sarah covey on 12/3/19.
//  Copyright © 2019 Sarah covey. All rights reserved.
//

import UIKit
import CoreData

class DetailsTableViewController: UITableViewController {
    
    var managedObjectContext: NSManagedObjectContext!
    var turns: [Turn]?;
    var game: Game?;
    var gameRating: Int?
    @IBOutlet weak var detailsImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let gameTurns = game?.turns?.allObjects as! [Turn];
        let sortedTurns = gameTurns.sorted(by: {$0.turnNumber < $1.turnNumber})
        turns = sortedTurns;
        self.tableView.reloadData();
        
        if turns!.count == 1
             {
                detailsImage.image = UIImage(systemName: "bolt.fill")
             }
         else if turns!.count <= 5
             {
                detailsImage.image = UIImage(systemName: "hare.fill")
             }
        else {
            detailsImage.image = UIImage(systemName: "tortoise.fill")
             }
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
                     if section == 0 {
                        return turns!.count;
               } else {
                return 0;
        }
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Configure the cell...
        let cell = tableView.dequeueReusableCell(withIdentifier: "detailsCell", for: indexPath) as! DetailsTableViewCell;
        
//        turn = turns[indexPath];
        
        let turn = turns![indexPath.row];
        // configure cell
        cell.update(with: turn);
        cell.showsReorderControl = true;

        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
