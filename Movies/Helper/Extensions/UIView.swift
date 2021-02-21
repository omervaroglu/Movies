//
//  UIView.swift
//  Movies
//
//  Created by Ömer Faruk Varoğlu on 22.02.2021.
//

import UIKit

extension UIView {
    
    static let defaultCornerRadius: CGFloat = 12
    
    @IBInspectable var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
        }
    }
    
    @IBInspectable var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
    }
    
    @IBInspectable var borderColor: UIColor? {
        get {
            if let borderColor = layer.borderColor {
                return UIColor(cgColor: borderColor)
            }
            return nil
        }
        set {
            layer.borderColor = newValue?.cgColor
        }
    }
    
    func configureBorderedContainer() {
        cornerRadius = UIView.defaultCornerRadius
        borderWidth = 1
        borderColor = UIColor(red: 223 / 255.0, green: 223 / 255.0, blue: 231 / 255.0, alpha: 1.0)
        backgroundColor = UIColor.white
    }
}

