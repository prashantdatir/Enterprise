//
//  UIViewController+Utility.swift
//  sureEcosystem Inspect
//
//  Created by admin on 18/05/18.
//

import Foundation
import UIKit
import SVProgressHUD

enum ENMenuItem : Int {
    case Request                = 1
    case ChooseExisitingService = 2
    case Logout                 = 3
}

enum CardState {
    case expanded
    case collapsed
}

enum QuestionType : Int64 {
    case YesNoQuestion      = 1
    case MCQuestion         = 2
    case FreeText           = 3
    case SliderQuestion     = 4
    case NumericSpinner     = 5
    case Percentage         = 6
    case Signature          = 7
    case Photo              = 8
    case Document           = 9
    case DatePickerQuestion = 10
    case SingleSlider       = 11
    case CounterRange       = 12
}

extension UIViewController{
    
     func startActivity(view: UIView){
        view.isUserInteractionEnabled = false
        SVProgressHUD.show()
    }
    
     func stopActivity(view: UIView){
        DispatchQueue.main.async {
            self.view.isUserInteractionEnabled = true
            SVProgressHUD.dismiss()
        }
       
    }
    
    
    func showAlertControllerWithMessage(messageToShow : String) {
        let alert = UIAlertController(title: APP_NAME, message: messageToShow, preferredStyle: UIAlertController.Style.alert)
        
        let okAction = UIAlertAction(title: "Ok", style: UIAlertAction.Style.default) { (alert) in
        }
        
        alert.addAction(okAction)
        
        self.navigationController?.present(alert, animated: true, completion: nil)
    }
    
}
