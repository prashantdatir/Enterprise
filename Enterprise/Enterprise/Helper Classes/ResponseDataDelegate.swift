//
//  ResonseDataDelegate.swift
//  sureEcosystem Inspect
//
//  Created by admin on 05/06/18.
//

import Foundation

protocol ResponseDataDelegate {
    
    func didSuccessWith(tagValue : Int)
    func didFailWith(tagValue : Int)
    func didFailWithDict(dict : NSDictionary)
    func didsuccessWithDict(dict : NSDictionary)
}
