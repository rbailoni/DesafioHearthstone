//
//  UIFont+.swift
//  DesafioHearthstone
//
//  Created by Ricardo Bailoni on 09/04/20.
//  Copyright © 2020 Ricardo Bailoni. All rights reserved.
//

import UIKit

fileprivate struct Constants {
    static let avenir = "Avenir"
    static let avenirRoman = "Avenir-Roman"
    static let avenirBlack = "Avenir-Black"
    
    private init() {}
}

extension UIFont {
    static func avenir(_ size: CGFloat) -> UIFont {
        return UIFont(name: Constants.avenir, size: size) ?? UIFont.systemFont(ofSize: size)
    }
    
    static func avenirRoman(_ size: CGFloat) -> UIFont {
        return UIFont(name: Constants.avenirRoman, size: size) ?? UIFont.systemFont(ofSize: size)
    }
    
    static func avenirBlack(_ size: CGFloat) -> UIFont {
        return UIFont(name: Constants.avenirBlack, size: size) ?? UIFont.systemFont(ofSize: size)
    }
}
