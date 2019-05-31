//
//  FirstViewControllerPresenter.swift
//  VIPERExample
//
//  Created by Iragam Reddy, Sreekanth Reddy on 5/29/19.
//  Copyright © 2019 Iragam Reddy, Sreekanth Reddy. All rights reserved.
//

import Foundation

protocol FirstViewPresenterDelegate {
    func fetchPeople()
    func didSelectPerson(person: People)
}

class FirstPresenter: FirstViewPresenterDelegate {
    var interactor: FirstPresenterInteractorDelegate?
    func fetchPeople() {
        interactor?.fetchPeopleData()
    }
    
    func didSelectPerson(person: People) {
        interactor?.didSelectPerson(person: person)
    }
}

