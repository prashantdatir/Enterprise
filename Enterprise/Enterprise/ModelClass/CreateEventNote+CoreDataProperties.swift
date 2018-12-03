//
//  CreateEventNote+CoreDataProperties.swift
//  Enterprise
//
//  Created by user on 11/22/18.
//  Copyright © 2018 admin. All rights reserved.
//
//

import Foundation
import CoreData


extension CreateEventNote {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CreateEventNote> {
        return NSFetchRequest<CreateEventNote>(entityName: "CreateEventNote")
    }

    @NSManaged public var eventNumber: Int64
    @NSManaged public var noteTypeId: Int64
    @NSManaged public var note: String?
    @NSManaged public var version: Int64
    @NSManaged public var activityLogId: Int64

}
