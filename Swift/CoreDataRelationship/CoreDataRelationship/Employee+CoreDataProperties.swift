//
//  Employee+CoreDataProperties.swift
//  CoreDataRelationship
//
//  Created by ligulfzhou on 2/28/16.
//  Copyright © 2016 ligulfzhou. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Employee {

    @NSManaged var age: NSNumber?
    @NSManaged var name: String?
    @NSManaged var manager: Manager?

}
