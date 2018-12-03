//
//  CreateEventContact+CoreDataProperties.swift
//  Enterprise
//
//  Created by user on 11/22/18.
//  Copyright © 2018 admin. All rights reserved.
//
//

import Foundation
import CoreData


extension CreateEventContact {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CreateEventContact> {
        return NSFetchRequest<CreateEventContact>(entityName: "CreateEventContact")
    }

    @NSManaged public var id: Int64
    @NSManaged public var eventNumber: Int64
    @NSManaged public var name: String?
    @NSManaged public var phone: String?
    @NSManaged public var extensionn: String?
    @NSManaged public var email: String?
    @NSManaged public var version: Int64
    @NSManaged public var activityLogId: Int64
    @NSManaged public var emailUpdatesOK: String?

}
