//
//  Deck.swift
//  DesafioHearthstone
//
//  Created by Ricardo Bailoni on 09/04/20.
//  Copyright © 2020 Ricardo Bailoni. All rights reserved.
//

import UIKit

fileprivate struct Constants {
    static let constraint16: CGFloat = 16
    static let constraint24: CGFloat = 24
    static let fontSize18: CGFloat = 18
    static let numberOfLines = 0
    static let minimumScaleFactor: CGFloat = 0.5
    
    private init() {}
}

protocol DeckDelegate {
    func didTouchDeckButton(name: String)
}

class Deck: UIView {
    private lazy var deck: UIView = {
        return UIView()
    }()
    
    private lazy var titleDeck: UILabel = {
        return UILabel()
    }()
    
    private lazy var buttonDeck: UIButton = {
        return UIButton(type: .custom)
    }()
    
    var title: String? {
        didSet {
            titleDeck.text = title
        }
    }
    
    var delegate: DeckDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        viewCodeSetup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc private func selectDeck() {
        if let title = self.titleDeck.text {
            delegate?.didTouchDeckButton(name: title)
        }
    }
}

extension Deck: ViewCodeProtocol {
    func viewHierarchySetup() {
        addSubview(deck)
        deck.addSubview(titleDeck)
        deck.addSubview(buttonDeck)
    }
    
    func viewConstraintSetup() {
        setConstraintsDeck()
        setConstraintsTitleDeck()
        setConstraintsButtonDeck()
    }
    
    private func setConstraintsDeck() {
        deck.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        deck.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        deck.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        deck.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
    }
    
    private func setConstraintsTitleDeck() {
        titleDeck.bottomAnchor.constraint(equalTo: deck.bottomAnchor, constant: -Constants.constraint16).isActive = true
        titleDeck.leadingAnchor.constraint(equalTo: deck.leadingAnchor, constant: Constants.constraint16).isActive = true
        titleDeck.trailingAnchor.constraint(equalTo: deck.trailingAnchor, constant: -Constants.constraint16).isActive = true
        titleDeck.topAnchor.constraint(greaterThanOrEqualTo: deck.topAnchor, constant: Constants.constraint16).isActive = true
    }
    
    private func setConstraintsButtonDeck() {
        buttonDeck.topAnchor.constraint(equalTo: deck.topAnchor).isActive = true
        buttonDeck.bottomAnchor.constraint(equalTo: deck.bottomAnchor).isActive = true
        buttonDeck.leadingAnchor.constraint(equalTo: deck.leadingAnchor).isActive = true
        buttonDeck.trailingAnchor.constraint(equalTo: deck.trailingAnchor).isActive = true
    }
    
    func viewThemeSetup() {
        deck.translatesAutoresizingMaskIntoConstraints = false
        deck.backgroundColor = .random
        deck.borderCard()
        titleDeck.translatesAutoresizingMaskIntoConstraints = false
        titleDeck.textColor = .white
        titleDeck.font = .avenirRoman(Constants.fontSize18)
        titleDeck.numberOfLines = Constants.numberOfLines
        titleDeck.adjustsFontSizeToFitWidth = true
        titleDeck.minimumScaleFactor = Constants.minimumScaleFactor
        buttonDeck.translatesAutoresizingMaskIntoConstraints = false
        buttonDeck.addTarget(self, action: #selector(selectDeck), for: .touchUpInside)
    }
}
