//
//  Utility.swift
//  SampleApp
//
//  Created by Sagar Dhake on 10/04/23.
//

import Foundation

func milliSecondsToDate(milliseconds : Double , format : String = "dd MMM") -> String {
    let dateVar = Date(timeIntervalSince1970: TimeInterval(milliseconds/1000))
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = format
    dateFormatter.locale = Locale(identifier: "en_US")
    return dateFormatter.string(from: dateVar)
}
