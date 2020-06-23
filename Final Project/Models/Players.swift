//
//  Players.swift
//  Final Project
//
//  Created by Sarah covey on 12/2/19.
//  Copyright © 2019 Sarah covey. All rights reserved.
//

import Foundation

//singleton
//trying a few different methods of variable use

class Players: Codable {
    var players:Int;
    
    private enum CodingKeys: String, CodingKey {
        case players;
    }
    
    init(players: Int){
        self.players = players;
    }
    
    static let DocumentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!;
    static let ArchiveURL = DocumentsDirectory.appendingPathComponent("players_tmp").appendingPathExtension("plist");



        static func saveToFile(players: Players) {
            let propertyListEncoder = PropertyListEncoder();
            let encodedPlayers = try? propertyListEncoder.encode(players);
            try? encodedPlayers?.write(to: ArchiveURL, options: .noFileProtection);

        }

        static func loadFromFile() -> Players? {

            let propertyListDecoder = PropertyListDecoder();
            guard let decodedPlayers = try? Data(contentsOf: ArchiveURL) else { return nil }
            return try? propertyListDecoder.decode(Players.self, from: decodedPlayers)
    }
    
}
