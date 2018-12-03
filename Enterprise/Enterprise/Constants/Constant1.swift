//
//  Constant1.swift
//  WooCommerce
//
//  Created by Sachin on 1/20/17.
//  Copyright © 2017 bitware. All rights reserved.
//

import UIKit

class Constant1: NSObject
{

    static let backColor = "CCDA3C"
    static let lblColor = "42433e"
    static let yelloColor = "ffce2b"
    
    static let kMessageNoInternetConnection = "Server cannot be reached. Please, check your internet connection." as NSString
     static let somthingWrongMsg = "Something went wrong. Please try again."
    static let mainUrl = "http://74.208.12.101/instantliquordelivery/soapapi/core/"
    
    static let projectTitle = "Enterprise Truck Rental" as NSString
    
    static func TrimPrice(Price:NSString)->(String)
    {
    let price: String = Price as String
    let endIndex = price.index(price.endIndex, offsetBy: -2)
    let truncated = price.substring(to: endIndex)
    return truncated
    }
    
    static func TrimZero(Price:NSString)->(String)
    {
        let price: String = Price as String
        let endIndex = price.index(price.endIndex, offsetBy: -5)
        let truncated = price.substring(to: endIndex)
        return truncated
    }
    
    
    
    static func replaceWithStar(Price:String)->(String)
    {
        
        let fString = Price.suffix(2)
        let lString = Price.prefix(2)
        let finalString = "\(lString)******\(fString)"
        return finalString
    }
    
    
   
    //MARK: - verifiy Email fun Code
   static func isValidEmail(str:String?) -> Bool
    {
       let emailRegEx = "[A-Z0-9a-z\\._%+-]+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2,3}"
       // let emailRegEx = "[A-Z0-9a-z._-+]+@[A-Za-z0-9]+\\.[A-Za-z]{2,4}"
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: str)
//        let emailRegEx = "^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$"
//        
//        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
//        return emailTest.evaluate(with: str)
    }
    

        
      static  func containsWhiteSpace(str:NSString?) -> Bool {
            
            // check if there's a range for a whitespace
            let range = str?.rangeOfCharacter(from:.whitespaces)
            
            // returns false when there's no range for whitespace
            if let _ = range {
                return true
            } else {
                return false
            }
        }
    
    
   static func isVadidName(str1:String) -> Bool
    {
        let emailRegEx = "[A-Za-z]+"
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: str1)

    }
    static func isVadidPass(str1:String) -> Bool
    {
        let emailRegEx = "[A-Z0-9a-z]+"
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: str1)
        
    }
    static func isVadidNnumber(str1:String) -> Bool
    {
        let emailRegEx = "[0-9]+"
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: str1)
        
    }
    static func showAlertWithTilte(title : NSString , message : NSString)
    {
        DispatchQueue.main.async(execute: {() -> Void in
            let alertController = UIAlertController(title: title as String, message: message as String, preferredStyle: .alert)
            //  alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: {(_ action: UIAlertAction) -> Void in
            
            
            //    }))
            UIApplication.shared.keyWindow?.rootViewController?.present(alertController, animated: true, completion: {() -> Void in
            })
            
            let when = DispatchTime.now() + 2
            DispatchQueue.main.asyncAfter(deadline: when){
                UIApplication.shared.keyWindow?.rootViewController?.dismiss(animated: true, completion: {
                })
            }
        })
    }
    
}


//NsuserDefault
//UserDefault For Navigation Title
//UserDefaults.standard.set("", forKey: "NavTitle")




//UserDefaults.standard.set("", forKey: "CartId")












//Forword Passing
//let myVC = storyboard?.instantiateViewController(withIdentifier: "ProductDetailVC") as! ProductDetailVC
//myVC.tf_qty.text = "5"





















//MARK: - Alert Function code
//func showAlertWithTilte(title : NSString , message : NSString)
//{
//    let optionMenu = UIAlertController(title: title as String, message: message as String , preferredStyle: .alert)
//    
//    let okAction = UIAlertAction(title: "Ok", style: .default, handler:
//        {
//            (alert: UIAlertAction!) -> Void in
//            print("Ok btn clicked")
//            self.performSegue(withIdentifier: "loginSucess", sender: self )
//            
//    })
//    optionMenu.addAction(okAction)
//    self.present(optionMenu, animated: true, completion: nil)
//}
//MARK: - Image Download Code Swift 3.0
//static func getDataFromUrl(url: URL, completion: @escaping ( data: Data?,   response: URLResponse?, _ error: Error?) -> Void)
//{
//    URLSession.shared.dataTask(with: url)
//    {
//        (data, response, error) in
//        completion(data, response, error)
//        }.resume()
//}
/////////////
//Conatant11.getDataFromUrl(url: checkedUrl)
//{ (data, response, error)  in
//    guard let data = data, error == nil else
//    {
//        return
//    }
//    print(response?.suggestedFilename ?? checkedUrl.lastPathComponent)
//
//    print("Download Finished")
//
//    DispatchQueue.main.async()
//        { () -> Void in
//
//            self.imagevvvvv.image = UIImage(data: data)
//
//    }
//}
////MARK: - convert Data to dictionary fun Code
//static func convertToDictionary(text: String) -> [String: Any]? {
//    if let data = text.data(using: .utf8) {
//        do {
//            return try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
//        } catch {
//            print(error.localizedDescription)
//        }
//    }
//    return nil
//}
