//
//  HomeRouter.swift
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

@objc protocol HomeRoutingLogic {
    func routeToCards(segue: UIStoryboardSegue?)
}

protocol HomeDataPassing {
    var dataStore: HomeDataStore? { get }
}

class HomeRouter: NSObject, HomeRoutingLogic, HomeDataPassing {
    weak var viewController: HomeViewController?
    var dataStore: HomeDataStore?
    
    func routeToCards(segue: UIStoryboardSegue?) {
        if let segue = segue {
            let destinationVC = segue.destination as! CardsViewController
            var destinationDS = destinationVC.router!.dataStore!
            passDataToCards(source: dataStore!, destination: &destinationDS)
        } else {
            let destinationVC = CardsViewController()
            var destinationDS = destinationVC.router!.dataStore!
            passDataToCards(source: dataStore!, destination: &destinationDS)
            navigateToCards(source: viewController!, destination: destinationVC)
        }
    }
    
    private func navigateToCards(source: HomeViewController, destination: CardsViewController) {
        destination.modalPresentationStyle = .fullScreen
        source.show(destination, sender: nil)
    }
    
    private func passDataToCards(source: HomeDataStore, destination: inout CardsDataStore) {
        destination.nameSelected = source.nameSelected
        destination.sessionSelected = source.sessionSelected
    }
}
