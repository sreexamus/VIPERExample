//
//  SecondViewCoordinator.swift
//  VIPERExample
//
//  Created by Iragam Reddy, Sreekanth Reddy on 5/29/19.
//  Copyright © 2019 Iragam Reddy, Sreekanth Reddy. All rights reserved.
//

import Foundation


class SecondViewCoordinator {
    let viewController: SecondViewController
    let interacor: SecondViewInteractor
    let router: SecondViewRouter
    let presenter: SecondViewPresenter
    
    init(viewController: SecondViewController) {
        self.viewController = viewController
        interacor = SecondViewInteractor()
        presenter = SecondViewPresenter()
        router = SecondViewRouter()
        interacor.observer = self
        presenter.interactor = interacor
        self.viewController.presenter = presenter
        interacor.router = router
    }

}

extension SecondViewCoordinator: SecondInteractorObserver {
    func updatePeopleDetails(viewModel: PeopleDetails?, error: SecondDataError?) {
        if error == nil {
            viewController.selectedPerson = viewModel
        }
    }
}
