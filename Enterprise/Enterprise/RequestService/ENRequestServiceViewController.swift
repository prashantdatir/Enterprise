
//
//  ENRequestServiceViewController.swift
//  Enterprise
//
//  Created by user on 11/13/18.
//  Copyright © 2018 admin. All rights reserved.
//





import UIKit
import SVProgressHUD
import GoogleMaps
import GooglePlaces
import CoreData
class ENRequestServiceViewController: UIViewController, ResponseDataDelegate, UITextFieldDelegate {
   
    @IBOutlet weak var thirdDynamicTxtfield: UITextField!
    
    @IBOutlet weak var secondDynamicTxtfield: UITextField!
    
    @IBOutlet weak var firstDynamicTxtfield: UITextField!
    
    @IBOutlet weak var DynamictextFieldsViewHeightConstraints: NSLayoutConstraint!
    
    @IBOutlet weak var dynamiTextFieldView: UIView!
    @IBOutlet weak var scheduleViewHeightConstraint: NSLayoutConstraint!
    var threeLineTag = true
    
    public var APIdelegate : ResponseDataDelegate?
   
    var delegate : MenuViewShowHideDelegate?
    var AppGreenColor : UIColor   =   UIColor(red:1.0/255, green: 150.0/255, blue: 93.0/255, alpha: 1)
        var driverMarker:GMSMarker = GMSMarker()
    let locationManager = CLLocationManager()
    var latLongArray:NSMutableArray  = NSMutableArray()

    @IBOutlet weak var hamBurgerHeightConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var customServiceRequestView: UIView!
    
    @IBOutlet weak var serviceRequestTableView: UITableView!
    @IBAction func didSelectHamBtn(_ sender: Any) {
        self.delegate?.showMenu()

    }
    
    
    
    
    @IBOutlet weak var parentView: UIView!
    //request Service labels
    @IBOutlet weak var truckTypeLbl: UILabel!
    @IBOutlet weak var yearLbl: UILabel!
    @IBOutlet weak var makeLbl: UILabel!
    @IBOutlet weak var modelLbl: UILabel!
    @IBOutlet weak var engineLbl: UILabel!
    
    //for Date Picker
    let dateFormatter = DateFormatter()
    let locale = NSLocale.current
    var datePicker : UIDatePicker!
    let toolBar = UIToolbar()
    var dateView    =   UIView()

    //for location
    var location: CLLocation?
    var latitude: CLLocationDegrees?
    var longitude: CLLocationDegrees?
    
    //textfields IBOutlets
    @IBOutlet weak var serviceLocationTxtfields: UITextField!
    @IBOutlet weak var nameTxtfields: UITextField!
    @IBOutlet weak var phoneTxtfields: UITextField!
    @IBOutlet weak var OdometerTxtfields: UITextField!
    @IBOutlet weak var LeaseeNameTxtfields: UITextField!
    @IBOutlet weak var chooseServiceBtnObj: UIButton!
    
    @IBOutlet weak var submitBtn: UIButton!
    @IBOutlet weak var complaintTxtField: UITextView!
    
    @IBOutlet weak var datePickerObj: UIDatePicker!
    @IBOutlet weak var dateContainerView: UIView!
    
