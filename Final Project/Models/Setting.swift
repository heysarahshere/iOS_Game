//
//  Setting.swift
//  Final Project
//
//  Created by Sarah covey on 12/2/19.
//  Copyright © 2019 Sarah covey. All rights reserved.
//

import Foundation

class GameSetting: Codable {
    var startNumber: Int;
    var endNumber: Int;

    private enum CodingKeys: String, CodingKey {
        case startNumber;
        case endNumber;
    }

    init(startNumber: Int, endNumber: Int){
        self.startNumber = startNumber;
        self.endNumber = endNumber;
        }


    static let DocumentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!;
    static let ArchiveURL = DocumentsDirectory.appendingPathComponent("setting").appendingPathExtension("txt");



        static func saveToFile(gameSetting: GameSetting) {
            let propertyListEncoder = PropertyListEncoder();
            let encodedGameSetting = try? propertyListEncoder.encode(gameSetting);
            try? encodedGameSetting?.write(to: ArchiveURL, options: .noFileProtection);

        }

        static func loadFromFile() -> GameSetting? {

            let propertyListDecoder = PropertyListDecoder();
            guard let decodedGameSettingData = try? Data(contentsOf: ArchiveURL) else { return nil }
            return try? propertyListDecoder.decode(GameSetting.self, from: decodedGameSettingData)
    }

    // not working? causing crash if no user setting is created first?
    static func loadDefault() -> GameSetting? {
    return GameSetting(startNumber: 1, endNumber: 1000)
    }
}

//struct Range {
//    var startNumber: Int;
//    var endNumber: Int;
//    }
        





