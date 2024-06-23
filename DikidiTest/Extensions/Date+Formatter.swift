//
//  Date+Formatter.swift
//  DikidiTest
//
//  Created by Poet on 21.06.2024.
//

import Foundation

extension Date {
    
    var beforeMonthYear: String {
        let dateformat = DateFormatter()
        dateformat.locale = Locale(identifier: "ru_RU")
        dateformat.dateFormat = "до d MMMM"
        if self.monthNumber == 3 || self.monthNumber == 8 {
            return dateformat.string(from: self) + "а"
        } else {
            let str = dateformat.string(from: self)
            return String(str.dropLast(1)) + "я"
        }
    }
	
    var monthNumber: Int {
        let dateformat = DateFormatter()
        dateformat.locale = Locale(identifier: "ru_RU")
        dateformat.dateFormat = "M"
        return Int(dateformat.string(from: self)) ?? -1
    }
}
