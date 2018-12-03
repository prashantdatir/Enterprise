//
//  CreateEventDriver+CoreDataClass.swift
//  Enterprise
//
//  Created by user on 11/22/18.
//  Copyright © 2018 admin. All rights reserved.
//
//

import Foundation
import CoreData

@objc(CreateEventDriver)
public class CreateEventDriver: NSManagedObject {

    class func saveDriverDataFromAPI(responseDict : NSDictionary)
    {
        if let saveDriverDict =   responseDict.object(forKey: "driver")as? NSDictionary
        {
            let context : NSManagedObjectContext    =   NSManagedObjectContext.mr_default()
            var createEventDriverDataObj : CreateEventDriver?
            if createEventDriverDataObj == nil
            {
                createEventDriverDataObj = CreateEventDriver.mr_createEntity(in: context)!
            }
            if saveDriverDict != nil
            {
                /*
                 "id": 0,
                 "eventNumber": 0,
                 "name": null,
                 "coDriverName": null,
                 "phone": null,
                 "phoneExt": null,
                 "phone2": null,
                 "phone2Ext": null,
                 "version": 0,
                 "activityLogId": 0,
                 "driverId": null,
                 "textMessagesOK": null,
                 "emailUpdatesOK": null,
                 "isDriverWithUnit": null,
                 "routeId": null,
                 "noRestriction": false
                 */
                if let id   =   saveDriverDict.object(forKey: "id") as? Int64
                {
                    createEventDriverDataObj!.id  =   id
                }
                if let eventNumber   =   saveDriverDict.object(forKey: "eventNumber") as? Int64
                {
                    createEventDriverDataObj!.eventNumber  =   eventNumber
                }
                if let name   =   saveDriverDict.object(forKey: "name") as? String
                {
                    createEventDriverDataObj!.name  =   name
                }
                if let coDriverName   =   saveDriverDict.object(forKey: "coDriverName") as? String
                {
                    createEventDriverDataObj!.coDriverName  =   coDriverName
                }
                if let phone   =   saveDriverDict.object(forKey: "phone") as? String
                {
                    createEventDriverDataObj!.phone  =   phone
                }
                if let phoneExt   =   saveDriverDict.object(forKey: "phoneExt") as? String
                {
                    createEventDriverDataObj!.phoneExt  =   phoneExt
                }
                if let phone2   =   saveDriverDict.object(forKey: "phone2") as? String
                {
                    createEventDriverDataObj!.phone2  =   phone2
                }
                if let phone2Ext   =   saveDriverDict.object(forKey: "phone2Ext") as? String
                {
                    createEventDriverDataObj!.phone2Ext  =   phone2Ext
                }
                if let version   =   saveDriverDict.object(forKey: "version") as? Int64
                {
                    createEventDriverDataObj!.version  =   version
                }
                if let activityLogId   =   saveDriverDict.object(forKey: "activityLogId") as? Int64
                {
                    createEventDriverDataObj!.activityLogId  =   activityLogId
                }
                if let driverId   =   saveDriverDict.object(forKey: "driverId") as? String
                {
                    createEventDriverDataObj!.driverId  =   driverId
                }
                if let textMessagesOK   =   saveDriverDict.object(forKey: "textMessagesOK") as? String
                {
                    createEventDriverDataObj!.textMessagesOK  =   textMessagesOK
                }
                if let emailUpdatesOK   =   saveDriverDict.object(forKey: "emailUpdatesOK") as? String
                {
                    createEventDriverDataObj!.emailUpdatesOK  =   emailUpdatesOK
                }
                if let isDriverWithUnit   =   saveDriverDict.object(forKey: "isDriverWithUnit") as? String
                {
                    createEventDriverDataObj!.isDriverWithUnit  =   isDriverWithUnit
                }
                if let routeId   =   saveDriverDict.object(forKey: "routeId") as? String
                {
                    createEventDriverDataObj!.routeId  =   routeId
                }
                if let noRestriction   =   saveDriverDict.object(forKey: "noRestriction") as? Bool
                {
                    createEventDriverDataObj!.noRestriction  =   noRestriction
                }
                Utility.saveDefaultContext()
            }//end of saveDict
        }//end of dict
    }
    
    
}
