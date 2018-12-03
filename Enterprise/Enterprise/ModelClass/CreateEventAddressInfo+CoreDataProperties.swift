//
//  CreateEventAddressInfo+CoreDataProperties.swift
//  Enterprise
//
//  Created by user on 11/21/18.
//  Copyright © 2018 admin. All rights reserved.
//
//

import Foundation
import CoreData


extension CreateEventAddressInfo {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CreateEventAddressInfo> {
        return NSFetchRequest<CreateEventAddressInfo>(entityName: "CreateEventAddressInfo")
    }

    @NSManaged public var activityLogId: Int64
    @NSManaged public var address1: String?
    @NSManaged public var address2: String?
    @NSManaged public var addressTypeId: Int64
    @NSManaged public var city: String?
    @NSManaged public var countryId: Int64
    @NSManaged public var eventNumber: Int64
    @NSManaged public var id: Int64
    @NSManaged public var latitude: String?
    @NSManaged public var locationDescription: String?
    @NSManaged public var longitude: String?
    @NSManaged public var postCode: String?
    @NSManaged public var state: String?
    @NSManaged public var version: Int64

}
