//
//  CreateEventUnit+CoreDataClass.swift
//  Enterprise
//
//  Created by user on 11/22/18.
//  Copyright © 2018 admin. All rights reserved.
//
//

import Foundation
import CoreData

@objc(CreateEventUnit)
public class CreateEventUnit: NSManagedObject {

    class func saveUnitDataFromAPI(responseDict : NSDictionary)
    {
        //let saveUnitDict    =   responseDict.allKeys
        let saveUnitDict = responseDict
        if saveUnitDict.count > 0
        {
            let context : NSManagedObjectContext    =   NSManagedObjectContext.mr_default()
            var createEventUnitDataObj : CreateEventUnit?
            if createEventUnitDataObj == nil
            {
                createEventUnitDataObj = CreateEventUnit.mr_createEntity(in: context)!
            }
            if saveUnitDict != nil
            {
                
                /*
                 "id": 0,
                 "eventNumber": 4786701,
                 "unitTypeId": null,
                 "unitInfId": 1,
                 "unitNumber": "12345",
                 "vinNumber": null,
                 "version": 0,
                 "activityLogId": 0,
                 "lesseePONumber": null,
                 "troubleCodeId": null,
                 "repCodeId": null,
                 "isRepairUnit": null,
                 "uI_ParentEventUnitId": null,
                 "uI_ParentUnitNumber": null,
                 "isValIdUnit": null,
                 "towAddressId": null,
                 "tow_Instructions": null,
                 "keyLocation": null,
                 "tire": null
                 
                 */
                if let id   =   (saveUnitDict as AnyObject).object(forKey: "id") as? Int64
                {
                    createEventUnitDataObj!.id  =   id
                }
                if let eventNumber   =   saveUnitDict.object(forKey: "eventNumber") as? Int64
                {
                    createEventUnitDataObj!.eventNumber  =   eventNumber
                }
                if let unitTypeId   =   saveUnitDict.object(forKey: "unitTypeId") as? String
                {
                    createEventUnitDataObj!.unitTypeId  =   unitTypeId
                }
                if let unitInfId   =   saveUnitDict.object(forKey: "unitInfId") as? Int64
                {
                    createEventUnitDataObj!.unitInfId  =   unitInfId
                }
                if let unitNumber   =   saveUnitDict.object(forKey: "unitNumber") as? String
                {
                    createEventUnitDataObj!.unitNumber  =   unitNumber
                }
                if let vinNumber   =   saveUnitDict.object(forKey: "vinNumber") as? String
                {
                    createEventUnitDataObj!.vinNumber  =   vinNumber
                }
                if let version   =   saveUnitDict.object(forKey: "version") as? Int64
                {
                    createEventUnitDataObj!.version  =   version
                }
                if let activityLogId   =   saveUnitDict.object(forKey: "activityLogId") as? Int64
                {
                    createEventUnitDataObj!.activityLogId  =   activityLogId
                }
                if let lesseePONumber   =   saveUnitDict.object(forKey: "lesseePONumber") as? String
                {
                    createEventUnitDataObj!.lesseePONumber  =   lesseePONumber
                }
                if let troubleCodeId   =   saveUnitDict.object(forKey: "troubleCodeId") as? String
                {
                    createEventUnitDataObj!.troubleCodeId  =   troubleCodeId
                }
                if let repCodeId   =   saveUnitDict.object(forKey: "id") as? String
                {
                    createEventUnitDataObj!.repCodeId  =   repCodeId
                }
                if let isRepairUnit   =   saveUnitDict.object(forKey: "isRepairUnit") as? String
                {
                    createEventUnitDataObj!.isRepairUnit  =   isRepairUnit
                }
                if let uI_ParentEventUnitId   =   saveUnitDict.object(forKey: "uI_ParentEventUnitId") as? String
                {
                    createEventUnitDataObj!.uI_ParentEventUnitId  =   uI_ParentEventUnitId
                }
                if let uI_ParentUnitNumber   =   saveUnitDict.object(forKey: "uI_ParentUnitNumber") as? String
                {
                    createEventUnitDataObj!.uI_ParentUnitNumber  =   uI_ParentUnitNumber
                }
                if let isValIdUnit   =   saveUnitDict.object(forKey: "isValIdUnit") as? String
                {
                    createEventUnitDataObj!.isValIdUnit  =   isValIdUnit
                }
                if let towAddressId   =   saveUnitDict.object(forKey: "towAddressId") as? String
                {
                    createEventUnitDataObj!.towAddressId  =   towAddressId
                }
                if let tow_Instructions   =   saveUnitDict.object(forKey: "tow_Instructions") as? String
                {
                    createEventUnitDataObj!.tow_Instructions  =   tow_Instructions
                }
                if let keyLocation   =   saveUnitDict.object(forKey: "keyLocation") as? String
                {
                    createEventUnitDataObj!.keyLocation  =   keyLocation
                }
                if let tire   =   saveUnitDict.object(forKey: "tire") as? Bool
                {
                    createEventUnitDataObj!.tire  =   tire
                }
                Utility.saveDefaultContext()
            }//end of saveDict
        }
//        if let saveUnitDict =   responseDict.object(forKey: "activityLogId") as? NSDictionary
//        //object(forKey: "unit")as? NSDictionary
//        {
//            let context : NSManagedObjectContext    =   NSManagedObjectContext.mr_default()
//            var createEventUnitDataObj : CreateEventUnit?
//            if createEventUnitDataObj == nil
//            {
//                createEventUnitDataObj = CreateEventUnit.mr_createEntity(in: context)!
//            }
//            if saveUnitDict != nil
//            {
//
//                /*
//                 "id": 0,
//                 "eventNumber": 4786701,
//                 "unitTypeId": null,
//                 "unitInfId": 1,
//                 "unitNumber": "12345",
//                 "vinNumber": null,
//                 "version": 0,
//                 "activityLogId": 0,
//                 "lesseePONumber": null,
//                 "troubleCodeId": null,
//                 "repCodeId": null,
//                 "isRepairUnit": null,
//                 "uI_ParentEventUnitId": null,
//                 "uI_ParentUnitNumber": null,
//                 "isValIdUnit": null,
//                 "towAddressId": null,
//                 "tow_Instructions": null,
//                 "keyLocation": null,
//                 "tire": null
//
//                */
//                if let id   =   saveUnitDict.object(forKey: "id") as? Int64
//                {
//                    createEventUnitDataObj!.id  =   id
//                }
//                if let eventNumber   =   saveUnitDict.object(forKey: "eventNumber") as? Int64
//                {
//                    createEventUnitDataObj!.eventNumber  =   eventNumber
//                }
//                if let unitTypeId   =   saveUnitDict.object(forKey: "unitTypeId") as? String
//                {
//                    createEventUnitDataObj!.unitTypeId  =   unitTypeId
//                }
//                if let unitInfId   =   saveUnitDict.object(forKey: "unitInfId") as? Int64
//                {
//                    createEventUnitDataObj!.unitInfId  =   unitInfId
//                }
//                if let unitNumber   =   saveUnitDict.object(forKey: "unitNumber") as? String
//                {
//                    createEventUnitDataObj!.unitNumber  =   unitNumber
//                }
//                if let vinNumber   =   saveUnitDict.object(forKey: "vinNumber") as? String
//                {
//                    createEventUnitDataObj!.vinNumber  =   vinNumber
//                }
//                if let version   =   saveUnitDict.object(forKey: "version") as? Int64
//                {
//                    createEventUnitDataObj!.version  =   version
//                }
//                if let activityLogId   =   saveUnitDict.object(forKey: "activityLogId") as? Int64
//                {
//                    createEventUnitDataObj!.activityLogId  =   activityLogId
//                }
//                if let lesseePONumber   =   saveUnitDict.object(forKey: "lesseePONumber") as? String
//                {
//                    createEventUnitDataObj!.lesseePONumber  =   lesseePONumber
//                }
//                if let troubleCodeId   =   saveUnitDict.object(forKey: "troubleCodeId") as? String
//                {
//                    createEventUnitDataObj!.troubleCodeId  =   troubleCodeId
//                }
//                if let repCodeId   =   saveUnitDict.object(forKey: "id") as? String
//                {
//                    createEventUnitDataObj!.repCodeId  =   repCodeId
//                }
//                if let isRepairUnit   =   saveUnitDict.object(forKey: "isRepairUnit") as? String
//                {
//                    createEventUnitDataObj!.isRepairUnit  =   isRepairUnit
//                }
//                if let uI_ParentEventUnitId   =   saveUnitDict.object(forKey: "uI_ParentEventUnitId") as? String
//                {
//                    createEventUnitDataObj!.uI_ParentEventUnitId  =   uI_ParentEventUnitId
//                }
//                if let uI_ParentUnitNumber   =   saveUnitDict.object(forKey: "uI_ParentUnitNumber") as? String
//                {
//                    createEventUnitDataObj!.uI_ParentUnitNumber  =   uI_ParentUnitNumber
//                }
//                if let isValIdUnit   =   saveUnitDict.object(forKey: "isValIdUnit") as? String
//                {
//                    createEventUnitDataObj!.isValIdUnit  =   isValIdUnit
//                }
//                if let towAddressId   =   saveUnitDict.object(forKey: "towAddressId") as? String
//                {
//                    createEventUnitDataObj!.towAddressId  =   towAddressId
//                }
//                if let tow_Instructions   =   saveUnitDict.object(forKey: "tow_Instructions") as? String
//                {
//                    createEventUnitDataObj!.tow_Instructions  =   tow_Instructions
//                }
//                if let keyLocation   =   saveUnitDict.object(forKey: "keyLocation") as? String
//                {
//                    createEventUnitDataObj!.keyLocation  =   keyLocation
//                }
//                if let tire   =   saveUnitDict.object(forKey: "tire") as? Bool
//                {
//                    createEventUnitDataObj!.tire  =   tire
//                }
//                Utility.saveDefaultContext()
//            }//end of saveDict
//        }//end of dict
    }
    
}
