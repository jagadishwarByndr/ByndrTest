//
//  NotReceivedMailScreen.swift
//  ByndrTest
//
//  Created by Jagdishwar Enagurthi  on 25/01/18.
//  Copyright © 2018 Jaggu Sam. All rights reserved.
//

import UIKit

class NotReceivedMailScreen: UIViewController {
    @IBOutlet weak var yourNameTF: UITextField!
    @IBOutlet weak var yourEmailTF: UITextField!
    @IBOutlet weak var nameOfTheCollegeTF: UITextField!
    @IBOutlet weak var yourPhoneTF: UITextField!
    @IBOutlet weak var yourCollegeRegistration: UITextField!
    @IBOutlet weak var connectButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let color = UIColor.lightGray
        
        yourNameTF.layer.borderWidth = 1
        yourNameTF.layer.borderColor = color.cgColor
        yourEmailTF.layer.borderWidth = 1
        yourEmailTF.layer.borderColor = color.cgColor
        nameOfTheCollegeTF.layer.borderWidth = 1
        nameOfTheCollegeTF.layer.borderColor = color.cgColor
        yourPhoneTF.layer.borderWidth = 1
        yourPhoneTF.layer.borderColor = color.cgColor
        yourCollegeRegistration.layer.borderWidth = 1
        yourCollegeRegistration.layer.borderColor = color.cgColor

        connectButton.layer.cornerRadius = 5
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onClickConnectButton(_ sender: Any) {
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
