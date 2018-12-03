//
//  UserResponseToEventHelper.swift
//  sureEcosystem Inspect
//
//  Created by aloha on 07/06/18.
//

import UIKit
import SVProgressHUD

class UserResponseToEventHelper: NSObject {
  
    static var userResponseToEventHelper: UserResponseToEventHelper? = UserResponseToEventHelper()
    
    public var delegate: ResponseDataDelegate?
    
    class func sharedInstance() -> UserResponseToEventHelper {
        
        if userResponseToEventHelper == nil {
           self.userResponseToEventHelper = UserResponseToEventHelper()
        }
    
        return self.userResponseToEventHelper!
    }
    
    func userReponseToEventHelperToServer(urlToAppend: String, data: NSDictionary) {
        
       // let stringData: String = getPostDataToSend(dict: data)
        
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
                                if data is String {
                                    self.delegate?.didFailWith(tagValue: SAVE_ANSWER_API_TAG)
                                }
                                else{
                                    self.delegate?.didSuccessWith(tagValue: SAVE_ANSWER_API_TAG)
                                }
                            }
                        }
                        SVProgressHUD.dismiss()
                    }catch{
                        print("Failed to load data")
                    }
                    
                }else{
                    self.delegate?.didFailWith(tagValue: GET_COMPLETED_EVENT_LIST_API_TAG)
                }
            }
        }
    }
    
    
  func getPostDataToSend(dict: NSDictionary) -> String {
    let  KEY_INSPECTION_ID = "inspectioneventid";
    //let assetID : String = dict.object(forKey: KEY_ASSET_ID) as! String
    let eventID : String = dict.object(forKey: KEY_INSPECTION_ID) as! String
    let userID : String = dict.object(forKey: KEY_USER_ID) as! String
    let companyID : String = dict.object(forKey: KEY_COMPANY_ID) as! String
    
    let stringToSend = KEY_INSPECTION_ID + "=" + eventID + "&" +
        KEY_USER_ID + "=" + userID + "&" +
        KEY_COMPANY_ID + "=" + companyID
    
    return stringToSend
  }
}
