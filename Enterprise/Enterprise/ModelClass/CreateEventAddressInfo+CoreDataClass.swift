//
//  CreateEventAddressInfo+CoreDataClass.swift
//  Enterprise
//
//  Created by user on 11/21/18.
//  Copyright © 2018 admin. All rights reserved.
//
//

import Foundation
import CoreData

@objc(CreateEventAddressInfo)
public class CreateEventAddressInfo: NSManagedObject {

    class func saveAddressDataFromAPI(responseDict : NSDictionary)
    {
        if let saveAddressDict =   responseDict.object(forKey: "address")as? NSDictionary
        {
            let context : NSManagedObjectContext    =   NSManagedObjectContext.mr_default()
            var createEventAddressDataObj : CreateEventAddressInfo?
            if createEventAddressDataObj == nil
            {
                createEventAddressDataObj = CreateEventAddressInfo.mr_createEntity(in: context)!
            }
            if saveAddressDict != nil
            {
                if let id   =   saveAddressDict.object(forKey: "id") as? Int64
                {
                    createEventAddressDataObj!.id  =   id
                }
                if let id   =   saveAddressDict.object(forKey: "eventNumber") as? Int64
                {
                    createEventAddressDataObj!.id  =   id
                }
                if let addressTypeId   =   saveAddressDict.object(forKey: "addressTypeId") as? Int64
                {
                    createEventAddressDataObj!.addressTypeId  =   addressTypeId
                }
                if let address1   =   saveAddressDict.object(forKey: "address1") as? String
                {
                    createEventAddressDataObj!.address1  =   address1
                }
                if let address2   =   saveAddressDict.object(forKey: "address2") as? String
                {
                    createEventAddressDataObj!.address2  =   address2
                }
                if let city   =   saveAddressDict.object(forKey: "city") as? String
                {
                    createEventAddressDataObj!.city  =   city
                }
                if let state   =   saveAddressDict.object(forKey: "state") as? String
                {
                    createEventAddressDataObj!.state  =   state
                }
                if let postCode   =   saveAddressDict.object(forKey: "postCode") as? String
                {
                    createEventAddressDataObj!.postCode  =   postCode
                }
                if let countryId   =   saveAddressDict.object(forKey: "countryId") as? Int64
                {
                    createEventAddressDataObj!.countryId  =   countryId
                }
                if let latitude   =   saveAddressDict.object(forKey: "latitude") as? String
                {
                    createEventAddressDataObj!.latitude  =   latitude
                }
                if let longitude   =   saveAddressDict.object(forKey: "longitude") as? String
                {
                    createEventAddressDataObj!.longitude  =   longitude
                }
                if let version   =   saveAddressDict.object(forKey: "version") as? Int64
                {
                    createEventAddressDataObj!.version  =   version
                }
                if let activityLogId   =   saveAddressDict.object(forKey: "activityLogId") as? Int64
                {
                    createEventAddressDataObj!.activityLogId  =   activityLogId
                }
                if let locationDescription   =   saveAddressDict.object(forKey: "locationDescription") as? String
                {
                    createEventAddressDataObj!.locationDescription  =   locationDescription
                }
                Utility.saveDefaultContext()
            }//end of saveAdd != nil
        }//end of saveAddDict
    }
}
