//
//  CreateEventCallData+CoreDataProperties.swift
//  Enterprise
//
//  Created by user on 11/22/18.
//  Copyright © 2018 admin. All rights reserved.
//
//

import Foundation
import CoreData


extension CreateEventCallData {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CreateEventCallData> {
        return NSFetchRequest<CreateEventCallData>(entityName: "CreateEventCallData")
    }

    @NSManaged public var id: Int64
    @NSManaged public var eventNumber: Int64
    @NSManaged public var callerName: String?
    @NSManaged public var callerPhone: String?
    @NSManaged public var callerExtension: String?
    @NSManaged public var callDateTime: String?
    @NSManaged public var callDateTimeEnd: String?
    @NSManaged public var callerPhone2: String?
    @NSManaged public var callerExtension2: String?
    @NSManaged public var typeOfCaller: Int64

}
