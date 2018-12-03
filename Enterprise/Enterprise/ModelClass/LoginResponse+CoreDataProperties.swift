//
//  LoginResponse+CoreDataProperties.swift
//  Enterprise
//
//  Created by user on 11/23/18.
//  Copyright © 2018 admin. All rights reserved.
//
//

import Foundation
import CoreData


extension LoginResponse {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<LoginResponse> {
        return NSFetchRequest<LoginResponse>(entityName: "LoginResponse")
    }

    @NSManaged public var unitInfId: Int64
    @NSManaged public var custId: Int64
    @NSManaged public var customerName: String?
    @NSManaged public var custCode: String?
    @NSManaged public var color: String?
    @NSManaged public var colorId: Int64
    @NSManaged public var make: String?
    @NSManaged public var mileage: String?
    @NSManaged public var model: String?
    @NSManaged public var status: Bool
    @NSManaged public var unitNum: String?
    @NSManaged public var vin: String?
    @NSManaged public var year: String?

}
