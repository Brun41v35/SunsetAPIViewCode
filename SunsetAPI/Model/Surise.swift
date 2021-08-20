//
//  Model.swift
//  SunsetAPI
//
//  Created by Bruno Silva on 19/08/21.
//

import Foundation

struct Surise: Codable {
    
    //MARK: - Properties
    let results: Results
}

struct Results: Codable {
    
    //MARK: - Properties
    let sunrise: String
    let sunset: String
}
