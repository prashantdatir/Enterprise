//
//  Date+Utility.swift
//  sureEcosystem Inspect
//
//  Created by aloha on 17/09/18.
//

import Foundation

extension NSDate{
    
    func getStringFromDate(dateFormat: String) -> String {
        
        let dateFormatter : DateFormatter = DateFormatter()
        dateFormatter.dateFormat = dateFormat
        
        return dateFormatter.string(from: self as Date)
        
    }
    
    
    func getDateFromString(dateFormat: String, dateInStringFormat: String) -> Date {
        
        let dateFormatter : DateFormatter = DateFormatter()
        dateFormatter.dateFormat = dateFormat

        return dateFormatter.date(from: dateInStringFormat)!
    }
    
}
