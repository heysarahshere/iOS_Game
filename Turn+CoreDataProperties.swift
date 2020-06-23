//
//  Turn+CoreDataProperties.swift
//  Final Project
//
//  Created by Sarah covey on 3/13/20.
//  Copyright © 2020 Sarah covey. All rights reserved.
//
//

import Foundation
import CoreData


extension Turn {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Turn> {
        return NSFetchRequest<Turn>(entityName: "Turn")
    }

    @NSManaged public var correct: Bool
    @NSManaged public var guess: String?
    @NSManaged public var hint: String?
    @NSManaged public var player: String?
    @NSManaged public var turnNumber: Int16
    @NSManaged public var game: Game?

}
