//
//  HistoryTableViewController.swift
//  Final Project
//
//  Created by Sarah covey on 12/2/19.
//  Copyright © 2019 Sarah covey. All rights reserved.
//

import UIKit
import CoreData

class HistoryTableViewController: UITableViewController {
    
    
    var managedObjectContext: NSManagedObjectContext!
    
    var games: [Game] = [];
    var turns: [[Turn]] = [];
    

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.rightBarButtonItem = self.editButtonItem;
        
        games = retrieveGames();
        self.tableView.reloadData();
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            

            guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { fatalError("Unable to access App Delegate")}
            let context = appDelegate.persistentContainer.viewContext;
            let game = games[indexPath.row];
            
            // remove game from db
            context.delete(game);
            appDelegate.saveContext();
            
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }

    func retrieveGames() -> [Game]{
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { fatalError("Unable to access App Delegate")}
        let context = appDelegate.persistentContainer.viewContext;
        
        do {
            return try context.fetch(Game.fetchRequest());
        } catch let error as NSError {
            fatalError("Unable to fetch games, \(error.description)")
        }
    }
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        games = retrieveGames();
        return games.count;
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // dequeue cell
         let cell = tableView.dequeueReusableCell(withIdentifier: "historyCell", for: indexPath) as! HistoryTableViewCell;
         
         // get model object to display
         let game = games[indexPath.row];
         
         // configure cell
         cell.update(with: game);
        
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    override func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 125
    }
    
    
    @IBAction func homeButtonTapped(_ sender: Any) {
        self.dismiss(animated: true, completion: nil);
    }
    
    // MARK: - Navigation
      override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let indexPath = tableView.indexPathForSelectedRow!;
        let game = games[indexPath.row];
        let detailsTableViewController = segue.destination as! DetailsTableViewController;
        detailsTableViewController.game = game;

      }

}
