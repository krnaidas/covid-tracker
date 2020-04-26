//
//  WorldCovidData.swift
//  Covid-Tracker
//
//  Created by Naidas on 4/26/20.
//  Copyright © 2020 Naidas. All rights reserved.
//

import Foundation

struct WorldCovidData: Codable {
    
    var updated: Int
    let cases: Int
    let todayCases: Int
    let deaths: Int
    let todayDeaths: Int
    let recovered: Int
    let tests: Int
}