    @IBOutlet weak var displayDateLabel: UILabel!
    @IBAction func didSelectDatePicker(_ sender: Any) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = DateFormatter.Style.short
        dateFormatter.timeStyle = DateFormatter.Style.short
        let strDate = dateFormatter.string(from: datePickerObj.date)
        displayDateLabel.text = strDate
    }
    @IBAction func didSelectDateCancel(_ sender: Any) {
        dateContainerView.removeFromSuperview()
    }
    
    @IBAction func didSelectDateContinue(_ sender: Any) {
        dateContainerView.removeFromSuperview()
    }
    
    
    @IBOutlet weak var serviceLaterBtn: UIButton!
    @IBOutlet weak var serviceProviderNoteLabel: UILabel!
    @IBOutlet weak var serviceImmediateBtn: UIButton!
    var serviceButtonStatus : Bool!
    var loginObj = loginClass()

    
    
    var reachability : Reachability! = nil

    
    
    var ENHamBurgerObj  =   ENHamBurgerViewController()
    var ENStoryboardObj =   UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ENHamBurgerViewController") as! ENHamBurgerViewController
    var staticArray = ["Accident","AirLeak","Break Issue","Cooling System","Depth Issue","Engine Lights Issue","Lossing Power","Out Of Fuel","Refer Issue","Stuck / Winch","Tow Issue","Unit wont't start","Pm Inspection","Trailer Other","Other"]

    
    @available(iOS 10.0, *)
    @IBAction func didSelectSubmitBtn(_ sender: Any) {
        
        let eneteredUserName : String = self.nameTxtfields.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let eneteredPhone : String = self.phoneTxtfields.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        let eneteredLocation : String = self.serviceLocationTxtfields.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let eneteredLeasee : String = self.LeaseeNameTxtfields.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let eneteredOdometer : String = self.OdometerTxtfields.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let eneteredService : String = self.chooseServiceBtnObj.titleLabel!.text!.trimmingCharacters(in: .whitespacesAndNewlines)

        
        if((eneteredUserName.count) < 1){
            let alert = UIAlertController(title: APP_NAME, message: "Enter Name", preferredStyle: UIAlertController.Style.alert)
            let okAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default) { (alert) in
            }
            alert.addAction(okAction)
            self.navigationController?.present(alert, animated: true, completion: nil)
            
        }else if((eneteredPhone.count) < 1){
            let alert = UIAlertController(title: APP_NAME, message: "Enter Contact Number", preferredStyle: UIAlertController.Style.alert)
            let okAction = UIAlertAction(title:
            "OK", style: UIAlertAction.Style.default) { (alert) in
            }
            alert.addAction(okAction)
            self.navigationController?.present(alert, animated: true, completion: nil)
        }
        else if((eneteredLocation.count) < 1){
            let alert = UIAlertController(title: APP_NAME, message: "Enter Location", preferredStyle: UIAlertController.Style.alert)
            let okAction = UIAlertAction(title:
            "OK", style: UIAlertAction.Style.default) { (alert) in
            }
            alert.addAction(okAction)
            self.navigationController?.present(alert, animated: true, completion: nil)
        }
        else if((eneteredLeasee.count) < 1){
            let alert = UIAlertController(title: APP_NAME, message: "Enter Leasee Name", preferredStyle: UIAlertController.Style.alert)
            let okAction = UIAlertAction(title:
            "OK", style: UIAlertAction.Style.default) { (alert) in
            }
            alert.addAction(okAction)
            self.navigationController?.present(alert, animated: true, completion: nil)
        }
        else if((eneteredOdometer.count) < 1){
            let alert = UIAlertController(title: APP_NAME, message: "Enter Odometer Number", preferredStyle: UIAlertController.Style.alert)
            let okAction = UIAlertAction(title:
            "OK", style: UIAlertAction.Style.default) { (alert) in
            }
            alert.addAction(okAction)
            self.navigationController?.present(alert, animated: true, completion: nil)
        }
        else
            if((eneteredService.count) < 1){
            let alert = UIAlertController(title: APP_NAME, message: "Enter Service Type", preferredStyle: UIAlertController.Style.alert)
            let okAction = UIAlertAction(title:
            "OK", style: UIAlertAction.Style.default) { (alert) in
            }
            alert.addAction(okAction)
            self.navigationController?.present(alert, animated: true, completion: nil)
        }
        else
                if chooseServiceBtnObj.titleLabel?.text == "Choose a service"  {
            
            let alert = UIAlertController(title: APP_NAME, message: "Choose Service Type", preferredStyle: UIAlertController.Style.alert)
            let okAction = UIAlertAction(title:
            "OK", style: UIAlertAction.Style.default) { (alert) in
            }
            alert.addAction(okAction)
            self.navigationController?.present(alert, animated: true, completion: nil)
//            //when necessary txtfields are filled.
//            let alert = UIAlertController(title: APP_NAME, message: "Data Successfully saved", preferredStyle: UIAlertController.Style.alert)
//            let okAction = UIAlertAction(title:
//            "OK", style: UIAlertAction.Style.default) { (alert) in
//            }
//            alert.addAction(okAction)
//            self.navigationController?.present(alert, animated: true, completion: nil)
        }
        else
        {
            if serviceButtonStatus == true || serviceButtonStatus == false
            {
                callSubmitAPI()
                DispatchQueue.main.async
                {
                    self.view.isUserInteractionEnabled = true
                    SVProgressHUD.dismiss()
                }
            }
            else
            {
                let alert = UIAlertController(title: APP_NAME, message: "Choose Service Schedule Options", preferredStyle: UIAlertController.Style.alert)
                let okAction = UIAlertAction(title:
                "OK", style: UIAlertAction.Style.default) { (alert) in
                }
                alert.addAction(okAction)
                self.present(alert, animated: true, completion: nil)
            }
        }
    }
    
    func fetchAPI()
    {
        /*
        if #available(iOS 10.0, *) {
            let appDelegate =   UIApplication.shared.delegate as! AppDelegate
                let context =   appDelegate.persistentContainer.viewContext
            //CreateEventAddressInfo
            //countryId
            
            //CreateEventCustDataInfo
            //lesseePhoneNumber
            let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "CreateEventCustDataInfo")
            do{
                let results =   try! context.fetch(fetchRequest) as! [NSManagedObject]
                for data in results
                {
                    print(data.value(forKey: "lesseePhoneNumber") as? String as Any)
                    print(data.value(forKey: "eventNumber") as? Int64 as Any)
                    print(data.value(forKey: "lesseeName") as? Int64 as Any)
                }
            }
        } else {
            // Fallback on earlier versions
        }
        */


        /*
         var fetchLoginArray =   LoginResponse.mr_findAll()
         print(fetchLoginArray)
         
         for item in fetchLoginArray!
         {
         
         }
         */
       var custD    =   CreateEventCustDataInfo.mr_findAll()
        print(custD as Any)
        
        
        
        let app = UIApplication.shared.delegate as! AppDelegate
        let context = app.managedObjectContext
        let fetchReq = NSFetchRequest<NSFetchRequestResult>(entityName: "LoginResponse") // Your entity
        var fetchResult = [NSManagedObject]()
        
        let err : NSError! = nil
        do{
            fetchResult = try context.fetch(fetchReq) as! [NSManagedObject]
            //self.objModel = fetchResult
            
        }
        catch{
            print(err)
        }
        
        
        
        //CreateEventCustDataInfo.fetchReques()
    }
    func callSubmitAPI()
    {
        /*
         "EventType": 0,//1
         "ServiceNow": false, //radio btn if immediate = true…. else later =false and date should also be sent
         "CustoemrId": 0, // which is being receive from LOGIN success API
         "UnitNumber": null, // which is being receive from LOGIN success API
         "VIN": null, // which is being receive from LOGIN success API
         "UnitInfId": 0, // which is being receive from LOGIN success API
         "TypeOfCaller": 0, //1 should b sent to API as value
         "ContactName": null, //
         "Phone": null,
         "Extension": null, // for time being not needed to send
         "ServiceLocation": null, // address
         "Lat": null,
         "Lang": null,
         "MeterReading": 0,  //odometer
         "LeaseeName": null, //leasename
         "ServiceType": null, // GET API- string
         "ServiceTypeId": 0 //   GET API-  ID

        */
        let serviceNow      =   serviceButtonStatus
        let customerID      =   1
        let unitNumber      =   12345
        let vinNumber       =   "V12345"
        let unitInfId       =   1
        let typeOfCaller    =   0
        let contactName     =   nameTxtfields.text
        let phone           =   phoneTxtfields.text
        let Extension       =   "extensionData"
        let serviceLocation =   serviceLocationTxtfields.text
        let lat             =   latitude
        let long            =   longitude
        let meterReading    =   OdometerTxtfields.text
        let leaseeName      =   LeaseeNameTxtfields.text
        let serviceType     =   chooseServiceBtnObj.titleLabel?.text
        let serviceTypeId   =   21
        
        
        let dict : NSDictionary    =   NSDictionary(objects: [serviceNow as Any,customerID,unitNumber,vinNumber,unitInfId,typeOfCaller,contactName,phone,Extension,serviceLocation,lat,long,meterReading,leaseeName,serviceType,serviceTypeId], forKeys: ["ServiceNow" as NSCopying,"CustomerID" as NSCopying,"UnitNumber" as NSCopying,"VIN" as NSCopying,"UnitInfId" as NSCopying, "TypeOfCaller" as NSCopying,"ContactName" as NSCopying,"Phone" as NSCopying, "Extension" as NSCopying,"ServiceLocation" as NSCopying,"Lat" as NSCopying,"Lang" as NSCopying,"MeterReading" as NSCopying,"LeaseeName" as NSCopying,"ServiceType" as NSCopying, "ServiceTypeId" as NSCopying])
        self.startActivity(view: self.view)
        
        
        
        
        if #available(iOS 10.0, *) {
            let createEventObj = postMethodForCreateEvent.sharedInstance()
            createEventObj.delegate = self
            createEventObj.getOrderListFromServer(urlToAppend: CREATE_EVENT_API, data: dict)
        } else {
            // Fallback on earlier versions
        }
        DispatchQueue.main.async {
            self.view.isUserInteractionEnabled = true
            SVProgressHUD.dismiss()
        }
        
    }
    
    func didSuccessWith(tagValue: Int) {
        
        print("success with tag")
        if tagValue == 1
        {
            showAlertControllerWithMessage(messageToShow: "Data failed to load ")
        }
        
    }
    
    func didFailWith(tagValue: Int) {
       
        print("fail")
    }
    
    func didFailWithDict(dict: NSDictionary) {
       
        print("fail with dict")
    }
    
    func didsuccessWithDict(dict: NSDictionary) {
       
        print("success with dict")
        self.startActivity(view: view)
            //working calls for saving values in respective models in database
            CreateEventCustDataInfo.saveCustDataFromAPI(responseDict: dict)
            CreateEventAddressInfo.saveAddressDataFromAPI(responseDict: dict)
            CreateEventCallData.saveCallDataFromAPI(responseDict: dict)
            CreateEventContact.saveContactDataFromAPI(responseDict: dict)
            CreateEventDriver.saveDriverDataFromAPI(responseDict: dict)
            CreateEventLocation.saveLocationDataFromAPI(responseDict: dict)
            CreateEventNote.saveNoteDataFromAPI(responseDict: dict)
            
            
            var parseData: (key: Any, value: Any)? = nil
            if let dataArr = dict.object(forKey: "unit") as? NSArray
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
                    do {
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
                        
                        self.stopActivity(view: view)
                        
                    }
                    catch{
                        print("Error occured")
                    }
                    
                }
            }
        //showAlertControllerWithMessage(messageToShow: "Event Created Successfully")
        
        let newAlert = UIAlertController.init(title: APP_NAME, message: "Event Created Successfully.Do you want to naviagte to LET section", preferredStyle: .alert)
        
        let retryAction = UIAlertAction.init(title: ALERT_TITLE_YES, style: .default) { (UIAlertAction) in
            let naviagateVC = self.storyboard?.instantiateViewController(withIdentifier: "ENCheckExisitingServiceViewController")
            DispatchQueue.main.async
                {
                    self.navigationController?.pushViewController(naviagateVC!, animated: true)
                    //self.present(naviagateVC!, animated: true, completion: nil)
            }
        }
        
        let nextVCAction = UIAlertAction.init(title: ALERT_TITLE_CANCEL, style: .default) { (UIAlertAction) in
            
        }
        newAlert.addAction(retryAction)
        newAlert.addAction(nextVCAction)
        
        DispatchQueue.main.async {
            self.present(newAlert, animated: true, completion: nil)
        }
 
        nameTxtfields.text = ""
        phoneTxtfields.text =   ""
        OdometerTxtfields.text  =   ""
        LeaseeNameTxtfields.text = ""
        chooseServiceBtnObj.titleLabel?.text = ""
        
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
    
    
    @IBAction func didSelectServiceLater(_ sender: Any) {
        //view.insertSubview(dateContainerView, at: 1)
        serviceButtonStatus = false

        serviceLaterBtn.backgroundColor =   AppGreenColor
        serviceLaterBtn.titleLabel?.textColor   =   UIColor.white
        serviceProviderNoteLabel.isHidden = true

        serviceImmediateBtn.backgroundColor =   UIColor.white
        serviceImmediateBtn.titleLabel?.textColor   =   UIColor.black
        UIView.animate(withDuration: 0.3) {
            self.view.addSubview(self.dateContainerView)

        }
        
        dateContainerView.translatesAutoresizingMaskIntoConstraints = false

        
        let horizontalConstraint = NSLayoutConstraint(item: dateContainerView, attribute: NSLayoutConstraint.Attribute.centerX, relatedBy: NSLayoutConstraint.Relation.equal, toItem: view, attribute: NSLayoutConstraint.Attribute.centerX, multiplier: 1, constant: 0)

        let verticalConstraint  =   NSLayoutConstraint(item: dateContainerView, attribute: NSLayoutConstraint.Attribute.centerY, relatedBy: NSLayoutConstraint.Relation.equal, toItem: view, attribute: NSLayoutConstraint.Attribute.centerY, multiplier: 1, constant: 0)
        
        let bottomConstraint    =   NSLayoutConstraint(item: dateContainerView, attribute: NSLayoutConstraint.Attribute.bottom, relatedBy: NSLayoutConstraint.Relation.equal, toItem: view, attribute: NSLayoutConstraint.Attribute.bottom, multiplier: 1, constant: 0)
        
        let topConstraint    =   NSLayoutConstraint(item: dateContainerView, attribute: NSLayoutConstraint.Attribute.top, relatedBy: NSLayoutConstraint.Relation.equal, toItem: view, attribute: NSLayoutConstraint.Attribute.top, multiplier: 1, constant: 0)
        NSLayoutConstraint.activate([horizontalConstraint,verticalConstraint,bottomConstraint,topConstraint])
        
        /*
        let horizontalConstraint = dateContainerView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        let verticalConstraint = dateContainerView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        let widthConstraint = dateContainerView.widthAnchor.constraint(equalToConstant: view.frame.size.width)
        let heightConstraint = dateContainerView.heightAnchor.constraint(equalToConstant: view.frame.size.height)
        NSLayoutConstraint.activate([horizontalConstraint,verticalConstraint,widthConstraint,heightConstraint])
         */
        
        /*
        NSLayoutConstraint(item: dateContainerView, attribute: NSLayoutConstraint.Attribute.leading, relatedBy: NSLayoutConstraint.Relation.equal, toItem: view, attribute: NSLayoutConstraint.Attribute.leadingMargin, multiplier: 1.0, constant: 0).isActive = true

        NSLayoutConstraint(item: dateContainerView, attribute: NSLayoutConstraint.Attribute.bottom, relatedBy: NSLayoutConstraint.Relation.equal, toItem: view, attribute: NSLayoutConstraint.Attribute.bottomMargin, multiplier: 1.0, constant: 0).isActive = true
         */
        
        //doDatePicker()
    }
 
    @IBAction func didSelectServiceImmediate(_ sender: Any) {
        
        serviceImmediateBtn.backgroundColor =   AppGreenColor
        serviceImmediateBtn.titleLabel?.textColor   =   UIColor.white
        
        serviceLaterBtn.backgroundColor =   UIColor.white
        serviceLaterBtn.titleLabel?.textColor   =   UIColor.black
        
        serviceButtonStatus = true
        serviceProviderNoteLabel.isHidden = false
        serviceProviderNoteLabel.text = "Note: A service provider will be assigned and dispatch as soon as possible to your requested location above"
        //fetchAPI()
    }
    
    func doDatePicker(){
        
        
        dateView    =   UIView(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 400))
        self.dateView.backgroundColor   =   UIColor.lightGray
        dateView.center =   view.center
        view.addSubview(dateView)
        
        
        // DatePicker
        self.datePicker = UIDatePicker(frame:CGRect(x: 0, y: 10, width: self.view.frame.size.width, height: 200))
        self.datePicker?.backgroundColor = UIColor.darkGray
        self.datePicker?.datePickerMode = UIDatePicker.Mode.dateAndTime
        datePicker.center = dateView.center
        dateView.addSubview(self.datePicker)
        
        // ToolBar
        
        toolBar.barStyle = .default
        toolBar.isTranslucent = true
        toolBar.tintColor = UIColor(red: 92/255, green: 216/255, blue: 255/255, alpha: 1)
        toolBar.sizeToFit()
        
        // Adding Button ToolBar
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(ENRequestServiceViewController.doneClick))
        let spaceButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(ENRequestServiceViewController.cancelClick))
        toolBar.setItems([cancelButton, spaceButton, doneButton], animated: true)
        toolBar.isUserInteractionEnabled = true
        
        self.dateView.addSubview(toolBar)
        self.toolBar.isHidden = false
        
        
    }

    @objc func doneClick() {
        let dateFormatter1 = DateFormatter()
        dateFormatter1.dateStyle = .medium
        dateFormatter1.timeStyle = .none
        //self.datePicker.resignFirstResponder()
        datePicker.isHidden = true
        self.toolBar.isHidden = true
    }
    
    @objc func cancelClick() {
        datePicker.isHidden = true
        self.toolBar.isHidden = true
    }
    
    @IBAction func didSelecrtThreeLineOption(_ sender: Any)
    {
        let controller = storyboard!.instantiateViewController(withIdentifier: "ENHamBurgerViewController") as! ENHamBurgerViewController
        if threeLineTag == true
        {
            threeLineTag = false
            self.add(asChildViewController: controller)
        }
        else
        {
            self.threeLineTag = true
            remove(asChildViewController: controller)
        }
    }
    private func add(asChildViewController viewController: UIViewController) {
        addChild(viewController)
        view.addSubview(viewController.view)
        viewController.view.frame = view.bounds
        viewController.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        viewController.didMove(toParent: self)
    }
    private func remove(asChildViewController viewController: UIViewController) {
        viewController.willMove(toParent: nil)
        viewController.view.removeFromSuperview()
        viewController.removeFromParent()
    }
    

    var visualEffectView:UIVisualEffectView!
    
    let cardHeight:CGFloat = 600
    let cardHandleAreaHeight:CGFloat = 65
    
    var cardVisible = false
    var nextState:CardState {
        return cardVisible ? .collapsed : .expanded
    }
    
    var animationProgressWhenInterrupted:CGFloat = 0
    var carTag = true
    var fetchServiceAPIFieldsArray  =   [fetchServices]()
    
    
    override func viewWillAppear(_ animated: Bool)
    {
        navigationItem.hidesBackButton  =   true
        setbackGroundLayout()
        self.view.layoutIfNeeded()
        getMethodOfServiceListAPI()
        
        serviceLaterBtn.backgroundColor =   UIColor.white
        serviceLaterBtn.titleLabel?.textColor   =   UIColor.black
        
        serviceImmediateBtn.backgroundColor =   UIColor.white
        serviceImmediateBtn.titleLabel?.textColor   =   UIColor.black
        
        serviceProviderNoteLabel.isHidden   =   true
        self.viewDidLayoutSubviews()
     
        //serviceProviderNoteLabel.isHidden   =   true
        
        //dynamiTextFieldView.isHidden = true
        
        
//        makeLbl.text = loginObj.make
//        modelLbl.text = loginObj.model
        
    }
    
    
    
    @IBAction func didSelectServiceType(_ sender: Any)
    {
        customServiceRequestView.isHidden   =   false
        serviceRequestTableView.isHidden    =   false
        serviceRequestTableView.tag =   99
    }
    
   func getMethodOfServiceListAPI()
    {
        // Define server side script URL
        let customURL = "/event/services"
        let scriptUrl = BASE_URL + customURL
        //"http://192.168.8.225:4400/api"
        // Add one parameter
        let urlWithParams = scriptUrl
        let myUrl = NSURL(string: urlWithParams);
        
        let request = NSMutableURLRequest(url:myUrl! as URL);
        
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request as URLRequest)
        {
            data, response, error in
            
            if error != nil
            {
                print("error=\(error)")
                return
            }
            let responseString = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)
            //print("responseString = \(responseString)")
            do
            {
                
                let rootdictionary = try! JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as! NSDictionary
                
                let rootarray = rootdictionary.object(forKey: "data") as! NSArray
                //if let convertedJsonIntoDict = try JSONSerialization.jsonObject(with: data!, options: []) as? NSDictionary
                for item in rootarray
                {
                    
                    let fetchServicesObj    =   fetchServices()
                    let obj =   item as! NSDictionary
                    
                    let firstNameValue = obj.object(forKey: "troubleCategoryDesc") as! String
                    fetchServicesObj.troubleCategoryDescName = firstNameValue
                    print(firstNameValue)
                    self.fetchServiceAPIFieldsArray.append(fetchServicesObj)
                    DispatchQueue.main.sync {
                        self.serviceRequestTableView.reloadData()
                    }
                }
            }
            catch let error as NSError
            {
                print(error.localizedDescription)
                
//                let newAlert = UIAlertController.init(title: ALERT_GET_TITLE, message: ALERT_TITLE_MESSAGE, preferredStyle: .alert)
//
//                let retryAction = UIAlertAction.init(title: ALERT_TITLE_YES, style: .default) { (UIAlertAction) in
//                    let naviagateVC = self.storyboard?.instantiateViewController(withIdentifier: "ENMasterViewController")
//                    DispatchQueue.main.async
//                        {
//                            self.navigationController?.pushViewController(naviagateVC!, animated: true)
//                    }
//                }
                
            }
            
        }
        
        task.resume()
       
    }
   
    func setbackGroundLayout()
    {
        self.serviceLocationTxtfields.layer.shadowColor  =   UIColor.lightGray.cgColor
        self.serviceLocationTxtfields.layer.shadowOffset =   CGSize(width: 5, height: 5)
        self.serviceLocationTxtfields.layer.shadowOpacity    =   1
        self.serviceLocationTxtfields.layer.shadowRadius =   4
        self.serviceLocationTxtfields.layer.masksToBounds    =   false
        
        self.nameTxtfields.layer.shadowColor  =   UIColor.lightGray.cgColor
        self.nameTxtfields.layer.shadowOffset =   CGSize(width: 5, height: 5)
        self.nameTxtfields.layer.shadowOpacity    =   1
        self.nameTxtfields.layer.shadowRadius =   4
        self.nameTxtfields.layer.masksToBounds    =   false
        
        self.phoneTxtfields.layer.shadowColor  =   UIColor.lightGray.cgColor
        self.phoneTxtfields.layer.shadowOffset =   CGSize(width: 5, height: 5)
        self.phoneTxtfields.layer.shadowOpacity    =   1
        self.phoneTxtfields.layer.shadowRadius =   4
        self.phoneTxtfields.layer.masksToBounds    =   false
        
        self.OdometerTxtfields.layer.shadowColor  =   UIColor.lightGray.cgColor
        self.OdometerTxtfields.layer.shadowOffset =   CGSize(width: 5, height: 5)
        self.OdometerTxtfields.layer.shadowOpacity    =   1
        self.OdometerTxtfields.layer.shadowRadius =   4
        self.OdometerTxtfields.layer.masksToBounds    =   false
        
        self.LeaseeNameTxtfields.layer.shadowColor  =   UIColor.lightGray.cgColor
        self.LeaseeNameTxtfields.layer.shadowOffset =   CGSize(width: 5, height: 5)
        self.LeaseeNameTxtfields.layer.shadowOpacity    =   1
        self.LeaseeNameTxtfields.layer.shadowRadius =   4
        self.LeaseeNameTxtfields.layer.masksToBounds    =   false
        
        self.complaintTxtField.layer.shadowColor  =   UIColor.lightGray.cgColor
        self.complaintTxtField.layer.shadowOffset =   CGSize(width: 5, height: 5)
        self.complaintTxtField.layer.shadowOpacity    =   1
        self.complaintTxtField.layer.shadowRadius =   4
        self.complaintTxtField.layer.masksToBounds    =   false

        serviceProviderNoteLabel.backgroundColor = self.view.backgroundColor
        serviceProviderNoteLabel.layer.shadowOffset  =   CGSize(width: 5, height: 5)
        serviceProviderNoteLabel.layer.shadowOpacity = 1
        serviceProviderNoteLabel.layer.shadowRadius = 4.0
        serviceProviderNoteLabel.layer.shadowColor = UIColor.lightGray.cgColor
        serviceProviderNoteLabel.layer.cornerRadius = 3
 
        //Utility.setupButtonCorner(buttonRcv: chooseServiceBtnObj)
        Utility.setupButtonCorner(buttonRcv: serviceImmediateBtn)
        Utility.setupButtonCorner(buttonRcv: serviceLaterBtn)

        
        chooseServiceBtnObj.backgroundColor = self.view.backgroundColor
        chooseServiceBtnObj.layer.shadowOffset  =   CGSize(width: 5, height: 5)
        chooseServiceBtnObj.layer.shadowOpacity = 1
        chooseServiceBtnObj.layer.shadowRadius = 4.0
        chooseServiceBtnObj.layer.shadowColor = UIColor.lightGray.cgColor
        chooseServiceBtnObj.layer.cornerRadius = 3
        
        firstDynamicTxtfield.backgroundColor = self.view.backgroundColor
        firstDynamicTxtfield.layer.shadowOffset  =   CGSize(width: 5, height: 5)
        firstDynamicTxtfield.layer.shadowOpacity = 1
        firstDynamicTxtfield.layer.shadowRadius = 4.0
        firstDynamicTxtfield.layer.shadowColor = UIColor.lightGray.cgColor
        firstDynamicTxtfield.layer.cornerRadius = 3
        
        secondDynamicTxtfield.backgroundColor = self.view.backgroundColor
        secondDynamicTxtfield.layer.shadowOffset  =   CGSize(width: 5, height: 5)
        secondDynamicTxtfield.layer.shadowOpacity = 1
        secondDynamicTxtfield.layer.shadowRadius = 4.0
        secondDynamicTxtfield.layer.shadowColor = UIColor.lightGray.cgColor
        secondDynamicTxtfield.layer.cornerRadius = 3
        
        thirdDynamicTxtfield.backgroundColor = self.view.backgroundColor
        thirdDynamicTxtfield.layer.shadowOffset  =   CGSize(width: 5, height: 5)
        thirdDynamicTxtfield.layer.shadowOpacity = 1
        thirdDynamicTxtfield.layer.shadowRadius = 4.0
        thirdDynamicTxtfield.layer.shadowColor = UIColor.lightGray.cgColor
        thirdDynamicTxtfield.layer.cornerRadius = 3
        
        
    }
    override func viewDidLayoutSubviews()
    {
        super.viewDidLayoutSubviews()
        //submitBtn.layer.cornerRadius = submitBtn.frame.size.height / 4
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        //self.view.addGestureRecognizer(UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing(_:))))
        //self.chooseServiceBtnObj.titleLabel?.adjustsFontSizeToFitWidth = true
        
        
        serviceLaterBtn.backgroundColor =   UIColor.white
        serviceLaterBtn.titleLabel?.textColor   =   UIColor.black
        
        serviceImmediateBtn.backgroundColor =   UIColor.white
        serviceImmediateBtn.titleLabel?.textColor   =   UIColor.black
        
        serviceProviderNoteLabel.isHidden   =   true
        self.viewDidLayoutSubviews()
        
        
        
        
        HideDynamicView()
        reachability = Reachability()
        phoneTxtfields.delegate = self
        
        let attributes = [NSAttributedString.Key.foregroundColor: UIColor.black,
                          .font : UIFont.systemFont(ofSize: 14, weight: .medium)]
        
        nameTxtfields.attributedPlaceholder = NSAttributedString(string: "Enter Name", attributes:attributes)
        phoneTxtfields.attributedPlaceholder = NSAttributedString(string: "Enter Phone Number", attributes:attributes)
        serviceLocationTxtfields.attributedPlaceholder = NSAttributedString(string: "Enter Service location", attributes:attributes)
        OdometerTxtfields.attributedPlaceholder = NSAttributedString(string: "Enter Odometer", attributes:attributes)
        LeaseeNameTxtfields.attributedPlaceholder = NSAttributedString(string: "Enter Leasse Name", attributes:attributes)
        firstDynamicTxtfield.attributedPlaceholder = NSAttributedString(string: "Enter Details", attributes:attributes)
        secondDynamicTxtfield.attributedPlaceholder = NSAttributedString(string: "Enter Details", attributes:attributes)
        thirdDynamicTxtfield.attributedPlaceholder = NSAttributedString(string: "Enter Details", attributes:attributes)

        
//        var results: [LoginResponse] = []
//        MagicalRecord.save(blockAndWait: { (localContext) in
//
////            let predicate: NSPredicate? = NSPredicate(format: "abc == %@ AND def == %@", abc, def)
////            results = Unit.mr_findAll(with: predicate, in:localContext) as! [Unit]
//        })
        
       
        
        
        //datePickerObj.addTarget(self, action: #selector(ENRequestServiceViewController.datePickerValueChanged), for: UIControl.Event.valueChanged)
        serviceRequestTableView.delegate =  self
        serviceRequestTableView.dataSource  =   self
        serviceRequestTableView.layer.cornerRadius  =   2.0
        serviceRequestTableView.layer.masksToBounds =   true
        serviceRequestTableView.layer.borderWidth   =   1.0
        serviceRequestTableView.layer.borderColor   =   UIColor.lightGray.cgColor
        //self.serviceRequestTableView?.register(ENServiceRequestTableCell.self, forCellReuseIdentifier: "cell")

        let locationManager = CLLocationManager()

        self.locationManager.distanceFilter = 50
        self.locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
        self.locationManager.requestAlwaysAuthorization()
        self.locationManager.requestWhenInUseAuthorization()
        self.locationManager.startUpdatingLocation()
        self.locationManager.delegate = self

        dateContainerView.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        datePickerObj.backgroundColor   =   UIColor.white.withAlphaComponent(1.0)
        
        
        Utility.setupButtonCorner(buttonRcv: submitBtn)

    }
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let maxLength = 10
        let currentString: NSString = phoneTxtfields.text! as NSString
        let newString: NSString =
            currentString.replacingCharacters(in: range, with: string) as NSString
        return newString.length <= maxLength
    }
    
    @objc func datePickerValueChanged (datePicker: UIDatePicker) {
       
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = DateFormatter.Style.short
        dateFormatter.timeStyle = DateFormatter.Style.short
        let strDate = dateFormatter.string(from: datePicker.date)
        displayDateLabel.text = strDate
        
    }
    func touchesBegan(_ touches: Set<AnyHashable>, with event: UIEvent) {
        var touch = touches.first as? UITouch
        if touch?.view?.tag != 99 {
            serviceRequestTableView.isHidden    =   true
            customServiceRequestView.isHidden   =   true
        }
    }
    
    func hideKeyboard() {
        serviceRequestTableView.endEditing(true)
        serviceRequestTableView.isHidden    =   true
        customServiceRequestView.isHidden   =   true
        
    }
    var formatedString = String()
    var addressDictGeo = GMSAddress()
    var zoomLevel: Float = 15.0

    private func getAddressFromLocation(_ coordinate: CLLocationCoordinate2D) {
        
        let geocoder = GMSGeocoder()
        geocoder.accessibilityLanguage = "en-US"
        geocoder.reverseGeocodeCoordinate(coordinate) { response, error in
            guard let address = response?.firstResult(), let lines = address.lines else {
                return
            }
            self.formatedString = lines.joined(separator: "\n")
            
            self.addressDictGeo = address
            UIView.animate(withDuration: 0.25) {
                self.view.layoutIfNeeded()
            }
        }
    }
   
    func HideDynamicView()
    {
        dynamiTextFieldView.isHidden = true
        DynamictextFieldsViewHeightConstraints.constant = 0
    }
    func showDynamicView()
    {
        dynamiTextFieldView.isHidden = false
        DynamictextFieldsViewHeightConstraints.constant = 125

    }
}

