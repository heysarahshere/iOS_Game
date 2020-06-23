//
//  GuessTableViewController.swift
//  Final Project
//
//  Created by Sarah covey on 1/24/20.
//  Copyright © 2020 Sarah covey. All rights reserved.
//

import UIKit
import CoreData

class GuessTableViewController: UITableViewController {
    
    var managedObjectContext: NSManagedObjectContext!
    
    let userSetting = GameSetting.loadFromFile();
    let gameData = GameData.loadFromFile();
    let players = Players.loadFromFile();
    var gameNumber:Int?;
    var turns: Int = 0;
    var games: [Game] = [];
    var hint:String = "";
    var correct:Bool = false;
    var startNumber:Int?;
    var endNumber:Int?;
    var winningPlayerText:String = "";
    var game: Game!;
    
    
    //start with round 1, player 1
    var i = 1;
    var round = 1;

    @IBOutlet var guessTextField: UITextField!
    @IBOutlet var playerLabel: UILabel!
    @IBOutlet var guessButton: UIButton!
    
    @IBOutlet var hintLabel: UILabel!
    
    @IBOutlet var startNumberLabel: UILabel!
    @IBOutlet var endNumberLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let startNumber = Int(userSetting!.startNumber);
        let endNumber = Int(userSetting!.endNumber);

        startNumberLabel.text = String(startNumber);
        endNumberLabel.text = String(endNumber);
        
        // start game
        game = initGame();

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
    
     @IBAction func guessButtonTapped(_
            sender: Any) {
            // inc on every turn?
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { fatalError("Unable to access App Delegate")}
        let context = appDelegate.persistentContainer.viewContext;
        
            if let numberOfPlayers = Players.loadFromFile() {
                let players = numberOfPlayers.players;
                
            guard let winningNumber: Int = Int(gameData!.winningNumber),
                  let guess: Int = Int(guessTextField.text!)
                  else { newAlert(); return }
            playerLabel.text = "Player \(i)"
            print("Num of Players: \(players)");
                
                
           
                    if guess > winningNumber {
                        hint = "A little lower..."
                        hintLabel.text = hint
                        print("guess: \(guess)  winNum: \(winningNumber)")
                        turns += 1;
                        
                        // save turn
                        let turn = Turn(entity: Turn.entity(), insertInto: context);
                        turn.player = String(i);
                        turn.guess = String(guess);
                        turn.hint = String(hint);
                        turn.correct = false;
                        turn.game = game;
                        turn.turnNumber = Int16(turns);
                        appDelegate.saveContext();
                        
                        
                        print("this is i variable before inc: \(i)")
                        i = i + 1;
                        if i > players {
                             i = 1;
                             round = round + 1;}
                        print("this is i variable: \(i)") // test
                        playerLabel.text = "Player \(i)"
                        guessTextField.text = "";
                        hintLabel.text = hint;
                    } else if guess < winningNumber {
                        
                        hint = "A little higher..."
                        hintLabel.text = hint
                        turns += 1;
                        print("guess: \(guess)  winNum: \(winningNumber)")
                        print("guess: \(players)  winNum: \(i)")
                        
                        // save turn
                        let turn = Turn(entity: Turn.entity(), insertInto: context);
                        turn.player = String(i);
                        turn.guess = String(guess);
                        turn.hint = String(hint);
                        turn.correct = false;
                        turn.game = game;
                        turn.turnNumber = Int16(turns);
                        appDelegate.saveContext();
                        
                        i = i + 1;
                        if i > players {
                           i = 1;
                           round = round + 1;}
                        playerLabel.text = "Player \(i)"
                        guessTextField.text = "";
                        
                    }//correct
                    else if guess == winningNumber {
                        turns += 1;
                        correct = true;
                        
                        // save turn
                        let turn = Turn(entity: Turn.entity(), insertInto: context);
                        turn.player = String(i);
                        turn.guess = String(guess);
                        turn.hint = "win";
                        turn.correct = false;
                        turn.game = game;
                        turn.turnNumber = Int16(turns);
                        appDelegate.saveContext();
                        
                        let winner = Winner(winner: i);
                        
                        Winner.saveToFile(winner: winner)
                        
                        
    //                     if old games
                        games = retrieveGames();
                        if games.count > 0 {
                            let defaults = UserDefaults.standard;
                            gameNumber = defaults.integer(forKey: "gameInt");
                            let currentGame = gameNumber! + 1;
                            defaults.set(currentGame, forKey: "gameInt");

                            // save game
                            game.datePlayed = Date();
                            game.rounds = Int16(round);
                            game.gameNumber = Int16(currentGame);
                            game.numberOfPlayers = Int16(players);
                            game.winningPlayer = Int16(i);
                            game.winningNumber = Int16(winningNumber);
                            game.guesses = Int16(turns);
                            
                            appDelegate.saveContext();
                            print(game ?? "")

                            } else { // first game
                                let defaults = UserDefaults.standard;
                                //Set
                                defaults.set(1, forKey: "gameInt");
                                gameNumber = 1;
                            
                            // save game
                            game.datePlayed = Date();
                            game.rounds = Int16(round);
                            game.gameNumber = Int16(1);
                            game.numberOfPlayers = Int16(players);
                            game.winningPlayer = Int16(i);
                            game.winningNumber = Int16(winningNumber);
                            game.guesses = Int16(turns);
                            
                            appDelegate.saveContext();
                            }

                        print("guess: \(guess)  winNum: \(winningNumber)")
                    performSegue(withIdentifier: "winnerSegue", sender: nil);
                        }
                    else { print("No Winners."); }
                   }

        }
    
    func initGame() -> Game {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { fatalError("Unable to access App Delegate")}
        let context = appDelegate.persistentContainer.viewContext;
        let game = Game(entity: Game.entity(), insertInto: context);
        appDelegate.saveContext();
        return game;
    }
        
        
    func newAlert() {
            let alert = UIAlertController(title: "Error", message: "Guess must be an integer.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true)
        }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "cancelUnwind"){
            guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { fatalError("Unable to access App Delegate")}
            let context = appDelegate.persistentContainer.viewContext;
            context.delete(game);
            appDelegate.saveContext();
        }
    }
}
