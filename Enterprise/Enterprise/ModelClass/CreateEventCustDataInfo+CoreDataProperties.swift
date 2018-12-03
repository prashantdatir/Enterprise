//
//  CreateEventCustDataInfo+CoreDataProperties.swift
//  Enterprise
//
//  Created by user on 11/21/18.
//  Copyright © 2018 admin. All rights reserved.
//
//

import Foundation
import CoreData


extension CreateEventCustDataInfo {

    @nonobjc public class func fetchReques() -> NSFetchRequest<CreateEventCustDataInfo> {
        return NSFetchRequest<CreateEventCustDataInfo>(entityName: "CreateEventCustDataInfo")
    }

    @NSManaged public var lesseePhoneNumber: String?
    @NSManaged public var custId: Int64
    @NSManaged public var eventNumber: Int64
    @NSManaged public var lesseeName: String?
    @NSManaged public var lesseeExtension: String?
    @NSManaged public var terminalId: Int64
    @NSManaged public var version: Int64
    @NSManaged public var activityLogId: Int64
    @NSManaged public var stationId: Int64
    @NSManaged public var destinationTerminal: Int64
    @NSManaged public var dispatcher: String?
    @NSManaged public var callbackLocation: String?

}
