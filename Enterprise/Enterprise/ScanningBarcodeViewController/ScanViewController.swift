//
//  ScanViewController.swift
//  Enterprise
//
//  Created by admin on 26/10/18.
//  Copyright © 2018 admin. All rights reserved.
//

import UIKit
import CoreData
class ScanViewController: UIViewController, UITextFieldDelegate, ResponseDataDelegate, QRProtocol {
    func receiveValue(QRData: String) {
        print("")
    }
    
   
    @IBOutlet weak var errorView: UIView!
    @IBOutlet weak var submitBtn: UIButton!
    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var vinTextField: UITextField!
    @IBOutlet weak var licenseTextField: UITextField!
    @IBOutlet weak var questionView: UIView!
    
    @IBAction func didSelectContactBtn(_ sender: Any)
    {
        let url:NSURL = NSURL(string: "telprompt://(800)687-0169")!
        //UIApplication.shared.openURL(url as URL)
        if #available(iOS 10.0, *) {
            UIApplication.shared.open(url as URL, options: [:], completionHandler: nil)
        } else {
            // Fallback on earlier versions
        }
    }
    var isStartInspection : Bool = false
    var setLoginTag : Bool!
    var QRValueReceived  : String?
    override func viewWillAppear(_ animated: Bool) {
        ///* workling code to fetch barcode from database
        let appDelegate =   UIApplication.shared.delegate as! AppDelegate
        if #available(iOS 10.0, *) {
            let context =   appDelegate.persistentContainer.viewContext
            let fetchRequestt = NSFetchRequest<NSFetchRequestResult>(entityName: "BarcodeEntry")
            do{
                let results =   try! context.fetch(fetchRequestt) as! [NSManagedObject]
                for data in results
                {
                    vinTextField.text = data.value(forKey: "scannedData") as? String
                }
            }
        } else {
            // Fallback on earlier versions
        }
        
        if let valueToDisplayQR = QRValueReceived
        {
            print("Value from display = \(valueToDisplayQR)")
            vinTextField.text = QRValueReceived
        }
        

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        vinTextField.delegate   =   self
        licenseTextField.delegate   =   self
    }
    
    override func viewDidLayoutSubviews()
    {
        super.viewDidLayoutSubviews()
        setupUI()
    }
    func setupUI(){
        
        Utility.setupButtonCorner(buttonRcv: submitBtn)
        Utility.setupButtonCorner(buttonRcv: backBtn)
        Utility.setupViewCorner(viewRcv : questionView)
        Utility.setupViewShadow(shadwView: questionView)
    }
    
    @IBAction func backBtnPressed(_ sender: UIButton)
    {
        //self.dismiss(animated: true, completion: nil)
        self.navigationController?.popViewController(animated: true)
        //self.dismiss(animated: true, completion: nil)
        
//        let naviagateVC = storyboard?.instantiateViewController(withIdentifier: "LoginViewController")
//        DispatchQueue.main.async
//            {
//                self.navigationController?.pushViewController(naviagateVC!, animated: true)
//        }
        
        
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        //when vin txtfield selected
        if textField.tag == 1
        {
            licenseTextField.text = ""
            print("vin selected")
        }
        else ////when lic txtfield selected
        {
            vinTextField.text = ""
            print("Lic selected")
        }
    }
   
    @IBAction func submitBtnClicked(_ sender: UIButton)
    {
 
        if vinTextField.isEditing
        {
            setLoginTag = true
        }
        else if licenseTextField.isEditing //lictextfield is slected
        {
            setLoginTag = false
        }
        else
        {
            setLoginTag = true
        }
        if vinTextField.text == "" && licenseTextField.text == ""
        {
            
        
        guard let text = vinTextField.text, !text.isEmpty else {
            let alert = UIAlertController(title: APP_NAME, message: "Please enter the VIN or License Plate numbe", preferredStyle: UIAlertController.Style.alert)
            let okAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default) { (alert) in
            }
            alert.addAction(okAction)
            //self.navigationController?.present(alert, animated: true, completion: nil)
            self.present(alert, animated: true, completion: nil)
            return
        }
        guard let licText = licenseTextField.text, !licText.isEmpty else {
            let alert = UIAlertController(title: APP_NAME, message: "Please enter the VIN or License Plate number", preferredStyle: UIAlertController.Style.alert)
            let okAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default) { (alert) in
            }
            alert.addAction(okAction)
            //self.navigationController?.present(alert, animated: true, completion: nil)
            self.present(alert, animated: true, completion: nil)
            return
        }
    }
        callLoginAPI()
        //logintoVC()
    }
    
    func callLoginAPI()
    {
        var unitValue           =   String()
        var customerID          =   NSInteger()
        var vinPassword         =   String()
        var licPlateNumber      =   String()
        var VerifyType          =   NSInteger()
        if setLoginTag == true
        {
            print("vin call")
            /*"UnitNumber" : "string",
            "CustomerID" : "int",
            "VIN" : "string",
            "LIC" : "string",
            "VerifyType" : int -- values 1 for verify using unit #, 2 verify using VIN, 3 for verify using LIC
            */
            unitValue           =   ""
            customerID          =   1
            vinPassword         =   vinTextField.text!
            licPlateNumber      =   ""
            VerifyType          =   2
        }
        else if setLoginTag == false
        {
            print("lic call")
            unitValue           =   ""
            customerID          =   1
            vinPassword         =   ""
            licPlateNumber      =   licenseTextField.text!
            VerifyType          =   3
        }
        else
        {
            setLoginTag = nil
        }
        let _: String = "\(TimeZone.current)"
        let dict : NSDictionary    =   NSDictionary(objects: [unitValue,customerID,vinPassword,licPlateNumber,VerifyType], forKeys: ["UnitNumber" as NSCopying,"CustomerID" as NSCopying,"VIN" as NSCopying,"LIC" as NSCopying,"VerifyType" as NSCopying])
        self.startActivity(view: self.view)
        let loginHelper = LoginHelper.sharedInstance()
        loginHelper.LoginHelperToServer(urlToAppend: LOGIN_API, data: dict)
        loginHelper.delegate = self
    }
 
    func logintoVC()
    {
        if ((vinTextField!.text ==   "V12345") || ((licenseTextField.text)  ==   "L12345"))
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
            
        }
    }
    //Mark Delegates of API CALL
    func didSuccessWith(tagValue: Int) {
        self.stopActivity(view: self.view)

    }
    
    func didFailWith(tagValue: Int) {
        
//        let title = "Server is Down"
//        let message = "Kindly contact Administrator"
//
//        let newAlert = UIAlertController.init(title: title, message: message, preferredStyle: .alert)
//
//        let OKAction = UIAlertAction.init(title: "OK", style: .default) { (UIAlertAction) in
//        }
//        newAlert.addAction(OKAction)
//        vinTextField.text = ""
//        licenseTextField.text   =   ""
//        DispatchQueue.main.async {
//            self.present(newAlert, animated: true, completion: nil)
//        }
        
        showAlertControllerWithMessage(messageToShow: "Server is Unreachable, Kindly contact Administrator")
       
        self.stopActivity(view: self.view)//self.showAlertControllerWithMessage(messageToShow: LOGIN_ERROR_MESSSAGE)
    }
    
    func didFailWithDict(dict: NSDictionary) {
        print("didFailWithDict \(dict)")
    }
    
    func didsuccessWithDict(dict: NSDictionary) {
        print(dict)
        if  1   ==  dict.value(forKey: "success") as! NSInteger
        {
            print("success")
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
            
            if setLoginTag == true //vin selected
            {
               
                let title = "Please enter the valid VIN number"
                let message = ""
                
                let newAlert = UIAlertController.init(title: title, message: message, preferredStyle: .alert)
                
                let OKAction = UIAlertAction.init(title: "OK", style: .default) { (UIAlertAction) in
                }
                newAlert.addAction(OKAction)
                vinTextField.text = ""
                licenseTextField.text   =   ""
                DispatchQueue.main.async {
                    self.present(newAlert, animated: true, completion: nil)
                }
            }
            else //lic selected
            {
                let title = "Please enter the valid License Plate number"
                let message = ""
                
                let newAlert = UIAlertController.init(title: title, message: message, preferredStyle: .alert)
                
                let OKAction = UIAlertAction.init(title: "OK", style: .default) { (UIAlertAction) in
                }
                newAlert.addAction(OKAction)
                vinTextField.text = ""
                licenseTextField.text   =   ""
                DispatchQueue.main.async {
                    self.present(newAlert, animated: true, completion: nil)
                }
            }
            
        }
    }
    @IBAction func questionMarkClicked(_ sender: UIButton)
    {
        questionView.isHidden = false
    }
    
    @IBAction func questionMarkReleased(_ sender: UIButton)
    {
        questionView.isHidden = true
    }
    
    @IBAction func didSelectBarcodeScanning(_ sender: Any)
    {
        //self.performSegue(withIdentifier: "showBarcodeScannerVC", sender: self)        
        let bvc =   storyboard?.instantiateViewController(withIdentifier: "BarcodeScanViewController") as! BarcodeScanViewController
        self.navigationController?.pushViewController(bvc, animated: true)
    }
}
