//
//  CreateEventDriver+CoreDataProperties.swift
//  Enterprise
//
//  Created by user on 11/22/18.
//  Copyright © 2018 admin. All rights reserved.
//
//

import Foundation
import CoreData


extension CreateEventDriver {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CreateEventDriver> {
        return NSFetchRequest<CreateEventDriver>(entityName: "CreateEventDriver")
    }

    @NSManaged public var id: Int64
    @NSManaged public var eventNumber: Int64
    @NSManaged public var name: String?
    @NSManaged public var coDriverName: String?
    @NSManaged public var phone: String?
    @NSManaged public var phoneExt: String?
    @NSManaged public var phone2: String?
    @NSManaged public var phone2Ext: String?
    @NSManaged public var version: Int64
    @NSManaged public var activityLogId: Int64
    @NSManaged public var driverId: String?
    @NSManaged public var textMessagesOK: String?
    @NSManaged public var emailUpdatesOK: String?
    @NSManaged public var isDriverWithUnit: String?
    @NSManaged public var routeId: String?
    @NSManaged public var noRestriction: Bool

}
