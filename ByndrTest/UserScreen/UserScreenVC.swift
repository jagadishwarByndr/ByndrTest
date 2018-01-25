//
//  UserScreenVC.swift
//  ByndrTest
//
//  Created by Jagdishwar Enagurthi  on 23/01/18.
//  Copyright © 2018 Jaggu Sam. All rights reserved.
//

import UIKit
import XMSegmentedControl   



class UserScreenVC: UIViewController,XMSegmentedControlDelegate, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var segmentedControl1: XMSegmentedControl!
    @IBOutlet weak var userTableView: UITableView!
    var userDetailsGetSet = [LoginGetSetDetails]()
    
    
    let byndrColor : UIColor = UIColor( red: 224/255, green: 0/255, blue: 115/255, alpha: 1.0 )
    let font = UIFont(name: "Helvetica Light", size: 12.0)

    override func viewDidLoad() {
        super.viewDidLoad()
       
        userTableView.delegate = self
        userTableView.dataSource = self
       
        segmentedControl1.delegate = self
        segmentedControl1.segmentTitle = ["YOU", "SETTINGS", "HELP"]
        
        
        segmentedControl1.selectedItemHighlightStyle = XMSelectedItemHighlightStyle.BottomEdge
        segmentedControl1.backgroundColor = byndrColor
        segmentedControl1.tint = UIColor.white
        segmentedControl1.highlightTint = UIColor.white
        segmentedControl1.highlightColor = UIColor.white
        segmentedControl1.edgeHighlightHeight = 3
        
        let share = UIApplication.shared.delegate as! AppDelegate
        userDetailsGetSet = share.loginDetails as! [LoginGetSetDetails]
        
        segmentedControl1.selectedSegment = 1
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 5
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
       
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 4
        case 1:
            return 1
        default:
            break
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0
        {
        // User name, email and change password
            if indexPath.row == 0 {
            
                let userProfileCell:userDetailsCell = Bundle.main.loadNibNamed("userDetailsCell", owner: self, options: nil)?.first as! userDetailsCell
                
                
                userProfileCell.userNameLabel.text = self.userDetailsGetSet[0].display_name
                let image = UIImage(named: "woman")
                userProfileCell.profilePicture.image = image
                userProfileCell.profilePicture.layer.cornerRadius = (image?.size.width)!/2
                return userProfileCell
            
            }else
                if indexPath.row == 1 {
                    let userProfileCell:userDetailsCell = Bundle.main.loadNibNamed("userDetailsCell", owner: self, options: nil)?.first as! userDetailsCell
                    
                    
                    userProfileCell.userNameLabel.text = self.userDetailsGetSet[0].email
                    userProfileCell.userNameLabel.font = UIFont.preferredFont(forTextStyle: UIFontTextStyle(rawValue: "Regular"))
                    userProfileCell.userNameLabel.font = UIFont.systemFont(ofSize: 15)
                    userProfileCell.profilePicture.image = UIImage(named: "envelope")
                    userProfileCell.profilePicture.alpha = 0.5
                    userProfileCell.profilePicture.layer.cornerRadius = userProfileCell.profilePicture.frame.height/2
                    return userProfileCell
            }
            else
            if indexPath.row == 2 {
                let userProfileCell:userDetailsCell = Bundle.main.loadNibNamed("userDetailsCell", owner: self, options: nil)?.first as! userDetailsCell
                
                
                userProfileCell.userNameLabel.text = "Add Phone Number"
                userProfileCell.userNameLabel.font = UIFont.preferredFont(forTextStyle: UIFontTextStyle(rawValue: "Regular"))
                userProfileCell.userNameLabel.font = UIFont.systemFont(ofSize: 15)
                userProfileCell.userNameLabel.isEnabled = false
                userProfileCell.profilePicture.image = UIImage(named: "mobile")
                userProfileCell.profilePicture.alpha = 0.5
                userProfileCell.profilePicture.layer.cornerRadius = userProfileCell.profilePicture.frame.height/2
                return userProfileCell
            }
            if indexPath.row == 3 {
                let userProfileCell:userDetailsCell = Bundle.main.loadNibNamed("userDetailsCell", owner: self, options: nil)?.first as! userDetailsCell
                
                
                userProfileCell.userNameLabel.text = "Change Password"
                userProfileCell.userNameLabel.font = UIFont.preferredFont(forTextStyle: UIFontTextStyle(rawValue: "Regular"))
                userProfileCell.userNameLabel.font = UIFont.systemFont(ofSize: 15)
                userProfileCell.profilePicture.image = UIImage(named: "locked")
                userProfileCell.profilePicture.alpha = 0.5
                userProfileCell.profilePicture.layer.cornerRadius = userProfileCell.profilePicture.frame.height/2
                return userProfileCell
            }
        
       
        }
        
        // Sign Out
        if indexPath.section == 1
        {
        
        let userProfile:userDetailsCell = Bundle.main.loadNibNamed("userDetailsCell", owner: self, options: nil)?.first as! userDetailsCell


        userProfile.userNameLabel.text = "Sign Out"
        //userProfile.userNameLabel.textAlignment =  NSTextAlignment.center
        userProfile.userNameLabel.font = UIFont.preferredFont(forTextStyle: UIFontTextStyle(rawValue: "Regular"))
        userProfile.userNameLabel.font = UIFont.systemFont(ofSize: 15)
        userProfile.profilePicture.layer.cornerRadius = userProfile.profilePicture.frame.width/2
        return userProfile
        }
        else
        {
            let userProfile:userDetailsCell = Bundle.main.loadNibNamed("userDetailsCell", owner: self, options: nil)?.first as! userDetailsCell
            
            
            userProfile.userNameLabel.text = self.userDetailsGetSet[0].display_name
            userProfile.profilePicture.image = UIImage(named: "woman")
            userProfile.profilePicture.layer.cornerRadius = userProfile.profilePicture.frame.width/2
            return userProfile
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.section {
        case 0:
            print("")
        case 1:
            if indexPath.row == 0
            {
                let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                
                let nextViewController = storyBoard.instantiateViewController(withIdentifier: "StartPage") as! StartPage
                self.present(nextViewController, animated: true, completion: nil)
            }
            print("")
        default:
            break
        }
    }
    
    func xmSegmentedControl(xmSegmentedControl: XMSegmentedControl, selectedSegment: Int) {
        if xmSegmentedControl == segmentedControl1 {
            print("SegmentedControl1 Selected Segment: \(selectedSegment)")
            
        switch segmentedControl1.selectedSegment
            {
        case 0:
            print("Seleted 0")
            userTableView.isHidden = true
        case 1:
            print("Selected 1")
            
            userTableView.isHidden = false
        case 2:
            print("Selected 2")
            userTableView.isHidden = true
        default :
            break
            }
        }
    }

}
