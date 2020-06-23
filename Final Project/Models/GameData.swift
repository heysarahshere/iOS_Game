//
//  GameData.swift
//  Final Project
//
//  Created by Sarah covey on 12/2/19.
//  Copyright © 2019 Sarah covey. All rights reserved.
//

import Foundation

struct GameData: Codable {
    var datePlayed: Date;
    var startNumber: String;
    var endNumber: String;
    var winningNumber: String;
    var numberOfPlayers: String;

    private enum CodingKeys: String, CodingKey {
        case datePlayed;
        case startNumber;
        case endNumber;
        case winningNumber;
        case numberOfPlayers;
        
    }
    
    //save as strings for ease of displaying
    init(datePlayed: Date, startNumber: String, endNumber: String, winningNumber: String, numberOfPlayers: String){
        self.datePlayed = datePlayed;
        self.startNumber = startNumber;
        self.endNumber = endNumber;
        self.winningNumber = winningNumber;
        self.numberOfPlayers = numberOfPlayers;
    }
    
    
    static let DocumentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!;
    static let ArchiveURL = DocumentsDirectory.appendingPathComponent("gamedata").appendingPathExtension("plist");



        static func saveToFile(gameData: GameData) {
            let propertyListEncoder = PropertyListEncoder();
            let encodedGameData = try? propertyListEncoder.encode(gameData);
            try? encodedGameData?.write(to: ArchiveURL, options: .noFileProtection);

        }

        static func loadFromFile() -> GameData? {

            let propertyListDecoder = PropertyListDecoder();
            guard let decodedGameData = try? Data(contentsOf: ArchiveURL) else { return nil }
            return try? propertyListDecoder.decode(GameData.self, from: decodedGameData)
    }

    
}

