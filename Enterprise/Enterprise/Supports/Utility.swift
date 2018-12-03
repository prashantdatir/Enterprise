//
//  Utility.swift
//  Enterprise
//
//  Created by admin on 26/10/18.
//  Copyright © 2018 admin. All rights reserved.
//

import UIKit
import CoreData
import SystemConfiguration

class Utility: NSObject {
    
    func isDeviceIpad() -> Bool {
        
        if UIDevice.current.userInterfaceIdiom == .pad{
            return true
        }
        else{
            return false
        }
    }
    
    class func saveDefaultContext(){
        
        let context : NSManagedObjectContext = NSManagedObjectContext.mr_default()
        
        context.mr_saveToPersistentStoreAndWait()
    }
    
    class func setupViewShadow(shadwView:UIView)
    {
        shadwView.layer.shadowColor = UIColor.darkGray.cgColor
        shadwView.layer.shadowOpacity = 0.3
        shadwView.layer.shadowOffset = CGSize.zero
        shadwView.layer.shadowRadius = 6
    }
    
    class func setupButtonCorner(buttonRcv : UIButton)
    {
        buttonRcv.layer.cornerRadius = buttonRcv.frame.size.height / 5
    }
    
    class func setupViewCorner(viewRcv : UIView)
    {
        viewRcv.layer.cornerRadius = viewRcv.frame.size.height / 5
    }
    
    class func isInternetAvailable() -> Bool
    {
        var zeroAddress = sockaddr_in()
        zeroAddress.sin_len = UInt8(MemoryLayout.size(ofValue: zeroAddress))
        zeroAddress.sin_family = sa_family_t(AF_INET)
        
        let defaultRouteReachability = withUnsafePointer(to: &zeroAddress) {
            $0.withMemoryRebound(to: sockaddr.self, capacity: 1) {zeroSockAddress in
                SCNetworkReachabilityCreateWithAddress(nil, zeroSockAddress)
            }
        }
        
        var flags = SCNetworkReachabilityFlags()
        if !SCNetworkReachabilityGetFlags(defaultRouteReachability!, &flags) {
            return false
        }
        let isReachable = flags.contains(.reachable)
        let needsConnection = flags.contains(.connectionRequired)
        return (isReachable && !needsConnection)
    }
}
