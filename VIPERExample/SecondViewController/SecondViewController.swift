//
//  SecondViewController.swift
//  VIPERExample
//
//  Created by Iragam Reddy, Sreekanth Reddy on 5/29/19.
//  Copyright © 2019 Iragam Reddy, Sreekanth Reddy. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    var presenter: SecondViewPresenterDelegate?
    var location: UILabel!
    var passoport: UILabel!
    
    var selectedPerson: PeopleDetails? {
        didSet {
            setData()
        }
    }
    
    class func getViewController() -> SecondViewController {
        return SecondViewController()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .yellow
        location = UILabel(frame: .zero)
        passoport = UILabel(frame: .zero)
        location.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(location)
        NSLayoutConstraint.activate([
            location.heightAnchor.constraint(equalToConstant: 40),
            location.topAnchor.constraint(equalTo: view.topAnchor, constant: 160),
            location.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10),
            location.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 10)
            ])
        
        passoport.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(passoport)
        
        NSLayoutConstraint.activate([
            passoport.heightAnchor.constraint(equalToConstant: 40),
            passoport.topAnchor.constraint(equalTo: location.bottomAnchor, constant: 20),
            passoport.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10),
            passoport.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 10)
            ])
        presenter?.fetchPeopleDetails()
        // Do any additional setup after loading the view.
    }
    
    func setData() {
        print(location.isEnabled)
        location.text = selectedPerson?.address
        passoport.text = selectedPerson?.passport
    }
}

