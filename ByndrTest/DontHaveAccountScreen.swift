//
//  DontHaveAccountScreen.swift
//  ByndrTest
//
//  Created by Jaggu Sam on 22/01/18.
//  Copyright © 2018 Jaggu Sam. All rights reserved.
//

import UIKit

class DontHaveAccountScreen: UIViewController {
    @IBOutlet weak var yesButton: UIButton!
    @IBOutlet weak var noButton: UIButton!
    
    let byndrColor : UIColor = UIColor( red: 202/255, green: 23/255, blue: 122/255, alpha: 1.0 )

    override func viewDidLoad() {
        super.viewDidLoad()
        
       // NavigationBar Items
        navigationController?.navigationBar.barTintColor = byndrColor
        let imgButton = UIButton()
        imgButton.setImage(UIImage(named: "left-arrow"), for: UIControlState.normal)
        imgButton.frame = CGRect(x: 0, y: 0, width: 20, height: 20)
        imgButton.addTarget(self, action: #selector(onTapBack), for: .touchUpInside)
        let button = UIBarButtonItem(customView: imgButton)
        self.navigationItem.leftBarButtonItem = button
        
        //Yes or No buttons designs
        
        yesButton.layer.cornerRadius = 5
        noButton.layer.cornerRadius = 5
        
    
        
        // Do any additional setup after loading the view.
    }

    @objc func onTapBack()
    {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "StartPage") as! StartPage
        self.present(nextViewController, animated: true, completion: nil)
    }

    @IBAction func onTapYesButton(_ sender: Any) {
        
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "LoginScreen") as! LoginScreen
        self.present(nextViewController, animated: true, completion: nil)
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
