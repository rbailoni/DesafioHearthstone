//
//  HomeWorker.swift
//  DesafioHearthstone
//
//  Created by Ricardo Bailoni on 09/04/20.
//  Copyright (c) 2020 Ricardo Bailoni. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

fileprivate struct Constants {
    static var pathInfoURL = "info/"

    private init() {}
}

class HomeWorker {
    func fetchDeckSessions(completion: @escaping(Result<InfoResponse, ResponseError>) -> Void) {
        HearthstoneAPI.shared.fetchResource(path: Constants.pathInfoURL, completion: completion)
    }
}
