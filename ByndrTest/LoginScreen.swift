//
//  LoginScreen.swift
//  ByndrTest
//
//  Created by Jaggu Sam on 22/01/18.
//  Copyright © 2018 Jaggu Sam. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class LoginScreen: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var userNameOrEmailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var errorLabel: UILabel!
    
    var loginDetails = [LoginGetSetDetails]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        userNameOrEmailTextField.layer.cornerRadius = 5
        passwordTextField.layer.cornerRadius = 5
        loginButton.layer.cornerRadius = 5
        
        userNameOrEmailTextField.delegate = self
        passwordTextField.delegate = self
        
        // Do any additional setup after loading the view.
    }

    @IBAction func onClickBackButton(_ sender: Any) {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "StartPage") as! StartPage
        self.present(nextViewController, animated: true, completion: nil)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        userNameOrEmailTextField.resignFirstResponder()
        passwordTextField.resignFirstResponder()
        return true
    }
    
    
    @IBAction func onClickLogin(_ sender: Any) {
        
        
        
        
        if userNameOrEmailTextField.text == "" && passwordTextField.text == ""
        {
            self.errorLabel.text = "Please enter the Details"
        }
        
        if userNameOrEmailTextField.text == ""
        {
            if passwordTextField.text != ""
            {
            self.errorLabel.text = "Please enter the Username or Email"
            }

        }
        
        if passwordTextField.text == ""
        {
            if userNameOrEmailTextField.text != ""
            {
            
            self.errorLabel.text = "Please enter the Password"
            }
        }
        
        if userNameOrEmailTextField.text != "" && passwordTextField.text != ""
        {
            onClickLogin(email: self.userNameOrEmailTextField.text!, password: self.passwordTextField.text!)
        print("success")
        }
        
        
        }
    
    
    
    func onClickLogin(email: String, password: String){
        
        
        let parameters = ["username": email, "password": password]
        let url = "https://app.byndr.com/afe/login"
        
        // build request
        Alamofire.request(url, method: .post, parameters: parameters).responseJSON { response in
            
            if let status = response.response?.statusCode {
                                switch(status){
                                case 200:
                                    print("Accessed")
                                    if let jsonValue = response.result.value {
                                        let json = JSON(jsonValue)
                                        if var quote = json["data"].dictionary{
                                              //Storing response to variable
                                            guard let userobjects = LoginGetSetDetails.init(
                                                id: quote["id"]?.object as AnyObject,
                                                first_name: (quote["first_name"]?.string)!,
                                                display_name: (quote["display_name"]?.string)!,
                                                email: (quote["email"]?.string)!,
                                                institution_id: quote["institution_id"]?.object as AnyObject,
                                                institution_name: (quote["institution_name"]?.string)!,
                                                phone_number: (quote["phone_number"]?.string)!,
                                                department: (quote["department"]?.string)!,
                                                user_type: (quote["user_type"]?.string)!)
                                                else
                                                {
                                                  fatalError("Unable to instantiate")
                                                }
                                                
                                            self.loginDetails += [userobjects]
                                            print("\(userobjects.email)")
                                            
                                            let share = UIApplication.shared.delegate as! AppDelegate
                                            share.loginDetails = self.loginDetails as AnyObject
                                            
                                            let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                                            
                                            let nextViewController = storyBoard.instantiateViewController(withIdentifier: "TabBar") as! TabBar
                                            self.present(nextViewController, animated: true, completion: nil)
                                        
                                        }
                                        if let errorMessage = json["message"].string{
                                            if(errorMessage == "Your username or password is incorrect.")
                                            {
                                                //self.showError(errorMsg: "invalid email/password")
                                                self.errorLabel.text = "Invalid email/password"
                                            }
                                        }
                
                
                                    }
                                default:
                                    print("error with response status: \(status)")
                
                                }
                            }
            
        }
    }
    
    func showError(errorMsg: String) -> Void {
        let alert = UIAlertController(title: "Alert", message: errorMsg, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func onClickForgot(_ sender: Any) {
    }

}
