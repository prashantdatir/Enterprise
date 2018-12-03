//
//  postMethodForCreateEvent.swift
//  Enterprise
//
//  Created by user on 11/21/18.
//  Copyright © 2018 admin. All rights reserved.
//

import UIKit
import CoreData

@available(iOS 10.0, *)
class postMethodForCreateEvent: NSObject {
    
    static var eventListHelper : postMethodForCreateEvent? = postMethodForCreateEvent()
    public var delegate : ResponseDataDelegate?
    
    class func sharedInstance()->postMethodForCreateEvent{
        if eventListHelper == nil {
            self.eventListHelper = postMethodForCreateEvent()
        }
        return self.eventListHelper!
    }
    
    
    func getOrderListFromServer(urlToAppend : String, data : NSDictionary){
        ConnectionManager.callPostMethodWith(url: urlToAppend, postDict: data) { (data, response, error) in
            DispatchQueue.main.async {
                
            
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            let context = appDelegate.persistentContainer.viewContext

            let statusCode : Int? = (response as? HTTPURLResponse)?.statusCode
           
            if (statusCode == 401){
                self.delegate?.didFailWith(tagValue: AUTHORISATION_FAILURE_TAG)
            }else{
                
                //self.delegate?.didFailWith(tagValue: AUTHORISATION_FAILURE_TAG)
                
                if data != nil{
                    do {
                        //self.delegate?.didsuccessWithDict(dict: <#T##NSDictionary#>)
                        
                        if let jsonDict1 = try JSONSerialization.jsonObject(with: data!, options: []) as? NSDictionary{
                            self.delegate?.didsuccessWithDict(dict: jsonDict1)
/*
                            /*
                             {
                             "gL_App_Type": "EM",
                             "eventType": 1,
                             "custData"
                             "address"
                             "callData"
                             "contact"
                             "driver":
                             "location":
                             "note":
                             "unit":
                                    [
                                        "unitDetail : {}
                                    ]
                                    [
                                        "unitNote": {}
                                    ]
                                    "unitRental": {},
                             }
                            */
                            
                            
                            //working calls for saving values in respective models in database
                            CreateEventCustDataInfo.saveCustDataFromAPI(responseDict: jsonDict1)
                            CreateEventAddressInfo.saveAddressDataFromAPI(responseDict: jsonDict1)
                            CreateEventCallData.saveCallDataFromAPI(responseDict: jsonDict1)
                            CreateEventContact.saveContactDataFromAPI(responseDict: jsonDict1)
                            CreateEventDriver.saveDriverDataFromAPI(responseDict: jsonDict1)
                            CreateEventLocation.saveLocationDataFromAPI(responseDict: jsonDict1)
                            CreateEventNote.saveNoteDataFromAPI(responseDict: jsonDict1)
                            
                            
                            var parseData: (key: Any, value: Any)? = nil
                            if let dataArr = jsonDict1.object(forKey: "unit") as? NSArray
                            {
                                print(" for unit parsing")
                                for result in dataArr
                                {
                                    /*
                                    guard let data = try? JSONSerialization.data(withJSONObject: dataArr, options: []) else {
                                            return
                                        }
                                    var val = String(data: data, encoding: .utf8)
                                    print(val)
                                    */
        //if let jsonDict1 = try JSONSerialization.jsonObject(with: data!, options: []) as? NSDictionary{

                                    var identifierr: String
                                    print(result)
                                    let dictR = Dictionary(uniqueKeysWithValues: dataArr.map{ (($0 as AnyObject).key, $0) })
                                    
                                    
                                    let nameLookupDict = dataArr.toDictionaryy{(($0 as AnyObject).key, $0)}
                                    print(nameLookupDict)
                                    
                            //CreateEventUnit.saveUnitDataFromAPI(responseDict: nameLookupDict as NSDictionary)

                                    let data = try JSONSerialization.data(withJSONObject: result, options: [])
                                    let jsonString = NSString(data: data, encoding: String.Encoding.utf8.rawValue)
                                    print(jsonString as Any)
                                    
                                    let unitDict = self.convertToDictionary(text: jsonString as! String)
                                    print(unitDict)
                                   
                                    CreateEventUnit.saveUnitDataFromAPI(responseDict: unitDict as! NSDictionary)
                                    
                                    //working calls
                                CreateEventUnitUnitDetail.saveUnitUnitDetailDataFromAPI(responseDict: unitDict as! NSDictionary)
                                CreateEvetnUnitUnitNote.saveUnitUnitNoteDataFromAPI(responseDict: unitDict as! NSDictionary)
                                   //hide the loader.
                                  //show alert data posted successfully
                                }
                            }//data saved to coredata
                            */
                            
                            }
                        }//error != nil
                        catch let error as NSError
                        {
                            print("Catch Failed to load: \(error.localizedDescription)")
                            self.delegate?.didFailWith(tagValue: 1)
                        }
                    }
                    else
                    {
//                        let alert = UIAlertController(title: APP_NAME, message: "Error Occured: Not correct format", preferredStyle: UIAlertController.Style.alert)
//
//                        let okAction = UIAlertAction(title: "Ok", style: UIAlertAction.Style.default) { (alert) in
//                        }
//
//                        alert.addAction(okAction)
//                        //self.navigationController?.present(alert, animated: true, completion: nil)
                        //show alert there is no data
                    }
                }
            }
        }
    }
    
    
    func convertToDictionary(text: String) -> [String: Any]? {
        if let data = text.data(using: .utf8) {
            do {
                return try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
            } catch {
                print(error.localizedDescription)
            }
        }
        return nil
    }
    
    
}

extension NSArray {
    public func toDictionary<Key: Hashable>(with selectKey: (Element) -> Key) -> [Key:Element] {
        var dict = [Key:Element]()
        for element in self {
            dict[selectKey(element)] = element
        }
        return dict
    }
}
extension Sequence {
    public func toDictionaryy<K: Hashable, V>(_ selector: (Iterator.Element) throws -> (K, V)?) rethrows -> [K: V] {
        var dict = [K: V]()
        for element in self {
            if let (key, value) = try selector(element) {
                dict[key] = value
            }
        }
        
        return dict
    }
}
