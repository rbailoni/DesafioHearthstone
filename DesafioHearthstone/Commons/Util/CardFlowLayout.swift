//
//  CardFlowLayout.swift
//  DesafioHearthstone
//
//  Created by Ricardo Bailoni on 09/04/20.
//  Copyright © 2020 Ricardo Bailoni. All rights reserved.
//

import UIKit

fileprivate struct Constants {
    static let innerSpace: CGFloat = 5
    static let numberOfCellsOnRow: CGFloat = 2
    static let proportion: CGFloat = 1.5
    
    private init() {}
}

class CardFlowLayout: UICollectionViewFlowLayout {
    override init() {
        super.init()
        self.minimumLineSpacing = Constants.innerSpace * 2
        self.minimumInteritemSpacing = Constants.innerSpace
        self.scrollDirection = .vertical
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func itemWidth() -> CGFloat {
        return (collectionView!.frame.size.width/Constants.numberOfCellsOnRow) - Constants.innerSpace
    }
    
    override var itemSize: CGSize {
        set {
            self.itemSize = CGSize(width: itemWidth(), height: itemWidth() * Constants.proportion)
        }
        get {
            return CGSize(width: itemWidth(), height: itemWidth() * Constants.proportion)
        }
    }
}
