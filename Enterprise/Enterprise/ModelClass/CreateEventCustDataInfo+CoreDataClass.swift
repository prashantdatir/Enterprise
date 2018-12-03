//
//  CreateEventCustDataInfo+CoreDataClass.swift
//  Enterprise
//
//  Created by user on 11/21/18.
//  Copyright © 2018 admin. All rights reserved.
//
//

import Foundation
import CoreData

@objc(CreateEventCustDataInfo)
public class CreateEventCustDataInfo: NSManagedObject {
    
    class func saveCustDataFromAPI(responseDict : NSDictionary)
    {
        if let saveCustDict =   responseDict.object(forKey: "custData")as? NSDictionary
        {
            let context : NSManagedObjectContext    =   NSManagedObjectContext.mr_default()
            var createEventCustDataObj : CreateEventCustDataInfo?
            if createEventCustDataObj == nil
            {
                createEventCustDataObj = CreateEventCustDataInfo.mr_createEntity(in: context)!
            }
            if saveCustDict != nil
            {
                if let custID   =   saveCustDict.object(forKey: "custId") as? Int64
                {
                    createEventCustDataObj!.custId  =   custID
                }
                if let eventNumber   =   saveCustDict.object(forKey: "eventNumber") as? Int64
                {
                    createEventCustDataObj!.eventNumber  =   eventNumber
                }
                if let lesseeName   =   saveCustDict.object(forKey: "lesseeName") as? String
                {
                    createEventCustDataObj!.lesseeName  =   lesseeName
                }
                if let lesseePhoneNumber   =   saveCustDict.object(forKey: "lesseePhoneNumber") as? String
                {
                    createEventCustDataObj!.lesseePhoneNumber  =   lesseePhoneNumber
                }
                if let lesseeExtension   =   saveCustDict.object(forKey: "lesseeExtension") as? String
                {
                    createEventCustDataObj!.lesseeExtension  =   lesseeExtension
                }
                if let terminalId   =   saveCustDict.object(forKey: "terminalId") as? Int64
                {
                    createEventCustDataObj!.terminalId  =   terminalId
                }
                if let version   =   saveCustDict.object(forKey: "version") as? Int64
                {
                    createEventCustDataObj!.version =   version
                }
                if let activityLogId   =   saveCustDict.object(forKey: "activityLogId") as? Int64
                {
                    createEventCustDataObj!.activityLogId  =   activityLogId
                }
                if let stationId   =   saveCustDict.object(forKey: "stationId") as? Int64
                {
                    createEventCustDataObj!.stationId  =   stationId
                }
                if let destinationTerminal   =   saveCustDict.object(forKey: "destinationTerminal") as? Int64
                {
                    createEventCustDataObj!.destinationTerminal  =   destinationTerminal
                }
                if let dispatcher   =   saveCustDict.object(forKey: "dispatcher") as? String
                {
                    createEventCustDataObj!.dispatcher  =   dispatcher
                }
                if let callbackLocation   =   saveCustDict.object(forKey: "callbackLocation") as? String
                {
                    createEventCustDataObj!.callbackLocation  =   callbackLocation
                }
                Utility.saveDefaultContext()
            }//end of saveCustDict != null
        }//end of saveCust Dict
    }

}
