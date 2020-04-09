//
//  HomeInteractor.swift
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

protocol HomeBusinessLogic {
    func fetchDeckSessions()
}

protocol HomeDataStore {
}

class HomeInteractor: HomeBusinessLogic, HomeDataStore {
    var presenter: HomePresentationLogic?
    var worker: HomeWorker?
    
    func fetchDeckSessions() {
        worker = HomeWorker()
        worker?.fetchDeckSessions(completion: { result in
            let response = Home.DeckSessions.Response(result: result)
            self.presenter?.presentDeckSessions(response: response)
        })
    }
}
