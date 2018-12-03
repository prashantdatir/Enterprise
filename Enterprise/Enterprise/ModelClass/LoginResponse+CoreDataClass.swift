//
//  LoginResponse+CoreDataClass.swift
//  Enterprise
//
//  Created by user on 11/23/18.
//  Copyright © 2018 admin. All rights reserved.
//
//

import Foundation
import CoreData

@objc(LoginResponse)
public class LoginResponse: NSManagedObject {

    class func saveLoginRespDataFromAPI(responseDict : NSDictionary)
    {
        let saveLoginRespDict = responseDict
        if saveLoginRespDict.count > 0
        {
//        if let saveLoginRespDict =   responseDict.object(forKey: "address")as? NSDictionary
//        {
            let context : NSManagedObjectContext    =   NSManagedObjectContext.mr_default()
            var LoginRespDataObj : LoginResponse?
            if LoginRespDataObj == nil
            {
                LoginRespDataObj = LoginResponse.mr_createEntity(in: context)!
            }
            if saveLoginRespDict != nil
            {
                if let color   =   saveLoginRespDict.object(forKey: "color") as? String
                {
                    LoginRespDataObj!.color  =   color
                }
                if let colorId   =   saveLoginRespDict.object(forKey: "colorId") as? Int64
                {
                    LoginRespDataObj!.colorId  =   colorId
                }
                if let custCode   =   saveLoginRespDict.object(forKey: "custCode") as? String
                {
                    LoginRespDataObj!.custCode  =   custCode
                }
                if let custId   =   saveLoginRespDict.object(forKey: "custId") as? Int64
                {
                    LoginRespDataObj!.custId  =   custId
                }
                if let customerName   =   saveLoginRespDict.object(forKey: "customerName") as? String
                {
                    LoginRespDataObj!.customerName  =   customerName
                }
                if let make   =   saveLoginRespDict.object(forKey: "make") as? String
                {
                    LoginRespDataObj!.make  =   make
                }
                if let mileage   =   saveLoginRespDict.object(forKey: "mileage") as? String
                {
                    LoginRespDataObj!.mileage  =   mileage
                }
                if let model   =   saveLoginRespDict.object(forKey: "model") as? String
                {
                    LoginRespDataObj!.model  =   model
                }
                if let status   =   saveLoginRespDict.object(forKey: "status") as? Bool
                {
                    LoginRespDataObj!.status  =   status
                }
                if let unitInfId   =   saveLoginRespDict.object(forKey: "unitInfId") as? Int64
                {
                    LoginRespDataObj!.unitInfId  =   unitInfId
                }
                if let unitNum   =   saveLoginRespDict.object(forKey: "unitNum") as? String
                {
                    LoginRespDataObj!.unitNum  =   unitNum
                }
                if let vin   =   saveLoginRespDict.object(forKey: "vin") as? String
                {
                    LoginRespDataObj!.vin  =   vin
                }
                if let year   =   saveLoginRespDict.object(forKey: "year") as? String
                {
                    LoginRespDataObj!.year  =   year
                }
              Utility.saveDefaultContext()
            }//end of saveDict
        }//end of saveLoginRespDict.count
    }
}
