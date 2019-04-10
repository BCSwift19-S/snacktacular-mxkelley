//
//  UIView+addBorder.swift
//  Snacktacular
//
//  Created by Michael X Kelley on 4/10/19.
//  Copyright © 2019 John Gallaugher. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    func addBorder(with: CGFloat, radius: CGFloat, color: UIColor) {
        self.layer.borderWidth = with
        self.layer.borderColor = color.cgColor
        self.layer.cornerRadius = radius
    }
    
    func noBorder() {
        self.layer.borderWidth = 0.0
    }
}
