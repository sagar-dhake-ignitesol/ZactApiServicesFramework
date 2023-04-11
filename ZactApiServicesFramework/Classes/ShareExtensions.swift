//
//  File.swift
//  
//
//  Created by Sagar Dhake on 30/03/23.
//

import Foundation

extension Double {
    var formatString: String {
        return String(format: "%.2f", self)
    }
    
    var formatDecimal: String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.maximumFractionDigits = 2
        numberFormatter.minimumFractionDigits = 2
        numberFormatter.locale = Locale(identifier: Locale.current.identifier)
        guard let formattedNumber = numberFormatter.string(from: NSNumber(value: self)) else { return ""}
        return formattedNumber == "0" ? "0.00" : formattedNumber
    }
    
    var days: Int {
        return Int(self / (24 * 60 * 60))
    }
    
    var string: String{
        return String(self)
    }
    
    /// Rounds the double to decimal places value
    func roundToPlaces(toPlaces places: Int = 2) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
}
