//
//  InspectionQuestionByIDHelper.swift
//  sureEcosystem Inspect
//
//  Created by aloha on 07/06/18.
//

import UIKit
import SVProgressHUD

class InspectionQuestionByIDHelper: NSObject {
    
    static var inspectionQuestionByIDHelper : InspectionQuestionByIDHelper? = InspectionQuestionByIDHelper()
    public var delegate : ResponseDataDelegate?
    
    class func sharedInstance()->InspectionQuestionByIDHelper{
        
        if inspectionQuestionByIDHelper == nil {
            self.inspectionQuestionByIDHelper = InspectionQuestionByIDHelper()
        }
        return self.inspectionQuestionByIDHelper!
    }
    
   
   func inspectionQuestionByIDHelperToServer(urlToAppend : String, data : NSDictionary){
        
       // let stringData : String = self.getPostDataToSend(dict: data)
    ConnectionManager.callPostMethodWith(url: urlToAppend, postDict: data) { (data, response, error) in
        
        let statusCode : Int? = (response as? HTTPURLResponse)?.statusCode
        
        if (statusCode == 401){
            self.delegate?.didFailWith(tagValue: AUTHORISATION_FAILURE_TAG)
        }else{
            
            if data != nil{
                
                do {
                    let json : NSDictionary? = (try JSONSerialization.jsonObject(with: data!, options: []) as? NSDictionary)!
                    //print(json)
                    if ((json?.count) != nil){
                        DispatchQueue.main.async {
                            
                            let data = json?.object(forKey: "data")
                            
                            if data is String {
                                self.delegate?.didFailWith(tagValue: SAVE_ANSWER_API_TAG)
                            }
                            else{
                                //     QuestionData.loadQuestionData(responseData: json!)
                                
                                self.delegate?.didsuccessWithDict(dict : json!)
                            }
                        }
                    }
                    SVProgressHUD.dismiss()
                } catch let error as NSError {
                    print("Catch Failed to load: \(error.localizedDescription)")
                }
            }
            else{
                self.delegate?.didFailWith(tagValue: GET_COMPLETED_EVENT_LIST_API_TAG)
            }
        }
        
        
    }
}
    
    
    
    func getPostDataToSend(dict: NSDictionary) -> String {
        
        //To Add to constant DD
        let keyQuestionId : String = "questionId"
        let KEY_INSPECTION_ID = "inspectioneventid"
        
        let questionId : String = dict.object(forKey: keyQuestionId) as! String
        let eventID : String    = dict.object(forKey: KEY_INSPECTION_ID) as! String
        let companyID : String  = dict.object(forKey: KEY_COMPANY_ID) as! String
        
        let stringToSend = KEY_INSPECTION_ID + "=" + eventID + "&" +
            KEY_COMPANY_ID + "=" + companyID + "&" + keyQuestionId + "=" + questionId
        
        
        return stringToSend
    }
}
