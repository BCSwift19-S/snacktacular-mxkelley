//
//  Double+roundTo.swift
//  Snacktacular
//
//  Created by Michael X Kelley on 4/10/19.
//  Copyright © 2019 John Gallaugher. All rights reserved.
//

import Foundation

//Rounds any double to "places" places, e.g. if value = 3.275, value.roundTo(places: 1) returns 3.3

extension Double {
    func roundTo(places: Int) -> Double {
        let tenToPower = pow(10.0, Double( ( places >= 0 ? places : 0)))
        let roundedValue = (self * tenToPower).rounded() / tenToPower
        return roundedValue
    }
}
