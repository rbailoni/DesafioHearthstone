//
//  InfoResponse.swift
//  DesafioHearthstone
//
//  Created by Ricardo Bailoni on 09/04/20.
//  Copyright © 2020 Ricardo Bailoni. All rights reserved.
//

import Foundation

struct InfoResponse: Codable {
    let classes: [String]?
    let types: [String]?
    let factions: [String]?
    let qualities: [String]?
    let races: [String]?
}
