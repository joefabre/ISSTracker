//
//  DistanceCalculator.swift
//  ISSTracker
//
//  Created by Joe Fabre on 3/3/25.
//

import Foundation

func calculateDistance(lat1: Double, lon1: Double, lat2: Double, lon2: Double) -> Double {
    let radius = 6371.0 * 0.621371 // Earth's radius in miles
    let dLat = (lat2 - lat1).degreesToRadians
    let dLon = (lon2 - lon1).degreesToRadians
    let a = sin(dLat/2) * sin(dLat/2) +
            cos(lat1.degreesToRadians) * cos(lat2.degreesToRadians) * sin(dLon/2) * sin(dLon/2)
    let c = 2 * atan2(sqrt(a), sqrt(1-a))
    return radius * c
}

extension Double {
    var degreesToRadians: Double { self * .pi / 180 }
}
