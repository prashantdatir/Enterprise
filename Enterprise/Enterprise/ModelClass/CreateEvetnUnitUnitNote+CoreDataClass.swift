//
//  CreateEvetnUnitUnitNote+CoreDataClass.swift
//  Enterprise
//
//  Created by user on 11/22/18.
//  Copyright © 2018 admin. All rights reserved.
//
//

import Foundation
import CoreData

@objc(CreateEvetnUnitUnitNote)
public class CreateEvetnUnitUnitNote: NSManagedObject {

    class func saveUnitUnitNoteDataFromAPI(responseDict : NSDictionary)
    {
        if let saveUnitUnitNoteDict =   responseDict.object(forKey: "unitNote")as? NSDictionary
        {
            let context : NSManagedObjectContext    =   NSManagedObjectContext.mr_default()
            var createEventUnitUnitNoteDataObj : CreateEvetnUnitUnitNote?
            if createEventUnitUnitNoteDataObj == nil
            {
                createEventUnitUnitNoteDataObj = CreateEvetnUnitUnitNote.mr_createEntity(in: context)!
            }
            if saveUnitUnitNoteDict != nil
            {
                /*
                 "id": 0,
                 "eventNumber": 0,
                 "eventUnitId": 0,
                 "unitNoteTypeId": 0,
                 "note": null,
                 "version": null,
                 "activityLogId": null
                 */
                if let id   =   saveUnitUnitNoteDict.object(forKey: "id") as? Int64
                {
                    createEventUnitUnitNoteDataObj!.id  =   id
                }
                if let eventNumber   =   saveUnitUnitNoteDict.object(forKey: "eventNumber") as? Int64
                {
                    createEventUnitUnitNoteDataObj!.eventNumber  =   eventNumber
                }
                if let eventUnitId   =   saveUnitUnitNoteDict.object(forKey: "eventUnitId") as? Int64
                {
                    createEventUnitUnitNoteDataObj!.eventUnitId  =   eventUnitId
                }
                if let unitNoteTypeId   =   saveUnitUnitNoteDict.object(forKey: "unitNoteTypeId") as? Int64
                {
                    createEventUnitUnitNoteDataObj!.unitNoteTypeId  =   unitNoteTypeId
                }
                if let note   =   saveUnitUnitNoteDict.object(forKey: "note") as? String
                {
                    createEventUnitUnitNoteDataObj!.note  =   note
                }
                if let version   =   saveUnitUnitNoteDict.object(forKey: "version") as? String
                {
                    createEventUnitUnitNoteDataObj!.version  =   version
                }
                if let activityLogId   =   saveUnitUnitNoteDict.object(forKey: "activityLogId") as? String
                {
                    createEventUnitUnitNoteDataObj!.activityLogId  =   activityLogId
                }
                Utility.saveDefaultContext()
            }//end of saveDict
        }//end of dict
    }
}
