import Foundation
import CoreLocation

class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
    private let locationManager = CLLocationManager()
    
    @Published var userLatitude: Double = 0.0
    @Published var userLongitude: Double = 0.0
    
    override init() {
        super.init()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization() // ✅ Request Permission
        locationManager.startUpdatingLocation() // ✅ Start getting location
    }
    
    func requestLocation() {
        print("🔹 Requesting Location Authorization...")
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        DispatchQueue.main.async {
            self.userLatitude = location.coordinate.latitude
            self.userLongitude = location.coordinate.longitude
            print("✅ Updated location: \(self.userLatitude), \(self.userLongitude)") // ✅ Debug log
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("❌ Error getting location: \(error.localizedDescription)") // ✅ Shows Detailed Error
        if let clError = error as? CLError {
            switch clError.code {
            case .denied:
                print("❌ Location access was denied. Go to Settings to enable it.")
            case .locationUnknown:
                print("⚠️ Unable to determine location.")
            default:
                print("❌ Unexpected error: \(clError.localizedDescription)")
            }
        }
    }
}


//import Foundation
//import CoreLocation
//
//class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
//    private var locationManager = CLLocationManager()
//    
//    @Published var authorizationStatus: CLAuthorizationStatus = .notDetermined
//    @Published var userLocation: CLLocationCoordinate2D?
//
//    override init() {
//        super.init()
//        self.locationManager.delegate = self
//        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
//    }
//    
//    func requestPermission() {
//        locationManager.requestWhenInUseAuthorization()
//    }
//    
//    func startUpdatingLocation() {
//        locationManager.startUpdatingLocation()
//    }
//
//    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
//        DispatchQueue.main.async {
//            self.authorizationStatus = status
//            if status == .authorizedWhenInUse || status == .authorizedAlways {
//                self.startUpdatingLocation()
//            }
//        }
//    }
//
//    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
//        if let location = locations.last {
//            DispatchQueue.main.async {
//                self.userLocation = location.coordinate
//            }
//        }
//    }
//}
