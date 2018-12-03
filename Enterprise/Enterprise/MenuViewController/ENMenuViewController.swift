
//
//  ENMenuViewController.swift
//  Enterprise
//
//  Created by user on 10/29/18.
//  Copyright © 2018 admin. All rights reserved.
//

import UIKit
import SVProgressHUD

class ENMenuViewController: UIViewController , UITableViewDataSource, UITableViewDelegate {
    
    var listOfMenu : NSMutableArray?
    var isEventsSubMenuVisible : Bool = false
    var isSettingSubMenuVisible : Bool = false
    var isSettingMenuVisible : Bool = false
    var delegate : MenuActionDelegate?
    
    @IBOutlet weak var menuTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        listOfMenu = NSMutableArray(array: [MENU_REQUEST,MENU_EXISTSERVICE,MENU_LOGOUT,MENU_CONTACTUS])
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
  
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
     
        return listOfMenu!.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
       
            return 70
      
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellToReturn : UITableViewCell
        
        let cell : ENMenuTableViewCell = tableView.dequeueReusableCell(withIdentifier: "ENMenuTableViewCell") as! ENMenuTableViewCell
        cell.menuTitleLabel.text    =   listOfMenu![indexPath.row] as! String
//        switch indexPath.section {
//        case 0:
//            cell.menuTitleLabel?.text = MENU_REQUEST
//            cellToReturn = cell
//            break
//        case 1:
//            //cell.menuImageView.image = UIImage(named: "Order")
//            cell.menuTitleLabel?.text = MENU_EXISTSERVICE
//            //cell.submenuImageView.image = nil
//            cellToReturn = cell
//            break
//        case 2:
//
//            cell.menuTitleLabel?.text = MENU_LOGOUT
//            cellToReturn = cell
//            break
//
//
//        default:
//            break
//        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        switch indexPath.row {
        case 0:
            self.delegate?.showSelected(selectedMenu: .Request)
            break
        case 1:
            self.delegate?.showSelected(selectedMenu: .ChooseExisitingService)
            break
        case 2:
            self.delegate?.showSelected(selectedMenu: .Logout)
            break
        case 3:
            
            
            var num = "800687-0169"
            //if let url = NSURL(string: "tel://\(num)"), UIApplication.shared.canOpenURL(url as URL) {
            //    UIApplication.shared.openURL(url as URL)
            //}
            
        
            if let url = URL(string: "tel://\(num)"), UIApplication.shared.canOpenURL(url) {
                if #available(iOS 10, *) {
                    UIApplication.shared.open(url)
                } else {
                    UIApplication.shared.openURL(url)
                }
            }
        
        
//            let url:NSURL = NSURL(string: "telprompt://(800)687-0169")!
//        //UIApplication.shared.openURL(url as URL)
//        if #available(iOS 10.0, *) {
//            UIApplication.shared.open(url as URL, options: [:], completionHandler: nil)
//        } else {
//            // Fallback on earlier versions
//            }
        default:
            break
        }
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
}
