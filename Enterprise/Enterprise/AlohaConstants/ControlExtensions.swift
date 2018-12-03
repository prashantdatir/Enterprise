//
//  ControlExtensions.swift
//  sureEcosystem Inspect
//
//  Created by admin on 21/05/18.
//

import UIKit

extension UIView {
    @IBInspectable var shadowColor: UIColor {
        get{
            return UIColor(cgColor: self.shadowColor as! CGColor)
        }
        set{
            self.layer.shadowColor = newValue.cgColor
        }
    }
    
    @IBInspectable var borderColor: UIColor {
        get{
            return UIColor(cgColor: self.borderColor as! CGColor)
        }
        set{
            self.layer.borderColor = newValue.cgColor
        }
    }
    
    @IBInspectable var shadowOffset: CGSize {
        get{
            return self.shadowOffset
        }
        set{
            self.layer.shadowOffset = newValue
        }
    }
    
    @IBInspectable var borderRadius: CGFloat {
        get{
            return self.borderRadius
        }
        set{
            self.layer.cornerRadius = newValue
        }
    }
    
    
    @IBInspectable var borderWidth: CGFloat {
        get{
            return self.borderWidth
        }
        set{
            self.layer.borderWidth = newValue
        }
    }
    @IBInspectable var shadowRadius: CGFloat {
        get{
            return self.shadowRadius
        }
        set{
            self.layer.shadowRadius = newValue
        }
    }
    
    @IBInspectable var shadowOpacity: Float {
        get{
            return self.shadowOpacity
        }
        set{
            self.layer.shadowOpacity = newValue
        }
    }
}
