//
//  FirstViewCoordinator.swift
//  VIPERExample
//
//  Created by Iragam Reddy, Sreekanth Reddy on 5/29/19.
//  Copyright © 2019 Iragam Reddy, Sreekanth Reddy. All rights reserved.
//

import Foundation

final class FirstViewCoordinator {
    
    let viewController: FirstViewController
    let presenter: FirstPresenter
    let interactor: FirstInteractor
    let router: FirstViewControllerRouter
    
    init(viewController: FirstViewController) {
        presenter = FirstPresenter()
        router = FirstViewControllerRouter()
        interactor = FirstInteractor()
        presenter.interactor = interactor
        interactor.router = router
        self.viewController = viewController
        router.viewController = viewController
        viewController.presenter = presenter
        interactor.observer = self
    }
}

extension FirstViewCoordinator: FirstViewInteractorObserver {
    func updateViewModel(viewModel: PeopleEntityViewModel?, error: FirstDataError?) {
        if error == nil {
            viewController.viewModel = viewModel
        } else {
            viewController.showError()
        }
    }
}
