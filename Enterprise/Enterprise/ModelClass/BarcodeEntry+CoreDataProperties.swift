//
//  BarcodeEntry+CoreDataProperties.swift
//  Enterprise
//
//  Created by user on 11/21/18.
//  Copyright © 2018 admin. All rights reserved.
//
//

import Foundation
import CoreData


extension BarcodeEntry {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<BarcodeEntry> {
        return NSFetchRequest<BarcodeEntry>(entityName: "BarcodeEntry")
    }

    @NSManaged public var scannedData: String?

}