extension ENRequestServiceViewController : CLLocationManagerDelegate
{
    //Location Manager delegates
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        location = locations.last
        
        let camera = GMSCameraPosition.camera(withLatitude: (location?.coordinate.latitude)!, longitude:(location?.coordinate.longitude)!, zoom:14)
        
      
        latitude = (locationManager.location?.coordinate.latitude)!
        longitude = (locationManager.location?.coordinate.longitude)!
        location = CLLocation(latitude: latitude!, longitude: longitude!) //changed!!!
        CLGeocoder().reverseGeocodeLocation(location!, completionHandler: {(placemarks, error) -> Void in
            if error != nil {
                return
            }else if let country = placemarks?.first?.country,
                let city = placemarks?.first?.addressDictionary {
                
                let jsonData = try? JSONSerialization.data(withJSONObject: city, options: [])
                let jsonString = String(data: jsonData!, encoding: .utf8)
                print(jsonString)
                
                
                let srNo        =   placemarks?.first?.name
                let subLocality =   placemarks?.first?.subLocality
                let locality    =   placemarks?.first?.locality
                let postalCode  =   placemarks?.first?.postalCode
                
                print(country)
                self.serviceLocationTxtfields.text = srNo! + "," + subLocality! + "," + locality! + "," + postalCode!
            }
            else {
            }
        })
        self.locationManager.stopUpdatingLocation()
        
    }

 func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
    switch status
    {
        case .restricted:
            print("Location access was restricted.")
        case .denied:
            print("User denied access to location.")
            let alertController = UIAlertController(title: NSLocalizedString("You denied location privacy", comment: ""), message: NSLocalizedString("To enable go to settings and enable it again", comment: ""), preferredStyle: .alert)
            
            let cancelAction = UIAlertAction(title: NSLocalizedString("Cancel", comment: ""), style: .cancel, handler: nil)
            let settingsAction = UIAlertAction(title: NSLocalizedString("Settings", comment: ""), style: .default, handler: { action in
                if let aString = URL(string: UIApplication.openSettingsURLString) {
                    UIApplication.shared.openURL(aString)
                }
            })
            
            alertController.addAction(cancelAction)
            alertController.addAction(settingsAction)
            
            present(alertController, animated: true)

        case .notDetermined:
            print("Location status not determined.")
        case .authorizedAlways: fallthrough
        case .authorizedWhenInUse:
            print("Location status is OK.")
            print("Authorize.")
        break
    }
}

