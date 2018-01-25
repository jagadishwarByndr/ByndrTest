//
//  userDetailsCell.swift
//  ByndrTest
//
//  Created by Jagdishwar Enagurthi  on 24/01/18.
//  Copyright © 2018 Jaggu Sam. All rights reserved.
//

import UIKit

class userDetailsCell: UITableViewCell {
    @IBOutlet weak var profilePicture: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
