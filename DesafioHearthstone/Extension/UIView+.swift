//
//  UIView+.swift
//  DesafioHearthstone
//
//  Created by Ricardo Bailoni on 09/04/20.
//  Copyright © 2020 Ricardo Bailoni. All rights reserved.
//

import UIKit

fileprivate struct Constants {
    static let cornerRadius: CGFloat = 16.0
    static let shadowOffSetWidth: CGFloat = 0.0
    static let shadowOffSetHeight: CGFloat = 3.0
    static let shadowOpacity: Float = 1.0
    static let alpha: CGFloat = 0.5
    
    private init() {}
}

extension UIView {
    func borderCard() {
        self.layer.cornerRadius = Constants.cornerRadius
        self.layer.shadowColor = UIColor.preto.withAlphaComponent(Constants.alpha).cgColor
        self.layer.masksToBounds = false
        self.layer.shadowOffset = CGSize(width: Constants.shadowOffSetWidth, height: Constants.shadowOffSetHeight)
        self.layer.shadowOpacity = Constants.shadowOpacity
    }
}
