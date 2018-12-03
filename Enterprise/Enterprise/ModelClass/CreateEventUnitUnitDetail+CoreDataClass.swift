//
//  CreateEventUnitUnitDetail+CoreDataClass.swift
//  Enterprise
//
//  Created by user on 11/22/18.
//  Copyright © 2018 admin. All rights reserved.
//
//

import Foundation
import CoreData

@objc(CreateEventUnitUnitDetail)
public class CreateEventUnitUnitDetail: NSManagedObject {

    class func saveUnitUnitDetailDataFromAPI(responseDict : NSDictionary)
    {
        if let saveUnitUnitDetailDict =   responseDict.object(forKey: "unitDetail")as? NSDictionary
        {
            let context : NSManagedObjectContext    =   NSManagedObjectContext.mr_default()
            var createEventUnitUnitDetailDataObj : CreateEventUnitUnitDetail?
            if createEventUnitUnitDetailDataObj == nil
            {
                createEventUnitUnitDetailDataObj = CreateEventUnitUnitDetail.mr_createEntity(in: context)!
            }
            if saveUnitUnitDetailDict != nil
            {
                /*
                 "id": 0,
                 "eventUnitId": 0,
                 "loadWeightInImperialPounds": 0,
                 "voltage": null,
                 "loadContents": null,
                 "fuelFilterTypeId": null,
                 "transmissionTypeId": null,
                 "fuelTankLevelId": null,
                 "shutdownTimeId": null,
                 "dotNumber": null,
                 "haulTypeId": null,
                 "actionTypeId": null,
                 "homeDomicile": null,
                 "colorId": null,
                 "version": 0,
                 "activityLogId": 0,
                 "mileage": null,
                 "licensePlateNumber": null,
                 "makeId": null,
                 "unitYear": null,
                 "engineHours": 0,
                 "isPriorityShipment": false,
                 "reeferHours": null,
                 "stationId": null,
                 "businessId": null,
                 "hubReading": 0,
                 "model": null
                */
                if let id   =   saveUnitUnitDetailDict.object(forKey: "id") as? Int64
                {
                    createEventUnitUnitDetailDataObj!.id  =   id
                }
                if let eventUnitId   =   saveUnitUnitDetailDict.object(forKey: "eventUnitId") as? Int64
                {
                    createEventUnitUnitDetailDataObj!.eventUnitId  =   eventUnitId
                }
                if let loadWeightInImperialPounds   =   saveUnitUnitDetailDict.object(forKey: "loadWeightInImperialPounds") as? Int64
                {
                    createEventUnitUnitDetailDataObj!.loadWeightInImperialPounds  =   loadWeightInImperialPounds
                }
                if let voltage   =   saveUnitUnitDetailDict.object(forKey: "voltage") as? String
                {
                    createEventUnitUnitDetailDataObj!.voltage  =   voltage
                }
                if let loadContents   =   saveUnitUnitDetailDict.object(forKey: "loadContents") as? String
                {
                    createEventUnitUnitDetailDataObj!.loadContents  =   loadContents
                }
                if let fuelFilterTypeId   =   saveUnitUnitDetailDict.object(forKey: "fuelFilterTypeId") as? String
                {
                    createEventUnitUnitDetailDataObj!.fuelFilterTypeId  =   fuelFilterTypeId
                }
                if let transmissionTypeId   =   saveUnitUnitDetailDict.object(forKey: "transmissionTypeId") as? String
                {
                    createEventUnitUnitDetailDataObj!.transmissionTypeId  =   transmissionTypeId
                }
                if let fuelTankLevelId   =   saveUnitUnitDetailDict.object(forKey: "fuelTankLevelId") as? String
                {
                    createEventUnitUnitDetailDataObj!.fuelTankLevelId  =   fuelTankLevelId
                }
                if let shutdownTimeId   =   saveUnitUnitDetailDict.object(forKey: "shutdownTimeId") as? String
                {
                    createEventUnitUnitDetailDataObj!.shutdownTimeId  =   shutdownTimeId
                }
                if let dotNumber   =   saveUnitUnitDetailDict.object(forKey: "dotNumber") as? String
                {
                    createEventUnitUnitDetailDataObj!.dotNumber  =   dotNumber
                }
                if let haulTypeId   =   saveUnitUnitDetailDict.object(forKey: "haulTypeId") as? String
                {
                    createEventUnitUnitDetailDataObj!.haulTypeId  =   haulTypeId
                }
                if let actionTypeId   =   saveUnitUnitDetailDict.object(forKey: "actionTypeId") as? String
                {
                    createEventUnitUnitDetailDataObj!.actionTypeId  =   actionTypeId
                }
                if let homeDomicile   =   saveUnitUnitDetailDict.object(forKey: "homeDomicile") as? String
                {
                    createEventUnitUnitDetailDataObj!.homeDomicile  =   homeDomicile
                }
                if let colorId   =   saveUnitUnitDetailDict.object(forKey: "colorId") as? String
                {
                    createEventUnitUnitDetailDataObj!.colorId  =   colorId
                }
                if let version   =   saveUnitUnitDetailDict.object(forKey: "version") as? Int64
                {
                    createEventUnitUnitDetailDataObj!.version  =   version
                }
                if let mileage   =   saveUnitUnitDetailDict.object(forKey: "mileage") as? String
                {
                    createEventUnitUnitDetailDataObj!.mileage  =   mileage
                }
                if let licensePlateNumber   =   saveUnitUnitDetailDict.object(forKey: "licensePlateNumber") as? String
                {
                    createEventUnitUnitDetailDataObj!.licensePlateNumber  =   licensePlateNumber
                }
                if let makeId   =   saveUnitUnitDetailDict.object(forKey: "makeId") as? String
                {
                    createEventUnitUnitDetailDataObj!.makeId  =   makeId
                }
                if let unitYear   =   saveUnitUnitDetailDict.object(forKey: "unitYear") as? String
                {
                    createEventUnitUnitDetailDataObj!.unitYear  =   unitYear
                }
                if let engineHours   =   saveUnitUnitDetailDict.object(forKey: "engineHours") as? Int64
                {
                    createEventUnitUnitDetailDataObj!.engineHours  =   engineHours
                }
                if let isPriorityShipment   =   saveUnitUnitDetailDict.object(forKey: "isPriorityShipment") as? Bool
                {
                    createEventUnitUnitDetailDataObj!.isPriorityShipment  =   isPriorityShipment
                }
                if let reeferHours   =   saveUnitUnitDetailDict.object(forKey: "reeferHours") as? String
                {
                    createEventUnitUnitDetailDataObj!.reeferHours  =   reeferHours
                }
                if let stationId   =   saveUnitUnitDetailDict.object(forKey: "stationId") as? String
                {
                    createEventUnitUnitDetailDataObj!.stationId  =   stationId
                }
                if let businessId   =   saveUnitUnitDetailDict.object(forKey: "businessId") as? String
                {
                    createEventUnitUnitDetailDataObj!.businessId  =   businessId
                }
                if let hubReading   =   saveUnitUnitDetailDict.object(forKey: "hubReading") as? Int64
                {
                    createEventUnitUnitDetailDataObj!.hubReading  =   hubReading
                }
                if let model   =   saveUnitUnitDetailDict.object(forKey: "model") as? String
                {
                    createEventUnitUnitDetailDataObj!.model  =   model
                }
                if let activityLogId   =   saveUnitUnitDetailDict.object(forKey: "activityLogId") as? Int64
                {
                    createEventUnitUnitDetailDataObj!.activityLogId  =   activityLogId
                }
                Utility.saveDefaultContext()
            }//end of saveDict
        }//end of dict
    }
}
