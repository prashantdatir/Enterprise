//
//  Helper.swift
//  MarginFresh
//
//  Created by Shrikant Tanwade on 25/05/17.
//  Copyright © 2017 Shrikant. All rights reserved.
//

import UIKit

class Helper: NSObject
{
    func navigate(fromCurrentVC : UIViewController, toVC : String)
    {DispatchQueue.main.async
        {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: toVC)
        fromCurrentVC.navigationController?.pushViewController(vc, animated: true)
        }
    }
}
