//
//  Aviatrix.swift
//  AviatrixApp
//
//  Created by Amy Holt on 6/10/18.
//  Copyright © 2018 Amy Holt. All rights reserved.
//

import Foundation

class Aviatrix {
    
    var Author = ""
    var data = AviatrixData()
    var currentLocation = "St. Louis"
    var distanceTraveled = 0
    var maxFuel = 5000 //gallons
    var fuelLevel = 5000.0 //gallons
    var milesPerGallon = 0.4 //mpg
    var cost
    
    init(userName : String) {
        Author = userName
    }
    
    var running = false
    
    func start() -> Bool {
        running = true
        return running
    }
    
    func refuel() -> Double {
        
        let gallonsNeeded = Double(maxFuel) - fuelLevel
        
        let data = AviatrixData()
        
        fuelCost += gallonsNeeded * data.fuelPrices[currentLocation]!
        
        fuelLevel = 5000.0
        
        return gallonsNeeded

    }
    
    func flyTo(destination : String) {
        //// car, bart station, bart, walked, shuttle 1, shuttle 2, walked
        
        distanceTraveled += distanceTo(currentLocation: currentLocation, target: destination)

        let fuelSpent = Double(distanceTraveled) / milesPerGallon
        
        fuelLevel -= fuelSpent
        currentLocation = destination
        
    }
    
    func distanceTo(currentLocation : String, target : String) -> Int {
        return data.knownDistances[currentLocation]![target]!
    }

    func knownDestinations() -> [String] {
       return ["St. Louis", "Phoenix", "Denver", "SLC"]
    }
}
