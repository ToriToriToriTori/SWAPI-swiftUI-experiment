//
//  Character.swift
//  SWAPI-SwiftUI
//
//  Created by Tori George on 1/31/20.
//  Copyright © 2020 Tori George. All rights reserved.
//

import Foundation

struct Character: Codable {
    var name: String
    var birth_year: String
    var eye_color: String
    var gender: String
    var hair_color: String
    var height: String
    var homeworld: String
    var films: [String]
    var starships: [String]
}
