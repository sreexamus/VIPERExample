//
//  PeopleEntity.swift
//  VIPERExample
//
//  Created by Iragam Reddy, Sreekanth Reddy on 5/29/19.
//  Copyright © 2019 Iragam Reddy, Sreekanth Reddy. All rights reserved.
//

import Foundation

struct PeopleEntityViewModel: Decodable {
    let people:[People]
    enum CodingKeys: String, CodingKey {
        case people = "results"
    }
}

struct People: Decodable {
    let name: String
    let Id: String
}
