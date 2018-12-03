//
//  CreateEventContact+CoreDataClass.swift
//  Enterprise
//
//  Created by user on 11/22/18.
//  Copyright © 2018 admin. All rights reserved.
//
//

import Foundation
import CoreData

@objc(CreateEventContact)
public class CreateEventContact: NSManagedObject {

    class func saveContactDataFromAPI(responseDict : NSDictionary)
    {
        if let saveContactDict =   responseDict.object(forKey: "contact")as? NSDictionary
        {
            let context : NSManagedObjectContext    =   NSManagedObjectContext.mr_default()
            var createEventContactDataObj : CreateEventContact?
            if createEventContactDataObj == nil
            {
                createEventContactDataObj = CreateEventContact.mr_createEntity(in: context)!
            }
            if saveContactDict != nil
            {
                /*
                 "id": 0,
                 "eventNumber": 0,
                 "name": null,
                 "phone": null,
                 "extension": null,
                 "email": null,
                 "version": 0,
                 "activityLogId": 0,
                 "emailUpdatesOK": null
                 */
                if let id   =   saveContactDict.object(forKey: "id") as? Int64
                {
                    createEventContactDataObj!.id  =   id
                }
                if let eventNumber   =   saveContactDict.object(forKey: "eventNumber") as? Int64
                {
                    createEventContactDataObj!.eventNumber  =   eventNumber
                }
                if let name   =   saveContactDict.object(forKey: "name") as? String
                {
                    createEventContactDataObj!.name  =   name
                }
                if let phone   =   saveContactDict.object(forKey: "phone") as? String
                {
                    createEventContactDataObj!.phone  =   phone
                }
                if let extensionn   =   saveContactDict.object(forKey: "extension") as? String
                {
                    createEventContactDataObj!.extensionn  =   extensionn
                }
                if let email   =   saveContactDict.object(forKey: "email") as? String
                {
                    createEventContactDataObj!.email  =   email
                }
                if let version   =   saveContactDict.object(forKey: "version") as? Int64
                {
                    createEventContactDataObj!.version  =   version
                }
                if let activityLogId   =   saveContactDict.object(forKey: "activityLogId") as? Int64
                {
                    createEventContactDataObj!.activityLogId  =   activityLogId
                }
                if let emailUpdatesOK   =   saveContactDict.object(forKey: "emailUpdatesOK") as? String
                {
                    createEventContactDataObj!.emailUpdatesOK  =   emailUpdatesOK
                }
                Utility.saveDefaultContext()
            }//end of saveDict
        }//end of dict
    }
    
}
