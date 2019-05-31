//
//  FirstViewControllerInteractor.swift
//  VIPERExample
//
//  Created by Iragam Reddy, Sreekanth Reddy on 5/29/19.
//  Copyright © 2019 Iragam Reddy, Sreekanth Reddy. All rights reserved.
//

import Foundation
import Alamofire

protocol FirstPresenterInteractorDelegate {
    func fetchPeopleData()
    func didSelectPerson(person: People)
}

protocol FirstViewInteractorObserver: class {
    func updateViewModel(viewModel: PeopleEntityViewModel?, error: FirstDataError?)
}

class FirstInteractor: FirstPresenterInteractorDelegate{
    weak var observer: FirstViewInteractorObserver?
    var router: FirstViewControllerRouter?
    func fetchPeopleData() {
        // avoiding call as we dont have dummy service so using the
        

        guard let url = Bundle(for: FirstInteractor.self).url(forResource: "People", withExtension: "json"), let data = try? Data(contentsOf: url) else {
            observer?.updateViewModel(viewModel: nil, error: FirstDataError.nodata)
            return
        }
        
        var peopleEntity:PeopleEntityViewModel?
        do {
            peopleEntity = try JSONDecoder().decode(PeopleEntityViewModel.self, from: data)
        } catch {
            print(error)
        }
        
        observer?.updateViewModel(viewModel: peopleEntity, error: nil)
    }
    
    func didSelectPerson(person: People) {
        router?.navigateToDetailsScreen(selectedIndex: Int(person.Id) ?? 233)
    }
}

enum FirstDataError: Error {
    case nodata
}
