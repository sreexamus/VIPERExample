//
//  FirstViewControllerRouter.swift
//  VIPERExample
//
//  Created by Iragam Reddy, Sreekanth Reddy on 5/29/19.
//  Copyright © 2019 Iragam Reddy, Sreekanth Reddy. All rights reserved.
//

import Foundation

protocol FirstViewRouterDelegate {
    func navigateToDetailsScreen(selectedIndex: Int)
}

class FirstViewControllerRouter: FirstViewRouterDelegate {
    weak var viewController: FirstViewController?
    
    func navigateToDetailsScreen(selectedIndex: Int) {
        let secondVc = SecondViewController.getViewController()
        let secondCoordinator =  SecondViewCoordinator(viewController: secondVc)
        secondCoordinator.interacor.selectedIndex = selectedIndex
        viewController?.navigationController?.show(secondCoordinator.viewController, sender: nil)
    }
}
