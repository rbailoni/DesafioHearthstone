//
//  ViewCodeProtocol.swift
//  DesafioHearthstone
//
//  Created by Ricardo Bailoni on 09/04/20.
//  Copyright © 2020 Ricardo Bailoni. All rights reserved.
//

import Foundation

protocol ViewCodeProtocol: class {
    func viewCodeSetup()
    func viewHierarchySetup()
    func viewConstraintSetup()
    func viewThemeSetup()
    func viewAdditionalSetup()
}

extension ViewCodeProtocol {
    func viewCodeSetup() {
        viewHierarchySetup()
        viewConstraintSetup()
        viewThemeSetup()
        viewAdditionalSetup()
    }
    
    func viewThemeSetup() {}
    
    func viewAdditionalSetup() {}
}
