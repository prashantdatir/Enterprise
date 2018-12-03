//
//  CreateEventLocation+CoreDataProperties.swift
//  Enterprise
//
//  Created by user on 11/22/18.
//  Copyright © 2018 admin. All rights reserved.
//
//

import Foundation
import CoreData


extension CreateEventLocation {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CreateEventLocation> {
        return NSFetchRequest<CreateEventLocation>(entityName: "CreateEventLocation")
    }

    @NSManaged public var eventNumber: Int64
    @NSManaged public var tripId: String?
    @NSManaged public var domicileLoc: String?
    @NSManaged public var locationType: String?
    @NSManaged public var hoursLeftDrive: String?
    @NSManaged public var milesToDest: String?
    @NSManaged public var version: Int64
    @NSManaged public var activityLogId: Int64
    @NSManaged public var countryId: String?
    @NSManaged public var originOfLoad: String?
    @NSManaged public var destinationLocation: String?

}
