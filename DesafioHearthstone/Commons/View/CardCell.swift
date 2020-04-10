//
//  CardCell.swift
//  DesafioHearthstone
//
//  Created by Ricardo Bailoni on 09/04/20.
//  Copyright © 2020 Ricardo Bailoni. All rights reserved.
//

import UIKit

fileprivate struct Constants {
    static let constraint16: CGFloat = 16
    
    private init() {}
}

class CardCell: UICollectionViewCell {
    lazy var card: Card = {
        return Card()
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        viewCodeSetup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension CardCell: ViewCodeProtocol {
    func viewHierarchySetup() {
        contentView.addSubview(card)
    }
    
    func viewConstraintSetup() {
        setConstraintsCard()
    }
    
    private func setConstraintsCard() {
        card.topAnchor.constraint(equalTo: contentView.topAnchor, constant: Constants.constraint16).isActive = true
        card.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -Constants.constraint16).isActive = true
        card.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Constants.constraint16).isActive = true
        card.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -Constants.constraint16).isActive = true
    }
    
    func viewThemeSetup() {
        card.translatesAutoresizingMaskIntoConstraints = false
    }
}
