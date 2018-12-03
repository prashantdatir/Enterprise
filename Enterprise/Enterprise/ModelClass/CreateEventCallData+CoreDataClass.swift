//
//  CreateEventCallData+CoreDataClass.swift
//  Enterprise
//
//  Created by user on 11/22/18.
//  Copyright © 2018 admin. All rights reserved.
//
//

import Foundation
import CoreData

@objc(CreateEventCallData)
public class CreateEventCallData: NSManagedObject {

    class func saveCallDataFromAPI(responseDict : NSDictionary)
    {
        if let saveCallDict =   responseDict.object(forKey: "callData")as? NSDictionary
        {
            let context : NSManagedObjectContext    =   NSManagedObjectContext.mr_default()
            var CreateEventCallDataObj : CreateEventCallData?
            if CreateEventCallDataObj == nil
            {
                CreateEventCallDataObj = CreateEventCallData.mr_createEntity(in: context)!
            }
            if saveCallDict != nil
            {
                /*
                 "id": 0,
                 "eventNumber": 0,
                 "callerName": "12323123",
                 "callerPhone": "12323123",
                 "callerExtension": null,
                 "callDateTime": null,
                 "callDateTimeEnd": null,
                 "callerPhone2": null,
                 "callerExtension2": null,
                 "typeOfCaller": 0
                 */
                if let id   =   saveCallDict.object(forKey: "id") as? Int64
                {
                    CreateEventCallDataObj!.id  =   id
                }
                if let eventNumber   =   saveCallDict.object(forKey: "eventNumber") as? Int64
                {
                    CreateEventCallDataObj!.eventNumber  =   eventNumber
                }
                if let callerName   =   saveCallDict.object(forKey: "callerName") as? String
                {
                    CreateEventCallDataObj!.callerName  =   callerName
                }
                if let callerPhone   =   saveCallDict.object(forKey: "callerPhone") as? String
                {
                    CreateEventCallDataObj!.callerPhone  =   callerPhone
                }
                if let callerExtension   =   saveCallDict.object(forKey: "callerExtension") as? String
                {
                    CreateEventCallDataObj!.callerExtension  =   callerExtension
                }
                if let callDateTime   =   saveCallDict.object(forKey: "callDateTime") as? String
                {
                    CreateEventCallDataObj!.callDateTime  =   callDateTime
                }
                if let callDateTimeEnd   =   saveCallDict.object(forKey: "callDateTimeEnd") as? String
                {
                    CreateEventCallDataObj!.callDateTimeEnd  =   callDateTimeEnd
                }
                if let callerPhone2   =   saveCallDict.object(forKey: "callerPhone2") as? String
                {
                    CreateEventCallDataObj!.callerPhone2  =   callerPhone2
                }
                if let callerExtension2   =   saveCallDict.object(forKey: "callerExtension2") as? String
                {
                    CreateEventCallDataObj!.callerExtension2  =   callerExtension2
                }
                if let typeOfCaller   =   saveCallDict.object(forKey: "typeOfCaller") as? Int64
                {
                    CreateEventCallDataObj!.typeOfCaller  =   typeOfCaller
                }
                Utility.saveDefaultContext()
            }
        }
    }
    
}
