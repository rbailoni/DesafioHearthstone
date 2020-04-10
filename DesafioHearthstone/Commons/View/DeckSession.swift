//
//  DeckSession.swift
//  DesafioHearthstone
//
//  Created by Ricardo Bailoni on 09/04/20.
//  Copyright © 2020 Ricardo Bailoni. All rights reserved.
//

import UIKit

fileprivate struct Constants {
    static let constraint10: CGFloat = 10
    static let constraint12: CGFloat = 12
    static let constraint16: CGFloat = 16
    static let constraint22: CGFloat = 22
    static let constraint24: CGFloat = 24
    static let constraint40: CGFloat = 40
    static let constraint104: CGFloat = 104
    static let constraint144: CGFloat = 144
    static let priority250 = UILayoutPriority(rawValue: 250)
    static let fontSize16: CGFloat = 16
    
    private init() {}
}

protocol DeckSessionDelegate {
    func didSelectDeck(session: String, name: String)
}

class DeckSession: UIView {
    private lazy var titleSession: UILabel = {
        return UILabel()
    }()
    
    private lazy var scrollView: UIScrollView = {
        return UIScrollView()
    }()
    
    private lazy var contentView: UIView = {
        return UIView()
    }()
    
    var title: String? {
        didSet {
            titleSession.text = title
        }
    }
    
    var titleDecks: [String]? {
        didSet {
            setDecks(titleDecks)
        }
    }
    
    var delegate: DeckSessionDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        viewCodeSetup()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setDecks(_ titles: [String]?) {
        contentView.subviews.forEach { $0.removeFromSuperview() }
        guard let titles = titles else { return }
        var decks = [Deck]()
        titles.forEach {
            let deck = Deck()
            deck.title = $0
            deck.delegate = self
            deck.translatesAutoresizingMaskIntoConstraints = false
            decks.append(deck)
            contentView.addSubview(deck)
        }
        setConstraintsDecks(decks: decks)
    }
    
    private func setConstraintsDecks(decks: [Deck]) {
        for (index, deck) in decks.enumerated() {
            if deck == decks.first {
                deck.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Constants.constraint24).isActive = true
            } else {
                deck.leadingAnchor.constraint(equalTo: decks[index - 1].trailingAnchor, constant: Constants.constraint16).isActive = true
            }
            deck.topAnchor.constraint(equalTo: contentView.topAnchor, constant: Constants.constraint10).isActive = true
            deck.widthAnchor.constraint(equalToConstant: Constants.constraint144).isActive = true
            deck.heightAnchor.constraint(equalToConstant: Constants.constraint104).isActive = true
            deck.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -Constants.constraint12).isActive = true
            if deck == decks.last {
                deck.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -Constants.constraint24).isActive = true
            }
        }
    }
}

extension DeckSession: ViewCodeProtocol {
    func viewHierarchySetup() {
        addSubview(titleSession)
        addSubview(scrollView)
        scrollView.addSubview(contentView)
    }
    
    func viewConstraintSetup() {
        setConstraintsTitleSession()
        setConstraintsScrollView()
        setConstraintsContentView()
    }
    
    private func setConstraintsTitleSession() {
        titleSession.topAnchor.constraint(equalTo: self.topAnchor, constant: Constants.constraint12).isActive = true
        titleSession.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Constants.constraint40).isActive = true
        titleSession.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -Constants.constraint16).isActive = true
        titleSession.heightAnchor.constraint(equalToConstant: Constants.constraint22).isActive = true
    }
    
    private func setConstraintsScrollView() {
        scrollView.topAnchor.constraint(equalTo: titleSession.bottomAnchor).isActive = true
        scrollView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    }
    
    private func setConstraintsContentView() {
        contentView.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
        contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor).isActive = true
        contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor).isActive = true
        contentView.heightAnchor.constraint(equalTo: scrollView.heightAnchor).isActive = true
        contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor).usePriority(Constants.priority250).isActive = true
    }
    
    func viewThemeSetup() {
        titleSession.translatesAutoresizingMaskIntoConstraints = false
        titleSession.textColor = .cinza
        titleSession.font = .avenir(Constants.fontSize16)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.showsVerticalScrollIndicator = false
        scrollView.showsHorizontalScrollIndicator = false
        contentView.translatesAutoresizingMaskIntoConstraints = false
    }
}

extension DeckSession: DeckDelegate {
    func didTouchDeckButton(name: String) {
        if let session = title {
            delegate?.didSelectDeck(session: session, name: name)
        }
    }
}
