import Foundation
import CoreLocation

class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
    private var locationManager = CLLocationManager()

    @Published var userLatitude: Double = 0.0
    @Published var userLongitude: Double = 0.0

    override init() {
        super.init()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation() // Start continuous updates
    }

    func requestLocation() {
        print("🔹 Requesting location update...")
        locationManager.requestLocation()
    }

    // ✅ Called when location updates successfully
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last {
            DispatchQueue.main.async {
                self.userLatitude = location.coordinate.latitude
                self.userLongitude = location.coordinate.longitude
                print("✅ Updated location: \(self.userLatitude), \(self.userLongitude)")
            }
        } else {
            print("⚠️ No valid location found")
        }
    }

    // ❌ Handle location errors
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("❌ Location error: \(error.localizedDescription)")
    }
}
