//
//  CovidDataModel.swift
//  Covid-Tracker
//
//  Created by Naidas on 4/25/20.
//  Copyright © 2020 Naidas. All rights reserved.
//

import Foundation


struct CovidDataModel: Codable {
    
    
    let dateTimeUpdated: Int
    let countryName: String
    
    let totalCases: Int
    let totalDeaths: Int
    
    let casesToday: Int
    let deathsToday: Int
    let totalRecovered: Int
    let totalTests: Int
    
    var dateTimeUpdatedString: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        
        let DTString = formatter.string(from: Date())
        
        return DTString
    }
    
    var totalCasesString: String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        return numberFormatter.string(from: NSNumber(value: totalCases)) ?? ""
    }
    
    var totalDeathsString: String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        return numberFormatter.string(from: NSNumber(value: totalDeaths)) ?? ""
    }
    
    var casesTodayString: String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        return numberFormatter.string(from: NSNumber(value: casesToday)) ?? ""
    }
    
    var deathsTodayString: String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        return numberFormatter.string(from: NSNumber(value: deathsToday)) ?? ""
    }
    
    var totalRecoveredString: String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        return numberFormatter.string(from: NSNumber(value: totalRecovered)) ?? ""
    }
    
    var totalTestsString: String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        return numberFormatter.string(from: NSNumber(value: totalTests)) ?? ""
    }
    
    
}

struct WorldCovidDataModel: Codable {
    
    let dateTimeUpdated: Int
    
    let totalCases: Int
    let totalDeaths: Int
    
    let casesToday: Int
    let deathsToday: Int
    let totalRecovered: Int
    let totalTests: Int
    
    var dateTimeUpdatedString: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        
        let DTString = formatter.string(from: Date())
        
        return DTString
    }
    
    var totalCasesString: String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        return numberFormatter.string(from: NSNumber(value: totalCases)) ?? ""
    }
    
    var totalDeathsString: String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        return numberFormatter.string(from: NSNumber(value: totalDeaths)) ?? ""
    }
    
    var casesTodayString: String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        return numberFormatter.string(from: NSNumber(value: casesToday)) ?? ""
    }
    
    var deathsTodayString: String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        return numberFormatter.string(from: NSNumber(value: deathsToday)) ?? ""
    }
    
    var totalRecoveredString: String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        return numberFormatter.string(from: NSNumber(value: totalRecovered)) ?? ""
    }
    
    var totalTestsString: String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        return numberFormatter.string(from: NSNumber(value: totalTests)) ?? ""
    }
    
}
