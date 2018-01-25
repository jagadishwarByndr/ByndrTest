//
//  LoginGetSet.swift
//  ByndrTest
//
//  Created by Jagdishwar Enagurthi  on 24/01/18.
//  Copyright © 2018 Jaggu Sam. All rights reserved.
//

import Foundation
import UIKit

class LoginGetSetDetails
{
    var id : AnyObject
    var first_name : String
    var display_name : String
    var email : String
    var institution_id : AnyObject
    var institution_name : String
    var phone_number : String
    var department : String
    var user_type : String
    
    
   init?( id : AnyObject,
     first_name : String,
     display_name : String,
     email : String,
     institution_id : AnyObject,
     institution_name : String,
     phone_number : String,
     department : String,
     user_type : String) {
        
        self.id = id
        self.first_name = first_name
        self.display_name = display_name
        self.email = email
        self.institution_id = institution_id
        self.institution_name = institution_name
        self.phone_number = phone_number
        self.department = department
        self.user_type = user_type
        
    }
}
