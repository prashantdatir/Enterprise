//
//  CreateEventLocation+CoreDataClass.swift
//  Enterprise
//
//  Created by user on 11/22/18.
//  Copyright © 2018 admin. All rights reserved.
//
//

import Foundation
import CoreData

@objc(CreateEventLocation)
public class CreateEventLocation: NSManagedObject {

    class func saveLocationDataFromAPI(responseDict : NSDictionary)
    {
        if let saveLocationDict =   responseDict.object(forKey: "location")as? NSDictionary
        {
            let context : NSManagedObjectContext    =   NSManagedObjectContext.mr_default()
            var createEventLocationDataObj : CreateEventLocation?
            if createEventLocationDataObj == nil
            {
                createEventLocationDataObj = CreateEventLocation.mr_createEntity(in: context)!
            }
            if saveLocationDict != nil
            {
                /*
                 "eventNumber": 0,
                 "tripId": null,
                 "domicileLoc": null,
                 "locationType": null,
                 "hoursLeftDrive": null,
                 "milesToDest": null,
                 "version": 0,
                 "activityLogId": 0,
                 "countryId": null,
                 "originOfLoad": null,
                 "destinationLocation": null
                */
                if let eventNumber   =   saveLocationDict.object(forKey: "eventNumber") as? Int64
                {
                    createEventLocationDataObj!.eventNumber  =   eventNumber
                }
                if let tripId   =   saveLocationDict.object(forKey: "tripId") as? String
                {
                    createEventLocationDataObj!.tripId  =   tripId
                }
                if let domicileLoc   =   saveLocationDict.object(forKey: "domicileLoc") as? String
                {
                    createEventLocationDataObj!.domicileLoc  =   domicileLoc
                }
                if let locationType   =   saveLocationDict.object(forKey: "locationType") as? String
                {
                    createEventLocationDataObj!.locationType  =   locationType
                }
                if let hoursLeftDrive   =   saveLocationDict.object(forKey: "hoursLeftDrive") as? String
                {
                    createEventLocationDataObj!.hoursLeftDrive  =   hoursLeftDrive
                }
                if let milesToDest   =   saveLocationDict.object(forKey: "milesToDest") as? String
                {
                    createEventLocationDataObj!.milesToDest  =   milesToDest
                }
                if let version   =   saveLocationDict.object(forKey: "version") as? Int64
                {
                    createEventLocationDataObj!.version  =   version
                }
                if let activityLogId   =   saveLocationDict.object(forKey: "activityLogId") as? Int64
                {
                    createEventLocationDataObj!.activityLogId  =   activityLogId
                }
                if let countryId   =   saveLocationDict.object(forKey: "countryId") as? String
                {
                    createEventLocationDataObj!.countryId  =   countryId
                }
                if let originOfLoad   =   saveLocationDict.object(forKey: "originOfLoad") as? String
                {
                    createEventLocationDataObj!.originOfLoad  =   originOfLoad
                }
                if let destinationLocation   =   saveLocationDict.object(forKey: "destinationLocation") as? String
                {
                    createEventLocationDataObj!.destinationLocation  =   destinationLocation
                }
                Utility.saveDefaultContext()
            }//end of saveDict
        }//end of dict
    }
}
