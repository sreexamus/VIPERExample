//
//  SecondViewControllerPresenter.swift
//  VIPERExample
//
//  Created by Iragam Reddy, Sreekanth Reddy on 5/29/19.
//  Copyright © 2019 Iragam Reddy, Sreekanth Reddy. All rights reserved.
//

import Foundation

protocol SecondViewPresenterDelegate {
    func fetchPeopleDetails()
}



class SecondViewPresenter: SecondViewPresenterDelegate {
    
    var interactor: SecondPresenterInteractorDelegate?
    
    func fetchPeopleDetails() {
        interactor?.fetchPeopleDetailsData()
    }
}
