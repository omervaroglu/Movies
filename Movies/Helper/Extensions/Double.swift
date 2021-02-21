//
//  Double.swift
//  Movies
//
//  Created by Ömer Faruk Varoğlu on 21.02.2021.
//

import Foundation

extension Formatter {
    class func currencyFormatter() -> NumberFormatter {
            let formatter = NumberFormatter()
            formatter.numberStyle = .decimal
            formatter.alwaysShowsDecimalSeparator = true
            formatter.minimumFractionDigits = 1
            formatter.groupingSeparator = "."
            formatter.decimalSeparator = ","
            return formatter
        }
}
extension Double {
    var double: String {
        return (NumberFormatter.currencyFormatter().string(from: NSNumber(value: self)) ?? "")
    }
}
