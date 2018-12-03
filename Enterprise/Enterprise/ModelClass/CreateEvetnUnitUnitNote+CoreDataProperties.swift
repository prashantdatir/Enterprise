//
//  CreateEvetnUnitUnitNote+CoreDataProperties.swift
//  Enterprise
//
//  Created by user on 11/22/18.
//  Copyright © 2018 admin. All rights reserved.
//
//

import Foundation
import CoreData


extension CreateEvetnUnitUnitNote {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CreateEvetnUnitUnitNote> {
        return NSFetchRequest<CreateEvetnUnitUnitNote>(entityName: "CreateEvetnUnitUnitNote")
    }

    @NSManaged public var id: Int64
    @NSManaged public var eventNumber: Int64
    @NSManaged public var eventUnitId: Int64
    @NSManaged public var unitNoteTypeId: Int64
    @NSManaged public var note: String?
    @NSManaged public var version: String?
    @NSManaged public var activityLogId: String?

}