func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
    locationManager.stopUpdatingLocation()
    print("Error: \(error)")
    }
}

extension ENRequestServiceViewController: UITableViewDelegate, UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if reachability.isReachable
        {
            return fetchServiceAPIFieldsArray.count
        }
        else
        {
            return staticArray.count
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell    =   serviceRequestTableView.dequeueReusableCell(withIdentifier: "cell") as! ENServiceRequestTableCell
        
        if reachability.isReachable
        {
            cell.serviceRequestLabel.text   =   fetchServiceAPIFieldsArray[indexPath.row].troubleCategoryDescName
        }
        else//internet not reachable
        {
            cell.serviceRequestLabel.text   =   staticArray[indexPath.row]
        }
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        serviceRequestTableView.isHidden    =   true
        customServiceRequestView.isHidden   =   true
        if reachability.isReachable
        {
            //chooseServiceBtnObj.titleLabel?.text    =  fetchServiceAPIFieldsArray[indexPath.row].troubleCategoryDescName
            let titleBtn = "Requested services :" + fetchServiceAPIFieldsArray[indexPath.row].troubleCategoryDescName
            //chooseServiceBtnObj.titleLabel?.text = "\(titleBtn)"
            chooseServiceBtnObj.setTitle(titleBtn, for: .normal)
            if fetchServiceAPIFieldsArray[indexPath.row].troubleCategoryDescName == "Tire Issue"
            {
                //dynamiTextFieldView.isHidden = false
                showDynamicView()
                print("show the radio btns")
            }
            else
            {
                //dynamiTextFieldView.isHidden = true
                HideDynamicView()
            }
        }
        else //when internt not reachable
        {
            chooseServiceBtnObj.titleLabel?.text    =   staticArray[indexPath.row]
            if staticArray[indexPath.row] == "Tow Issue"
            {
                dynamiTextFieldView.isHidden = false
                showDynamicView()
                print("show the radio btns")
            }
            else
            {
                dynamiTextFieldView.isHidden = true
                HideDynamicView()
            }
        }
    }
}

