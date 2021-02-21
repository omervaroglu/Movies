//
//  ClassNameGettable.swift
//  Movies
//
//  Created by Ömer Faruk Varoğlu on 21.02.2021.
//

import Foundation

public protocol ClassNameGettable {
    static var className: String { get }
    var className: String { get }
}

public extension ClassNameGettable {
    static var className: String {
        return String(describing: self)
    }

    var className: String {
        return type(of: self).className
    }
}
