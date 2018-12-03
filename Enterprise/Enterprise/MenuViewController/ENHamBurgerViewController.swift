
//
//  ENHamBurgerViewController.swift
//  Enterprise
//
//  Created by user on 11/12/18.
//  Copyright © 2018 admin. All rights reserved.
//

import UIKit

class ENHamBurgerViewController: UIViewController {

    var threeLineTag    =   true

    
    @IBOutlet weak var hamBurgerCustomView : UIView!

    @IBOutlet weak var requestServiceBtn : UIButton!
    @IBOutlet weak var checkExistingRequestBtn : UIButton!
    @IBOutlet weak var logoutBtn : UIButton!
    
    @IBAction func didSelectRequestService(_ sender: Any)
    {
        
    }
    @IBAction func didSelectCheckExistingRequest(_ sender: Any)
    {
        
    }
    @IBAction func didSelectLogout(_ sender: Any){
        
    }
    
    func ShowHamBurger()
    {
        if threeLineTag == true
        {
            threeLineTag = false
            
            UIView.animate(withDuration: 0.5, delay: 0.2, options: UIView.AnimationOptions.curveEaseOut, animations: {
                self.hamBurgerCustomView.alpha = 1
                //                self.parentView.isUserInteractionEnabled = false
                //                self.parentView.backgroundColor =   UIColor(white: 0.3, alpha: 0.5)
                //                self.nameTxtfields.alpha    =   0.5
                //                self.serviceLocationTxtfields.alpha    =   0.5
                //                self.phoneTxtfields.alpha    =   0.5
                //                self.OdometerTxtfields.alpha    =   0.5
                //                self.LeaseeNameTxtfields.alpha    =   0.5
                
                Utility.setupButtonCorner(buttonRcv: self.requestServiceBtn)
                Utility.setupButtonCorner(buttonRcv: self.checkExistingRequestBtn)
                Utility.setupButtonCorner(buttonRcv: self.logoutBtn)
                
                self.view.layoutIfNeeded()
            }, completion: nil)
        }
        else
        {
            UIView.animate(withDuration: 0.5, delay: 0.2, options: UIView.AnimationOptions.curveEaseIn, animations: {
                self.hamBurgerCustomView.alpha = 0
                //                self.parentView.backgroundColor =   UIColor(white: 1, alpha: 0.5)
                //                self.nameTxtfields.alpha    =   1
                //                self.serviceLocationTxtfields.alpha    =   1
                //                self.phoneTxtfields.alpha    =   1
                //                self.OdometerTxtfields.alpha    =   1
                //                self.LeaseeNameTxtfields.alpha    =   1
                //                self.parentView.alpha = 1
                //                self.parentView.isUserInteractionEnabled = true
                
                self.view.layoutIfNeeded()
            }, completion: nil)
            threeLineTag = true
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
