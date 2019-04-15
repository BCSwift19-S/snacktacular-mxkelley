//
//  SnackUserTableViewCell.swift
//  Snacktacular
//
//  Created by Michael X Kelley on 4/15/19.
//  Copyright © 2019 John Gallaugher. All rights reserved.
//

import UIKit
import Firebase
import SDWebImage

private let dateFormatter: DateFormatter = {
    let dateFormatter = DateFormatter()
    dateFormatter.dateStyle = .medium
    dateFormatter.timeStyle = .none
    return dateFormatter
}()

class SnackUserTableViewCell: UITableViewCell {

    @IBOutlet weak var photoImage: UIImageView!
    @IBOutlet weak var displayNameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var userSinceLabel: UILabel!
    
    var snackUser: SnackUser! {
        didSet {
            
            photoImage.layer.cornerRadius = photoImage.frame.size.width / 2
            photoImage.clipsToBounds = true
            
            displayNameLabel.text = snackUser.displayName
            emailLabel.text = snackUser.email
            //Need to include these extra lines due to crashing due to Date() in convenience initializer - Not compatible with Firebase
            let userDate: Timestamp = snackUser.userSince
            let timeInt = userDate.seconds
            let timeInterval = TimeInterval(timeInt)
            let date = NSDate(timeIntervalSince1970: timeInterval)
            let formattedDate = dateFormatter.string(from: date as Date)
            //
            userSinceLabel.text = "\(formattedDate)"
            
            guard let url = URL(string: snackUser.photoURL) else {
                photoImage.image = UIImage(named: "singleUser")
                print("😡 ERROR: Could not convert photoURL named \(snackUser.photoURL) into a valid URL.")
                return
            }
            photoImage.sd_setImage(with: url, placeholderImage: UIImage(named: "singleUser"))
        }
    }
}
