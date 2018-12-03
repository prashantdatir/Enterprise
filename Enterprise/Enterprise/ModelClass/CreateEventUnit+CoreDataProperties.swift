//
//  CreateEventUnit+CoreDataProperties.swift
//  Enterprise
//
//  Created by user on 11/22/18.
//  Copyright © 2018 admin. All rights reserved.
//
//

import Foundation
import CoreData


extension CreateEventUnit {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CreateEventUnit> {
        return NSFetchRequest<CreateEventUnit>(entityName: "CreateEventUnit")
    }

    @NSManaged public var id: Int64
    @NSManaged public var eventNumber: Int64
    @NSManaged public var unitTypeId: String?
    @NSManaged public var unitInfId: Int64
    @NSManaged public var unitNumber: String?
    @NSManaged public var vinNumber: String?
    @NSManaged public var version: Int64
    @NSManaged public var activityLogId: Int64
    @NSManaged public var lesseePONumber: String?
    @NSManaged public var troubleCodeId: String?
    @NSManaged public var repCodeId: String?
    @NSManaged public var isRepairUnit: String?
    @NSManaged public var uI_ParentEventUnitId: String?
    @NSManaged public var uI_ParentUnitNumber: String?
    @NSManaged public var isValIdUnit: String?
    @NSManaged public var towAddressId: String?
    @NSManaged public var tow_Instructions: String?
    @NSManaged public var keyLocation: String?
    @NSManaged public var tire: Bool

}
