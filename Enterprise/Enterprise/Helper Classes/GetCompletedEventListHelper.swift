//
//  GetCompletedEventListHelper.swift
//  sureEcosystem Inspect
//
//  Created by admin on 04/06/18.
//

import UIKit
import SVProgressHUD

class GetCompletedEventListHelper: NSObject {

    static var eventListHelper : GetCompletedEventListHelper? = GetCompletedEventListHelper()
    
    public var delegate : ResponseDataDelegate?
    
    class func sharedInstance()->GetCompletedEventListHelper{
        
        if eventListHelper == nil {
            self.eventListHelper = GetCompletedEventListHelper()
        }
        
        return self.eventListHelper!
    }
    
     func getEventListFromServer(urlToAppend : String, data : NSDictionary){
        
       // let stringData : String = self.getPostDataToSend(dict: data)
        ConnectionManager.callPostMethodWith(url: urlToAppend, postDict: data) { (data, response, error) in
            
            let statusCode : Int? = (response as? HTTPURLResponse)?.statusCode
            
            if (statusCode == 401){
                self.delegate?.didFailWith(tagValue: AUTHORISATION_FAILURE_TAG)
            }else{
             
                if data != nil{
                    do {
                        let json : NSDictionary? = (try JSONSerialization.jsonObject(with: data!, options: []) as? NSDictionary)!
                        
                        print(json)
                        if ((json?.count) != nil){
                            DispatchQueue.main.async {
                                
                                //CompletedEventData.loadCompleteEventData(responseData: json!)
                                self.delegate?.didSuccessWith(tagValue: GET_COMPLETED_EVENT_LIST_API_TAG)
                            }
                        }
                    } catch let error as NSError {
                        print("Catch Failed to load: \(error.localizedDescription)")
                        
                    }
                }
                else{
                    
                    self.delegate?.didFailWith(tagValue: GET_EVENT_LIST_API_TAG)
                }
            }
        }
      
    }
    
     func getPostDataToSend(dict: NSDictionary) -> String {
        
        let contextID : String = dict.object(forKey: KEY_CONTEXT_ID) as! String
        let userID : String = dict.object(forKey: KEY_USER_ID) as! String
        let companyID : String = dict.object(forKey: KEY_COMPANY_ID) as! String
        
        let stringToSend = KEY_CONTEXT_ID + "=" + contextID + "&" +
            KEY_USER_ID + "=" + userID + "&" +
            KEY_COMPANY_ID + "=" + companyID
        
        
        return stringToSend
    }
}
