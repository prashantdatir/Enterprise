//
//  ConstantData.swift
//  The Home Chef
//
//  Created by Sachin on 2/17/17.
//  Copyright © 2017 bitware. All rights reserved.
//

import UIKit

class ConstantData: NSObject
{
    static let currency = "AED "
    static let greenColor = "#49B34B"
    static let lblColor = "94F111"
    static let yelloColor = "#FEC720"
    static var loader1: UIImageView!
    static var view1,view : UIView!
    
    static let projectTitle = "Enterprise Truck Rental" as NSString
    
    static func showIndicator1(view:UIView)
    {
        self.view = view
        self.view1 = UIView(frame: UIScreen.main.bounds)
        self.loader1 = UIImageView(frame: UIScreen.main.bounds)
        self.loader1.frame.size.width = 100
        self.loader1.frame.size.height = 100
        self.loader1.center = view1.center
        self.view1.backgroundColor = UIColor.clear
        self.view1.addSubview(loader1)
      //  self.loader1.image = UIImage.gif(name: "loading-orange")
        
        DispatchQueue.main.async
            {
                
                self.view.addSubview(view1)
                self.view.isUserInteractionEnabled = false
                
        }
        
        
    }
    static func showIndicator(view:UIView)
    {
      
        self.view = view
        let screenSize = UIScreen.main.bounds
        let screenWidth = screenSize.width
        let screenHeight = screenSize.height
        
        
        self.view1 = UIView(frame: UIScreen.main.bounds)
        
        self.loader1 = UIImageView(frame: CGRect(x: screenWidth/2-50, y:(screenHeight/2)-90, width: 100, height: 100))
        self.view1.backgroundColor = UIColor.clear
        
        self.view1.addSubview(loader1)
     //   self.loader1.image = UIImage.gif(name: "loading-orange")
        
        DispatchQueue.main.async
        {
                
                    self.view.addSubview(view1)
                    self.view.isUserInteractionEnabled = false
                
        }
        
        
    }
    static func hideIndicator()
    {
        DispatchQueue.main.async
        {
                if (view1 != nil)
                {
                    
                    self.view.isUserInteractionEnabled = true
                    ConstantData.view1.removeFromSuperview()
                    ConstantData.view1.isHidden = true
                    ConstantData.view1 = nil
                    
                
                }
            
            
        }
    }
 

    
    
    
    
    
    static func trimPrice(Price:String)->(String)
    {
        let price: String = Price as String
        let endIndex = price.index(price.endIndex, offsetBy: -2)
        let truncated = price.substring(to: endIndex)
        return truncated
    }
    
   
    static func showAlertWithTilte22()
    {
        DispatchQueue.main.async(execute: {() -> Void in
        let alertVC = UIAlertController(title: "Location Service Disabled", message: "To re-enable, Please go to Settings and turn on Location Service for Margin Fresh", preferredStyle: .alert)
        alertVC.addAction(UIAlertAction(title: "Open Settings", style: .default) { value in
            let path = UIApplication.openSettingsURLString
            if let settingsURL = URL(string: path), UIApplication.shared.canOpenURL(settingsURL) {
                UIApplication.shared.openURL(settingsURL)
            }
        })
        //alertVC.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        UIApplication.shared.keyWindow?.rootViewController?.present(alertVC, animated: true, completion: nil)
         })
        
    }
    //MARK: - Alert Code fun
    static func showAlertWithTilte(title : NSString , message : NSString)
    {
        DispatchQueue.main.async(execute: {() -> Void in
            let alertController = UIAlertController(title: title as String, message: message as String, preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: {(_ action: UIAlertAction) -> Void in
            }))
            UIApplication.shared.keyWindow?.rootViewController?.present(alertController, animated: true, completion: {() -> Void in
            })
        })
    }
   static func showAnimate(view:UIView)
    {
        view.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
        view.alpha = 0.0
        UIView.animate(withDuration: 0.25, animations: {
            view.alpha = 1.0
            view.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        })
    }
    
   static func removeAnimate(view:UIView)
    {
        UIView.animate(withDuration: 0.25, animations: {
            view.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
            view.alpha = 0.0
        }, completion: {(finished : Bool) in
            if(finished)
            {
                //self.willMove(toParentViewController: nil)
                view.removeFromSuperview()
                
            }
        })
    }
    static func isValidEmail(str:String?) -> Bool
    {
        let emailRegEx = "[A-Z0-9a-z\\._%+-]+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2,3}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: str)
       
    }
//    static func isValidEmail(str:String?) -> Bool
//    {
//        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9-]+\\.[A-Za-z]{2,}"
//        
//        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
//        return emailTest.evaluate(with: str)
//    }
    static func setPadding(textfield : UITextField , paddng : Int )
    {
        let paddingview = UIView(frame: CGRect(x: 0, y: 0, width: paddng, height: 20))
        paddingview.backgroundColor = UIColor.clear
        
        textfield.leftView = paddingview
        textfield.leftViewMode = UITextField.ViewMode.always
    }
    
    static func isVadidName(str1:String) -> Bool
    {
//        let emailRegEx = "[A-Za-z]+" //"[A-Za-z]+[[\\s][.,!@#$%^&*()/|?][0-9][A-Za-z]+]*"//"[A-Za-z]+//s+[A-Za-z]"
//        
//        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
//        return emailTest.evaluate(with: str1)
        return true
        
    }
    
    

    
}









//DispatchQueue.global(qos: .background).async
//    {
//        
//}
//DispatchQueue.main.async
//    {
//        self.pickLocationBtn.isHidden = true
//}

