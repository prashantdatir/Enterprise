//
//  LoginViewController.swift
//  Enterprise
//
//  Created by admin on 17/10/18.
//  Copyright © 2018 admin. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, ResponseDataDelegate {
    
    @IBOutlet weak var submitBtn: UIButton!
    @IBOutlet weak var loginTxtfield: UITextField!
    
    @IBAction func didSelectContact(_sender: Any )
    {
        let url:NSURL = NSURL(string: "telprompt://(800)687-0169")!
        //UIApplication.shared.openURL(url as URL)
        if #available(iOS 10.0, *) {
            UIApplication.shared.open(url as URL, options: [:], completionHandler: nil)
        } else {
            // Fallback on earlier versions
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true

    }
    func loginMethod(){
        /*
         {
         "UnitNumber" : "string",   <- 1
         "CustomerID" : "int",      <- 1
         "VIN" : "string",          <- 2
         "LIC" : "string",          <- 3
         "VerifyType" : int -- values 1 for verify using unit #, 2 verify using VIN, 3 for verify using LIC
         }
         */
        let unitValue           =   loginTxtfield.text
        let customerID          =   1
        let vinNumber           =   ""
        let licPlateNumber      =   ""
        let VerifyType          =   1
        
        let dict : NSDictionary    =   NSDictionary(objects: [unitValue as Any,customerID,vinNumber,licPlateNumber,VerifyType], forKeys: ["UnitNumber" as NSCopying,"CustomerID" as NSCopying,"VIN" as NSCopying,"LIC" as NSCopying,"VerifyType" as NSCopying])
        self.startActivity(view: self.view)
        let loginHelper = LoginHelper.sharedInstance()
        loginHelper.LoginHelperToServer(urlToAppend: LOGIN_API, data: dict)
        loginHelper.delegate = self
    }
    override func viewDidLayoutSubviews()
    {
        super.viewDidLayoutSubviews()
        //submitBtn.layer.cornerRadius = submitBtn.frame.size.height / 4
        Utility.setupButtonCorner(buttonRcv: submitBtn)
    }
    @IBAction func submitBtnClicked(_ sender: UIButton) {
        
        
        //API Call
        let eneteredUnitName : String = self.loginTxtfield.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        if((eneteredUnitName.count) < 1){
            let alert = UIAlertController(title: APP_NAME, message: "Enter Unit Number", preferredStyle: UIAlertController.Style.alert)
            let okAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default) { (alert) in
            }
            alert.addAction(okAction)
            self.navigationController?.present(alert, animated: true, completion: nil)
        }
        else
        {
              loginMethod()
        }
        
       
        /*
        //static one
        if loginTxtfield.text   ==   "12345"
        {
            let naviagateVC = storyboard?.instantiateViewController(withIdentifier: "ENMasterViewController")
            DispatchQueue.main.async
            {
                    self.navigationController?.pushViewController(naviagateVC!, animated: true)
            }
        }
        else
        {
            self.showAlertControllerWithMessage(messageToShow: "Enter correct password" )

        }*/
    }
    
    //Mark Delegates of API CALL
    func didSuccessWith(tagValue: Int) {
        self.stopActivity(view: self.view)
    }
    func didFailWith(tagValue: Int) {
        self.stopActivity(view: self.view)
        
//        let title = "Connection Request Timeout"
//        let message = "Do you still want to continue?"
        
        let newAlert = UIAlertController.init(title: ALERT_TITLE, message: ALERT_TITLE_MESSAGE, preferredStyle: .alert)
        
        let retryAction = UIAlertAction.init(title: ALERT_TITLE_YES, style: .default) { (UIAlertAction) in
            let naviagateVC = self.storyboard?.instantiateViewController(withIdentifier: "ENMasterViewController")
            DispatchQueue.main.async
                {
                    self.navigationController?.pushViewController(naviagateVC!, animated: true)
            }
        }
        
        let nextVCAction = UIAlertAction.init(title: ALERT_TITLE_CANCEL, style: .default) { (UIAlertAction) in
            
        }
        newAlert.addAction(retryAction)
        newAlert.addAction(nextVCAction)
        
        DispatchQueue.main.async {
            self.present(newAlert, animated: true, completion: nil)
        }
        
        
    }
    func didFailWithDict(dict: NSDictionary) {
        print("didFailWithDict \(dict)")
    }
    func didsuccessWithDict(dict: NSDictionary) {
        //print(dict)
        if  1   ==  dict.value(forKey: "success") as! NSInteger
        {
            print("success")
            /*
             data =     {
             color = Black;
             colorId = 1;
             **custCode = ERT3399;
             custId = 1;
             customerName = Enterprise;
             *make = 2010;
             mileage = 1000;
             *model = Tata;
             status = 1;
             unitInfId = 1;
             *unitNum = 12345;
             vin = V12345;
             *year = 2017;
             };

             */
           
            let rootDict = dict.object(forKey: "data") as! NSDictionary

            print(rootDict)
            
            //for coredata
            LoginResponse.saveLoginRespDataFromAPI(responseDict : rootDict as NSDictionary)
           
            //let rootDict = dict.object(forKey: "data") as! NSDictionary
            //if let convertedJsonIntoDict = try JSONSerialization.jsonObject(with: data!, options: []) as? NSDictionary
            /*
            for item in rootDict
            {

                let loginObj    =   loginClass()
                
                if (rootDict.value(forKey: "custCode") != nil)
                {
                    var cust = rootDict.value(forKey: "custCode")
                    loginObj.custCode = cust as! String
                }
                if (rootDict.value(forKey: "color") != nil)
                {
                    var color = rootDict.value(forKey: "color")
                    loginObj.color = color as! String
                }
                if (rootDict.value(forKey: "colorId") != nil)
                {
                    var colorId = rootDict.value(forKey: "colorId")
                    loginObj.colorId = colorId as! Int
                }
                if (rootDict.value(forKey: "custId") != nil)
                {
                    var custId = rootDict.value(forKey: "custId")
                    loginObj.custID = custId as! Int
                }
                
                if (rootDict.value(forKey: "customerName") != nil)
                {
                    var customerName = rootDict.value(forKey: "customerName")
                    loginObj.customerName = customerName as! String
                }
                if (rootDict.value(forKey: "make") != nil)
                {
                    var make = rootDict.value(forKey: "make")
                    loginObj.make = make as! String
                }
                if (rootDict.value(forKey: "mileage") != nil)
                {
                    var mileage = rootDict.value(forKey: "mileage")
                    loginObj.mileage = mileage as! String
                }
                if (rootDict.value(forKey: "model") != nil)
                {
                    var model = rootDict.value(forKey: "model")
                    loginObj.model = model as! String
                }
                if (rootDict.value(forKey: "status") != nil)
                {
                    var status = rootDict.value(forKey: "status")
                    loginObj.status = status as! Int
                }
                if (rootDict.value(forKey: "unitInfId") != nil)
                {
                    var unitInfId = rootDict.value(forKey: "unitInfId")
                    loginObj.unitInfId = unitInfId as! Int
                }
                if (rootDict.value(forKey: "unitNum") != nil)
                {
                    var unitNum = rootDict.value(forKey: "unitNum")
                    loginObj.unitNumb = unitNum as! String
                }
                if (rootDict.value(forKey: "vin") != nil)
                {
                    var vin = rootDict.value(forKey: "vin")
                    loginObj.vin = vin as! String
                }
                if (rootDict.value(forKey: "year") != nil)
                {
                    var year = rootDict.value(forKey: "year")
                    loginObj.yearOfManufacture = year as! String
                }
            }*/
                
                
                
//                let obj =   item as NSDictionary
//
//                let customerCode = obj.object(forKey: "custCode") as! NSInteger
//                loginObj.custCode = customerCode


            /*
            if let convertedJsonIntoDict = try JSONSerialization.jsonObject(with: rootDict, options: []) as? NSDictionary
            {
                if (rootDict.object(forKey: "color") != nil)
                {
                    for item in rootDict
                    {
                        print(item)
                    }
                }
            }
            
            
            if let convertedJsonIntoDict = try JSONSerialization.jsonObject(with: rootDict, options: []) as? NSDictionary
            for item in rootDict
            {
                let ob = item as NSDictionary
                
                let loginObj    =   loginClass()
 
                if((dict.value(forKey: "color")) != nil)
                {
                    loginObj.color = dict.allKeys(for: "color") as AnyObject as? String
                    print(loginObj.color)
                }
                
//                let ob =    item as Dictionary
//                //let obj =   item as NSArray
//                let data = item.key
//                let kryy    =   item.value
//                let vinn = ob.allKeys(for: "vin") as Any
//                loginObj.vin    =   vinn as? Int
//                let customerCode = ob.object(forKey: "unitInfId") as! NSInteger
//                loginObj.custCode = customerCode
//                if item.key == "model" as AnyObject
//                {
//                    loginObj.model = item.value as! String
//                }
//                let customerCode = obj.object(forKey: "custCode") as! NSInteger
//                loginObj.custCode = customerCode
                
            }
            */
            let naviagateVC = storyboard?.instantiateViewController(withIdentifier: "ENMasterViewController")
            DispatchQueue.main.async
            {
                self.navigationController?.pushViewController(naviagateVC!, animated: true)
            }
        }
        else
        {
            //self.showAlertControllerWithMessage(messageToShow: dict.value(forKey: "message") as! String)
            self.stopActivity(view: self.view)
            showAlertForInvalidUnit()
            loginTxtfield.text = ""
            /*
            let title = "Wrong Input"
            let message = "Kindly Enter Correct Unit Number"
            
            let newAlert = UIAlertController.init(title: title, message: message, preferredStyle: .alert)
            
            let OKAction = UIAlertAction.init(title: "OK", style: .default) { (UIAlertAction) in
            }
            newAlert.addAction(OKAction)
            loginTxtfield.text = ""
            DispatchQueue.main.async {
                self.present(newAlert, animated: true, completion: nil)
            }
            */
        }
    }
    func showAlertForInvalidUnit(){
        
        let title = "Invalid Unit"
        let message = "You have entered wrong unit number, you can retry with different unit or you can log in with VIN or License plate number"
        
        let newAlert = UIAlertController.init(title: title, message: message, preferredStyle: .alert)
        
        let retryAction = UIAlertAction.init(title: "Retry", style: .default) { (UIAlertAction) in
            
        }
        let nextVCAction = UIAlertAction.init(title: "Log in with VIN or License Plate", style: .default) { (UIAlertAction) in
            
            self.performSegue(withIdentifier: "scanVINorLicensePlateVC", sender: self)
        }
        newAlert.addAction(retryAction)
        newAlert.addAction(nextVCAction)
        
        DispatchQueue.main.async {
            self.present(newAlert, animated: true, completion: nil)
        }
    }
}
