//
//  StartPage.swift
//  ByndrTest
//
//  Created by Jaggu Sam on 22/01/18.
//  Copyright © 2018 Jaggu Sam. All rights reserved.
//

import UIKit

class StartPage: UIViewController {
    
    @IBOutlet weak var loginButton: UIButton!
    
    @IBOutlet weak var haveAccountButton: UIButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        
        // login buttons shapes and colors
        loginButton.layer.cornerRadius = 5
        haveAccountButton.layer.cornerRadius = 5
        haveAccountButton.layer.borderWidth = 2
        haveAccountButton.layer.borderColor = UIColor.white.cgColor
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
