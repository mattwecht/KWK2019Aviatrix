//
//  Aviatrix.swift
//  AviatrixApp
//
//  Created by Amy Holt on 6/10/18.
//  Copyright © 2018 Amy Holt. All rights reserved.
//

import Foundation

class Aviatrix {
    
    var running = false
    var author: String
    var data = AviatrixData()//allow access to data held in data file (can these be made "public")
    var location = "St. Louis"
    var distanceTraveled = 0
    var maxFuel = 5000.0
    var fuelLevel = 5000.0
    var milesPerGallon = 0.4
    var fuelCost = 0.0
    
    init(author: String) {
        self.author = author //alt way of referencing a class var (this in other languages?) 
    }
    func start() -> Bool {
        running = true
        return running
    }
    
    func refuel() -> Double {
        let temp = self.maxFuel - self.fuelLevel
        self.fuelLevel = self.maxFuel
        return temp
    }
    
    func flyTo(destination : String) {
        let newDistance = distanceTo(currentLocation: self.location, target: destination) //not required but cleans up code
        self.distanceTraveled += newDistance
        self.fuelLevel = fuelLevel - (Double(newDistance) * milesPerGallon)
        self.location = destination //do we need to use self in this case? Either way it seems to make code clear
    }
    
    func distanceTo(currentLocation: String, target : String) -> Int {
        return data.knownDistances[currentLocation]![target]!
    }
    
    func knownDestinations() -> [String] {
       return ["St. Louis", "Phoenix", "Denver", "SLC"]
    }
}
