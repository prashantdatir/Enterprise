//
//  LoginHelper.swift
//  sureEcosystem Inspect
//
//  Created by admin on 27/06/18.
//

import UIKit
import SVProgressHUD

class LoginHelper: NSObject {

    
    static var LoginHelperVar : LoginHelper? = LoginHelper()
    public var delegate : ResponseDataDelegate?
    
    class func sharedInstance()->LoginHelper{
        
        if LoginHelperVar == nil {
            self.LoginHelperVar = LoginHelper()
        }
        return self.LoginHelperVar!
    }
    
    
    func LoginHelperToServer(urlToAppend : String, data : NSDictionary){
        
        // let stringData : String = self.getPostDataToSend(dict: data)
        ConnectionManager.callPostMethodWith(url: urlToAppend, postDict: data) { (data, response, error) in
            
            if data != nil{
                
                do {
                    let json : NSDictionary? = (try JSONSerialization.jsonObject(with: data!, options: []) as? NSDictionary)!
                    print(json)
                    
                    //let responseCode : Int64 = json?.value(forKey: "responseCode") as! Int64
                    let errorString : String? = json?.value(forKey: "error") as? String
                    if ((json?.count) != nil && errorString == nil){
                        DispatchQueue.main.async {
                            
                            //let dataDict : NSDictionary? = json?.value(forKey: "data") as? NSDictionary
                            let authString : String? = json?.value(forKey: "access_token") as? String
                            
                            UserDefaults.standard.set(authString as? String, forKey: AUTH_TOKEN_KEY)
                            UserDefaults.standard.synchronize()
                            
                            
                            self.delegate?.didsuccessWithDict(dict : json!)
                        }
                    }else{
                        DispatchQueue.main.async {
                            self.delegate?.didFailWith(tagValue: GET_COMPLETED_EVENT_LIST_API_TAG)
                        }
                    }
                    SVProgressHUD.dismiss()
                } catch let error as NSError {
                    print("Catch Failed to load: \(error.localizedDescription)")
                }
            }
            else{
                DispatchQueue.main.async {
                    self.delegate?.didFailWith(tagValue: GET_COMPLETED_EVENT_LIST_API_TAG)
                }
            }
        }
    }
}
