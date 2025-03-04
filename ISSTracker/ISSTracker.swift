//
//  ISSTracker.swift
//  ISSTracker
//
//  Created by Joe Fabre on 3/3/25.
//

import Foundation

struct ISSPosition: Codable {
    let latitude: Double
    let longitude: Double
    let altitude: Double
    let velocity: Double
}

class ISSTracker: ObservableObject {
    @Published var issLatitude: Double = 0.0
    @Published var issLongitude: Double = 0.0
    @Published var issAltitudeMiles: Double = 0.0
    @Published var issSpeedMph: Double = 0.0

    func fetchISSLocation() {
        guard let url = URL(string: "https://api.wheretheiss.at/v1/satellites/25544") else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, _ in
            if let data = data, let decodedResponse = try? JSONDecoder().decode(ISSPosition.self, from: data) {
                DispatchQueue.main.async {
                    self.issLatitude = decodedResponse.latitude
                    self.issLongitude = decodedResponse.longitude
                    self.issAltitudeMiles = decodedResponse.altitude * 0.621371 // Convert km to miles
                    self.issSpeedMph = decodedResponse.velocity * 0.621371  // Convert km/h to mph
                }
            }
        }.resume()
    }
}
