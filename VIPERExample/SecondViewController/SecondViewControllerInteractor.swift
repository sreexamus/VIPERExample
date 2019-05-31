//
//  SecondViewControllerInteractor.swift
//  VIPERExample
//
//  Created by Iragam Reddy, Sreekanth Reddy on 5/29/19.
//  Copyright © 2019 Iragam Reddy, Sreekanth Reddy. All rights reserved.
//

import Foundation

protocol SecondPresenterInteractorDelegate {
    func fetchPeopleDetailsData()
}

protocol SecondInteractorObserver {
    func updatePeopleDetails(viewModel: PeopleDetails?, error: SecondDataError?)
}

class SecondViewInteractor: SecondPresenterInteractorDelegate {
    
    var observer: SecondInteractorObserver?
    var router: SecondViewRouterDelegate?
    var selectedIndex: Int?
    
    func fetchPeopleDetailsData() {
        // avoiding call as we dont have dummy service so using the
        
        
        guard let url = Bundle(for: FirstInteractor.self).url(forResource: "PeopleDetails", withExtension: "json"), let data = try? Data(contentsOf: url), let selectedIndex = selectedIndex else {
            observer?.updatePeopleDetails(viewModel: nil, error: .nodata)
            return
        }
        
        var peopleDetailsEntity:PeopleDetailEntityViewModel?
        do {
            peopleDetailsEntity = try JSONDecoder().decode(PeopleDetailEntityViewModel.self, from: data)
        } catch {
            print(error)
        }
        
        guard var peopleDetails = peopleDetailsEntity else {
            observer?.updatePeopleDetails(viewModel: nil, error: .nodata)
            return
        }
        let selectedPerson = peopleDetails.personDetails.filter {Int($0.Id) == selectedIndex}.first
        observer?.updatePeopleDetails(viewModel: selectedPerson, error: nil)
    }
}

enum SecondDataError: Error {
    case nodata
}
