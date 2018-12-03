//
//  CreateEventNote+CoreDataClass.swift
//  Enterprise
//
//  Created by user on 11/22/18.
//  Copyright © 2018 admin. All rights reserved.
//
//

import Foundation
import CoreData

@objc(CreateEventNote)
public class CreateEventNote: NSManagedObject {

    class func saveNoteDataFromAPI(responseDict : NSDictionary)
    {
        if let saveNoteDict =   responseDict.object(forKey: "note")as? NSDictionary
        {
            let context : NSManagedObjectContext    =   NSManagedObjectContext.mr_default()
            var createEventNoteDataObj : CreateEventNote?
            if createEventNoteDataObj == nil
            {
                createEventNoteDataObj = CreateEventNote.mr_createEntity(in: context)!
            }
            if saveNoteDict != nil
            {
                /*
                 "eventNumber": 0,
                 "noteTypeId": 0,
                 "note": null,
                 "version": 0,
                 "activityLogId": 0
                 */
                if let eventNumber   =   saveNoteDict.object(forKey: "eventNumber") as? Int64
                {
                    createEventNoteDataObj!.eventNumber  =   eventNumber
                }
                if let noteTypeId   =   saveNoteDict.object(forKey: "noteTypeId") as? Int64
                {
                    createEventNoteDataObj!.noteTypeId  =   noteTypeId
                }
                if let note   =   saveNoteDict.object(forKey: "note") as? String
                {
                    createEventNoteDataObj!.note  =   note
                }
                if let version   =   saveNoteDict.object(forKey: "version") as? Int64
                {
                    createEventNoteDataObj!.version  =   version
                }
                if let activityLogId   =   saveNoteDict.object(forKey: "activityLogId") as? Int64
                {
                    createEventNoteDataObj!.activityLogId  =   activityLogId
                }
                Utility.saveDefaultContext()
            }//end of saveDict
        }//end of dict
    }
    
}
