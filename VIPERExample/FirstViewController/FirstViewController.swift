//
//  ViewController.swift
//  VIPERExample
//
//  Created by Iragam Reddy, Sreekanth Reddy on 5/29/19.
//  Copyright © 2019 Iragam Reddy, Sreekanth Reddy. All rights reserved.
//

import UIKit

extension UIView {
    func addEdgeConstrained(subview: UIView, insets: UIEdgeInsets = UIEdgeInsets.zero) {
        subview.translatesAutoresizingMaskIntoConstraints = false
        addSubview(subview)
        subview.topAnchor.constraint(equalTo: topAnchor, constant: insets.top).isActive = true
        subview.leftAnchor.constraint(equalTo: leftAnchor, constant: insets.left).isActive = true
        subview.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -insets.bottom).isActive = true
        subview.rightAnchor.constraint(equalTo: rightAnchor, constant: -insets.right).isActive = true
    }
}

class FirstViewController: UIViewController {
    var firstTabView: UITableView?
    var presenter: FirstViewPresenterDelegate?
    var viewModel: PeopleEntityViewModel? {
        didSet {
            firstTabView?.reloadData()
            view.setNeedsLayout()
            view.setNeedsDisplay()
        }
    }
    
    class func getViewController() -> FirstViewController {
        return FirstViewController()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    
        firstTabView = UITableView(frame: CGRect(origin: .zero, size: CGSize(width: 320, height: 440)), style: .plain)
        firstTabView?.delegate = self
        firstTabView?.dataSource = self

        
        firstTabView?.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        view.addEdgeConstrained(subview: firstTabView!)
        
        presenter?.fetchPeople()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func showError() {
        print("Error")
    }
}

extension FirstViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.people.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        cell.textLabel?.text = viewModel?.people[indexPath.row].name
        cell.detailTextLabel?.text = "\(viewModel?.people[indexPath.row].Id)"
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 66
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let person = viewModel?.people[indexPath.row] else { return }
        presenter?.didSelectPerson(person: person)
    }
}

