//
//  HomePresenter.swift
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
    static let sessionClasses = "Classes"
    static let sessionFactions = "Factions"
    static let sessionQualities = "Qualities"
    static let sessionRaces = "Races"
    static let sessionTypes = "Types"
    
    private init() {}
}

protocol HomePresentationLogic {
    func presentDeckSessions(response: Home.DeckSessions.Response)
}

class HomePresenter: HomePresentationLogic {
    weak var viewController: HomeDisplayLogic?
    
    func presentDeckSessions(response: Home.DeckSessions.Response) {
        switch response.result {
        case .failure(let error):
            DispatchQueue.main.async {
                self.viewController?.displayError(error: error)
            }
        case .success(let info):
            let viewModel = Home.DeckSessions.ViewModel(sessions: getDictionaryDeckSessions(info: info))
            DispatchQueue.main.async {
                self.viewController?.displayDeckSessions(viewModel: viewModel)
            }
        }
    }
    
    private func getDictionaryDeckSessions(info: InfoResponse) -> Dictionary<String, [String]>? {
        var returnDictionary = Dictionary<String, [String]>()
        if let classes = info.classes { returnDictionary[Constants.sessionClasses] = classes }
        if let factions = info.factions { returnDictionary[Constants.sessionFactions] = factions }
        if let qualities = info.qualities { returnDictionary[Constants.sessionQualities] = qualities }
        if let races = info.races { returnDictionary[Constants.sessionRaces] = races }
        if let types = info.types { returnDictionary[Constants.sessionTypes] = types }
        
        if returnDictionary.count > 0 {
            return returnDictionary
        }
        
        return nil
    }
}