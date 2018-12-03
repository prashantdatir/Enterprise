//
//  CreateEventUnitUnitRental+CoreDataProperties.swift
//  Enterprise
//
//  Created by user on 11/22/18.
//  Copyright © 2018 admin. All rights reserved.
//
//

import Foundation
import CoreData


extension CreateEventUnitUnitRental {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CreateEventUnitUnitRental> {
        return NSFetchRequest<CreateEventUnitUnitRental>(entityName: "CreateEventUnitUnitRental")
    }


}
