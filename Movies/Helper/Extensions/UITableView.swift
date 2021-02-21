//
//  UITableView.swift
//  Movies
//
//  Created by Ömer Faruk Varoğlu on 21.02.2021.
//

import Foundation
import UIKit

extension UITableView {
    func register(with commonId: String) {
        register(UINib(nibName: commonId, bundle: nil), forCellReuseIdentifier: commonId)
    }
}
