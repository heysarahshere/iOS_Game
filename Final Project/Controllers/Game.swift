//
//  Game.swift
//  Final Project
//
//  Created by Sarah covey on 12/1/19.
//  Copyright © 2019 Sarah covey. All rights reserved.
//

import Foundation

struct Turn {
    var player: String;
    var guess: Int;
    var hint: String;
    var correct:Bool;
}
struct Game {
    var datePlayed:Date;
    var game:[Turn];
    
}
struct Settings {
    
}

  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    self.player = try container.decode(String.self, forKey: .player)
    self.numberGussed = try container.decode(Int.self, forKey: .numberGuessed)
  }
    
  func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self);
    try container.encode(self..player, forKey: .player);
        try container.encode(self.numberGuessed, forKey: .numberGuessed);
  }

//class settings: Codable {
//    var startNUmber: Int;
//    var endNUmber: Int;
//}
//
//class Turn: Codable {
//    var player: String;
//    var guessedNumber: Int;
//}
//
//class Game: Codable {
//    var turnHistory: NSArray;
//}
    
    
//static let DocumentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!;
//static let ArchiveURL = DocumentsDirectory.appendingPathComponent("games").appendingPathExtension("plist");

//    init(players: Array, startNumber: Int, endNUmber: Int, guessedNumber: Int, winningNumber: Int) {
//    self.players = players;
//    self.startNumber = startNumber;
//        self.endNumber = endNumber;
//        self.guessedNumber = guessedNumber;
//}
//    static func saveToFile(games: [Game]) {
//        let propertyListEncoder = PropertyListEncoder();
//        let encodedGames = try? propertyListEncoder.encode(games);
//
//        try? encodedGames?.write(to: ArchiveURL, options: .noFileProtection);
//
//    }
    
//    static func loadFromFile() -> [Emoji]? {
//        let propertyListDecoder = PropertyListDecoder();
//        if let retreivedEmojisData = try? Data(contentsOf: ArchiveURL),
//            let decodedEmojis = return try? propertyListDecoder.decode(Array<Emoji>.self, from: retreivedEmojisData){}
        
//        guard let decodedEmojisData = try? Data(contentsOf: ArchiveURL) else { return nil }
//
//        let propertyListDecoder = PropertyListDecoder();
//
//        return try? propertyListDecoder.decode(Array<Emoji>.self, from: decodedEmojisData)
//    }
    
//    static func loadSampleEmojis() -> [Emoji] {
//        return []
//    }
}


