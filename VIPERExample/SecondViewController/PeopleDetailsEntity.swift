//
//  PeopleDetailsEntity.swift
//  VIPERExample
//
//  Created by Iragam Reddy, Sreekanth Reddy on 5/29/19.
//  Copyright © 2019 Iragam Reddy, Sreekanth Reddy. All rights reserved.
//

import Foundation

struct PeopleDetailEntityViewModel: Decodable {
    let personDetails:[PeopleDetails]
    enum CodingKeys: String, CodingKey {
        case personDetails = "results"
    }
}

struct PeopleDetails: Decodable {
    let address: String
    let Id: String
    let passport: String
}
