//
//  UIColor+.swift
//  DesafioHearthstone
//
//  Created by Ricardo Bailoni on 09/04/20.
//  Copyright © 2020 Ricardo Bailoni. All rights reserved.
//

import UIKit

fileprivate struct Constants {
    static let red032: CGFloat = 32/255.0
    static let red112: CGFloat = 112/255.0
    static let red148: CGFloat = 148/255.0
    static let red229: CGFloat = 229/255.0
    static let green032: CGFloat = 32/255.0
    static let green112: CGFloat = 112/255.0
    static let green148: CGFloat = 148/255.0
    static let green229: CGFloat = 229/255.0
    static let blue050: CGFloat = 50/255.0
    static let blue112: CGFloat = 112/255.0
    static let blue148: CGFloat = 148/255.0
    static let blue229: CGFloat = 229/255.0
    static let zero: CGFloat = 0
    static let alpha100: CGFloat = 1.0
    
    private init() {}
}

extension UIColor {
    @objc public static var cinza: UIColor {
        return UIColor(red: Constants.red112, green: Constants.green112, blue: Constants.blue112, alpha: Constants.alpha100)
    }
    
    @objc public static var preto: UIColor {
        return UIColor(red: Constants.red032, green: Constants.green032, blue: Constants.blue050, alpha: Constants.alpha100)
    }
    
    @objc public static var background: UIColor {
        return UIColor(red: Constants.red229, green: Constants.green229, blue: Constants.blue229, alpha: Constants.alpha100)
    }
    
    @objc public static var random: UIColor {
        return UIColor(red: .random(in: Constants.zero...Constants.red148), green: .random(in: Constants.zero...Constants.green148), blue: .random(in: Constants.zero...Constants.blue148), alpha: Constants.alpha100)
    }
}
