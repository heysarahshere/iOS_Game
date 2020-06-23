//
//  Game+CoreDataProperties.swift
//  Final Project
//
//  Created by Sarah covey on 3/13/20.
//  Copyright © 2020 Sarah covey. All rights reserved.
//
//

import Foundation
import CoreData


extension Game {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Game> {
        return NSFetchRequest<Game>(entityName: "Game")
    }

    @NSManaged public var datePlayed: Date?
    @NSManaged public var gameNumber: Int16
    @NSManaged public var rounds: Int16
    @NSManaged public var numberOfPlayers: Int16
    @NSManaged public var winningPlayer: Int16
    @NSManaged public var guesses: Int16
    @NSManaged public var winningNumber: Int16
    @NSManaged public var turns: NSSet?

}

// MARK: Generated accessors for turns
extension Game {

    @objc(addTurnsObject:)
    @NSManaged public func addToTurns(_ value: Turn)

    @objc(removeTurnsObject:)
    @NSManaged public func removeFromTurns(_ value: Turn)

    @objc(addTurns:)
    @NSManaged public func addToTurns(_ values: NSSet)

    @objc(removeTurns:)
    @NSManaged public func removeFromTurns(_ values: NSSet)

}
