import SwiftUI
import MapKit
import CoreLocation

struct ContentView: View {
    @StateObject private var locationManager = LocationManager()
    @StateObject private var issTracker = ISSTracker()
    @State private var speechManager = SpeechManager()
    @State private var isMuted = false
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 0, longitude: 0),
        span: MKCoordinateSpan(latitudeDelta: 50, longitudeDelta: 50)
    )
    
    var distanceMiles: Double {
        calculateDistance(
            lat1: locationManager.userLatitude,
            lon1: locationManager.userLongitude,
            lat2: issTracker.issLatitude,
            lon2: issTracker.issLongitude
        )
    }

    var body: some View {
        NavigationView {
            VStack {
                Text("🚀 ISS Tracker")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.top, 10)

                Map {
                    Marker("🛰️ ISS", coordinate: CLLocationCoordinate2D(
                        latitude: issTracker.issLatitude,
                        longitude: issTracker.issLongitude
                    ))
                }
                .frame(height: 250)
                .cornerRadius(15)
                .padding()

                List {
                    Section(header: Text("Your Location").font(.headline)) {
                        InfoRow(icon: "location.fill", label: "Latitude", value: String(format: "%.6f", locationManager.userLatitude))
                        InfoRow(icon: "location.fill", label: "Longitude", value: String(format: "%.6f", locationManager.userLongitude))
                    }

                    Section(header: Text("ISS Information").font(.headline)) {
                        InfoRow(icon: "globe", label: "ISS Latitude", value: String(format: "%.6f", issTracker.issLatitude))
                        InfoRow(icon: "globe", label: "ISS Longitude", value: String(format: "%.6f", issTracker.issLongitude))
                        InfoRow(icon: "arrow.up", label: "Altitude", value: String(format: "%.2f miles", issTracker.issAltitudeMiles))
                        InfoRow(icon: "speedometer", label: "Speed", value: String(format: "%.2f mph", issTracker.issSpeedMph))
                    }

                    Section(header: Text("Distance to ISS").font(.headline)) {
                        InfoRow(icon: "ruler", label: "Distance", value: String(format: "%.2f miles", distanceMiles))
                    }
                }
                .frame(maxHeight: 300)
                .listStyle(InsetGroupedListStyle())

                Button(action: {
                    isMuted.toggle()
                }) {
                    HStack {
                        Image(systemName: isMuted ? "speaker.slash.fill" : "speaker.wave.2.fill")
                        Text(isMuted ? "Muted" : "Unmuted")
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(isMuted ? Color.red : Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                }
                .padding(.horizontal)

                Spacer()
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("ISS Tracker")
                        .font(.headline)
                        .fontWeight(.bold)
                }
            }
        }
        .onAppear {
            print("🔹 Requesting location updates")
            locationManager.requestLocation()
            issTracker.fetchISSLocation()
        }
        .onReceive(Timer.publish(every: 10, on: .main, in: .common).autoconnect()) { _ in
            print("🔄 Updating Location & ISS Data")
            locationManager.requestLocation()
            issTracker.fetchISSLocation()
            
            // ✅ Ensure region updates
            region.center = CLLocationCoordinate2D(latitude: issTracker.issLatitude, longitude: issTracker.issLongitude)

            if !isMuted {
                speechManager.speak("The ISS is \(Int(distanceMiles)) miles away from you.")
            }
        }
    }
}

// ✅ InfoRow Component
struct InfoRow: View {
    var icon: String
    var label: String
    var value: String

    var body: some View {
        HStack {
            Image(systemName: icon)
                .foregroundColor(.blue)
                .frame(width: 25)
            Text(label)
            Spacer()
            Text(value)
                .fontWeight(.bold)
                .foregroundColor(.gray)
        }
        .padding(10)
        .background(RoundedRectangle(cornerRadius: 8).fill(Color.gray.opacity(0.2)))
    }
}

// ✅ Ensure ISSTracker is identifiable
extension ISSTracker: Identifiable {
    var id: UUID { UUID() }
}
