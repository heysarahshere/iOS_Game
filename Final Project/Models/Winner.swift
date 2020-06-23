//
//  GameNumber.swift
//  Final Project
//
//  Created by Sarah covey on 12/2/19.
//  Copyright © 2019 Sarah covey. All rights reserved.
//

import Foundation


class Winner: Codable {
    var winner: Int;

    private enum CodingKeys: String, CodingKey {
        case winner;
    }

    init(winner: Int){
        self.winner = winner
        }


    static let DocumentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!;
    static let ArchiveURL = DocumentsDirectory.appendingPathComponent("winner").appendingPathExtension("plist");



    static func saveToFile(winner: Winner) {
            let propertyListEncoder = PropertyListEncoder();
            let encodedWinner = try? propertyListEncoder.encode(winner);
            try? encodedWinner?.write(to: ArchiveURL, options: .noFileProtection);

        }

        static func loadFromFile() -> Winner? {

            let propertyListDecoder = PropertyListDecoder();
            guard let decodedWinner = try? Data(contentsOf: ArchiveURL) else { return nil }
            return try? propertyListDecoder.decode(Winner.self, from: decodedWinner)
    }

}
