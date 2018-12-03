//
//  ENMasterViewController.swift
//  Enterprise
//
//  Created by user on 11/13/18.
//  Copyright © 2018 admin. All rights reserved.
//


protocol MenuViewShowHideDelegate {
    func showMenu()
}

protocol MenuActionDelegate {
    func showSelected(selectedMenu : ENMenuItem)
}


import UIKit

class ENMasterViewController: UIViewController, MenuViewShowHideDelegate, MenuActionDelegate {
   
    

    @IBOutlet weak var ENMenuVCView: UIView!
    @IBOutlet weak var ENCheckExistingVCView: UIView!
    
    @IBOutlet weak var drawerTrailingConstraint: NSLayoutConstraint!

    
    var isDrawerVisible                     : Bool = false
    var menuViewContrller                   : ENMenuViewController?
    var requestViewControler                : ENRequestServiceViewController?
    var checkExistingServiceViewController  : ENCheckExisitingServiceViewController?
    var oldController                       : UIViewController?
    var newController                       : UIViewController?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationController?.navigationBar.isHidden = true
        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = false
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(respondToSwipeGesture(gesture:)))
        swipeRight.direction = UISwipeGestureRecognizer.Direction.right
        self.view.addGestureRecognizer(swipeRight)
        
    }
    func showMenu() {
        self.show()
    }
    
    func showSelected(selectedMenu: ENMenuItem) {
        switch selectedMenu {
        case .Request:
            showHomeView()
            show()
            break
        case .ChooseExisitingService:
            showExistingServiceView()
            show()
            break
        case .Logout:
            showLogoutPopUp()
            show()
            break
        }
    }
    
    func showHomeView(){
        self.ENMenuVCView.isHidden = false
        self.ENCheckExistingVCView.isHidden = true
    }
    
    func showExistingServiceView(){
        self.ENMenuVCView.isHidden = true
        self.ENCheckExistingVCView.isHidden = false
    }
    
    
    func showLogoutPopUp(){
        let logoutAlert : UIAlertController = UIAlertController(title: APP_NAME, message: LOGOUT_ALERT_MESSAGE, preferredStyle: UIAlertController.Style.alert)
        
        let yesAction : UIAlertAction = UIAlertAction(title: ALERT_TITLE_YES, style: UIAlertAction.Style.default) { (alert : UIAlertAction) in
            //self.navigationController?.popToRootViewController(animated: false)
            let loginVC : LoginViewController = self.storyboard!.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
            self.present(loginVC, animated: false, completion: nil)
        }
        
        let cancelAction : UIAlertAction = UIAlertAction(title: ALERT_TITLE_CANCEL, style: UIAlertAction.Style.default) { (alert : UIAlertAction) in
        }
        
        logoutAlert.addAction(yesAction)
        logoutAlert.addAction(cancelAction)
        
        self.navigationController?.present(logoutAlert, animated: true, completion: nil)
        
    }
    
    @IBAction func didSelectHideMenu(_ sender: UIControl) {
        self.show()
    }
    
    @objc func respondToSwipeGesture(gesture: UIGestureRecognizer) {
        if let swipeGesture = gesture as? UISwipeGestureRecognizer {
            switch swipeGesture.direction {
            case UISwipeGestureRecognizer.Direction.right:
                self.show()
                print("Swiped right")
            case UISwipeGestureRecognizer.Direction.down:
                print("Swiped down")
            case UISwipeGestureRecognizer.Direction.left:
                print("Swiped left")
            case UISwipeGestureRecognizer.Direction.up:
                print("Swiped up")
            default:
                break
            }
        }
    }

    
    func show() {
        self.view.layoutIfNeeded()
        let drawerConstraint = self.drawerTrailingConstraint.constant
            //self.drawerTrai; lingConstraint.constant
        self.drawerTrailingConstraint.constant = drawerConstraint == 0 ? -self.view.bounds.width : 0;
        self.isDrawerVisible = self.drawerTrailingConstraint.constant == 0 ? false : true
        
        if self.isDrawerVisible {
            self.menuViewContrller?.beginAppearanceTransition(true, animated: false)
        }
        else{
            self.menuViewContrller?.beginAppearanceTransition(false, animated: false)
        }
        UIView.animate(withDuration: 0.3) {
            self.view.layoutIfNeeded()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
//        let vc = storyboard?.instantiateViewController(withIdentifier: "ENRequestServiceViewController") as! ENRequestServiceViewController
//        self.navigationController?.pushViewController(vc, animated: true)
        
        
        
        if let menuVC =  segue.destination as? ENMenuViewController{
            self.menuViewContrller = menuVC
            self.menuViewContrller?.delegate = self as MenuActionDelegate
        }
        else if let detailVC =  segue.destination as? ENCheckExisitingServiceViewController{
            self.checkExistingServiceViewController = detailVC
            self.checkExistingServiceViewController?.delegate = self as MenuViewShowHideDelegate
            self.newController = detailVC
        }else if let detailVC =  segue.destination as? ENRequestServiceViewController{
            self.requestViewControler = detailVC
            self.requestViewControler?.delegate = self as MenuViewShowHideDelegate
            self.newController = detailVC
        }
//        else if let detailVC = storyboard?.instantiateViewController(withIdentifier: "ENRequestServiceViewController") as! ENRequestServiceViewController
//        {
//           self.navigationController?.pushViewController(vc, animated: true)
//        }
    }
}
