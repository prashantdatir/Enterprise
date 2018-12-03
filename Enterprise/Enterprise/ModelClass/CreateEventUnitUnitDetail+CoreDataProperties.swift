//
//  CreateEventUnitUnitDetail+CoreDataProperties.swift
//  Enterprise
//
//  Created by user on 11/22/18.
//  Copyright © 2018 admin. All rights reserved.
//
//

import Foundation
import CoreData


extension CreateEventUnitUnitDetail {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CreateEventUnitUnitDetail> {
        return NSFetchRequest<CreateEventUnitUnitDetail>(entityName: "CreateEventUnitUnitDetail")
    }

    @NSManaged public var id: Int64
    @NSManaged public var eventUnitId: Int64
    @NSManaged public var loadWeightInImperialPounds: Int64
    @NSManaged public var voltage: String?
    @NSManaged public var loadContents: String?
    @NSManaged public var fuelFilterTypeId: String?
    @NSManaged public var transmissionTypeId: String?
    @NSManaged public var fuelTankLevelId: String?
    @NSManaged public var shutdownTimeId: String?
    @NSManaged public var dotNumber: String?
    @NSManaged public var haulTypeId: String?
    @NSManaged public var actionTypeId: String?
    @NSManaged public var homeDomicile: String?
    @NSManaged public var colorId: String?
    @NSManaged public var version: Int64
    @NSManaged public var activityLogId: Int64
    @NSManaged public var mileage: String?
    @NSManaged public var licensePlateNumber: String?
    @NSManaged public var makeId: String?
    @NSManaged public var unitYear: String?
    @NSManaged public var engineHours: Int64
    @NSManaged public var isPriorityShipment: Bool
    @NSManaged public var reeferHours: String?
    @NSManaged public var stationId: String?
    @NSManaged public var businessId: String?
    @NSManaged public var hubReading: Int64
    @NSManaged public var model: String?

}
