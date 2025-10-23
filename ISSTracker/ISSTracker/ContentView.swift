
import SwiftUI
import MapKit
import CoreLocation

struct ContentView: View {
    @StateObject private var locationManager = LocationManager()
    @StateObject private var issTracker = ISSTracker()
    @State private var isMuted = false
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 0, longitude: 0),
        span: MKCoordinateSpan(latitudeDelta: 50, longitudeDelta: 50)
    )
    @State private var showingSettings = false
    @State private var userInteracted = false

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

                Text("FABREulous Technologies!")
                    .font(.subheadline)
                    .fontWeight(.regular)
                    .padding(.bottom, 10)

                Map(coordinateRegion: $region, annotationItems: [
                    UserLocation(latitude: locationManager.userLatitude, longitude: locationManager.userLongitude, icon: "location.north.fill", label: "Me"),
                    UserLocation(latitude: issTracker.issLatitude, longitude: issTracker.issLongitude, icon: "🛰️", label: "ISS")
                ]) { location in
                    MapAnnotation(coordinate: CLLocationCoordinate2D(latitude: location.latitude, longitude: location.longitude)) {
                        VStack {
                            if location.icon == "location.north.fill" {
                                Image(systemName: location.icon)
                                    .foregroundColor(.red)
                                    .scaleEffect(0.35)
                                    .fontWeight(.bold)
                            } else {
                                Text(location.icon)
                                    .font(.callout)
                                    .scaleEffect(0.90)
                                
                            }
                            Text(location.label)
                                .font(.caption)
                                .foregroundColor(.white)
                                .fontWeight(.bold)
                        }
                    }
                }
                .frame(height: 250)
                .cornerRadius(15)
                .padding()
                .gesture(
                    DragGesture()
                        .onChanged { _ in userInteracted = true }
                )
                .overlay(
                    VStack {
                        HStack {
                            Spacer()
                            Button(action: zoomIn) {
                                Image(systemName: "plus")
                                    .foregroundColor(.white)
                                    .frame(width: 50, height: 50)
                                    .background(Color.blue)
                                    .clipShape(Circle())
                                    .scaleEffect(0.75)
                            }
                            .padding()
                        }
                        Spacer()
                        HStack {
                            Spacer()
                            Button(action: zoomOut) {
                                Image(systemName: "minus")
                                    .foregroundColor(.white)
                                    .frame(width: 50, height: 50)
                                    .background(Color.blue)
                                    .clipShape(Circle())
                                    .scaleEffect(0.75)
                            }
                            .padding()
                        }
                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomTrailing)
                    }
                )

                List {
                    Section(header: Text("Your Location").font(.headline).foregroundColor(.black)) {
                        InfoRow(icon: "location.fill", label: "Latitude", value: String(format: "%.2f", locationManager.userLatitude))
                        InfoRow(icon: "location.fill", label: "Longitude", value: String(format: "%.2f", locationManager.userLongitude))
                    }

                    Section(header: Text("ISS Information").font(.headline).foregroundColor(.black)) {
                        InfoRow(icon: "globe", label: "ISS Latitude", value: String(format: "%.2f", issTracker.issLatitude))
                        InfoRow(icon: "globe", label: "ISS Longitude", value: String(format: "%.2f", issTracker.issLongitude))
                        InfoRow(icon: "arrow.up", label: "Altitude", value: String(format: "%.0f miles", issTracker.issAltitudeMiles))
                        InfoRow(icon: "speedometer", label: "Speed", value: String(format: "%.0f mph", issTracker.issSpeedMph))
                    }

                            Section(header: Text("Distance to ISS").font(.headline).foregroundColor(.black)) {
                        InfoRow(icon: "ruler", label: "Distance", value: String(format: "%.0f miles", distanceMiles))
                    }
                }
                .frame(maxHeight: 300)
                .listStyle(InsetGroupedListStyle())

                HStack {
                    Button(action: {
                        //SoundManager.shared.playClickSound()
                        region.center = CLLocationCoordinate2D(latitude: locationManager.userLatitude, longitude: locationManager.userLongitude)
                    }) {
                        HStack {
                            Image(systemName: "house.fill")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 20, height: 20)
                            Text("")
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                    }
                    .frame(width: 100)

                    Spacer()

                    Button(action: {
                        isMuted.toggle()
                    }) {
                        HStack {
                            Image(systemName: isMuted ? "speaker.slash.fill" : "speaker.wave.2.fill")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 20, height: 20)
                            Text(isMuted ? "" : "")
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(isMuted ? Color.red : Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                    }
                    .frame(width: 100)

                    Spacer()

                    Button(action: {
                        SoundManager.shared.playClickSound()
                        region.center = CLLocationCoordinate2D(latitude: issTracker.issLatitude, longitude: issTracker.issLongitude)
                    }) {
                        HStack {
                            Image(systemName: "antenna.radiowaves.left.and.right")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 20, height: 20)
                            Text("")
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                    }
                    .frame(width: 100)
                }
                .padding(.horizontal)

                Spacer()
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("")
                        .font(.headline)
                        .fontWeight(.bold)
                }
                ToolbarItem(placement: .bottomBar) {
                    HStack {
                        Spacer()
                        Text("Version 1.0.3 - \(Date(), formatter: dateFormatter)")
                            .font(.footnote)
                        Spacer()
                        Button(action: {
                            showingSettings.toggle()
                        }) {
                            Image(systemName: "gearshape.fill")
                        }
                    }
                }
            }
            .sheet(isPresented: $showingSettings) {
                SettingsView()
            }
        }
        .onAppear {
            locationManager.requestLocation()
            issTracker.fetchISSLocation()
            region.center = CLLocationCoordinate2D(latitude: issTracker.issLatitude, longitude: issTracker.issLongitude)
        }
        .onReceive(Timer.publish(every: 1, on: .main, in: .common).autoconnect()) { _ in
            locationManager.requestLocation()
            issTracker.fetchISSLocation()
            if !userInteracted {
                region.center = CLLocationCoordinate2D(latitude: issTracker.issLatitude, longitude: issTracker.issLongitude)
            }

            if !isMuted {
                let speechManager = SpeechManager()
                speechManager.speak("The ISS is \(Int(distanceMiles)) miles away from you.")
            }
        }
    }

    private func zoomIn() {
        var newRegion = region
        newRegion.span.latitudeDelta /= 2.0
        newRegion.span.longitudeDelta /= 2.0
        region = newRegion
    }

    private func zoomOut() {
        var newRegion = region
        newRegion.span.latitudeDelta = min(newRegion.span.latitudeDelta * 2.0, 180.0)
        newRegion.span.longitudeDelta = min(newRegion.span.longitudeDelta * 2.0, 180.0)
        region = newRegion
    }
}

private let dateFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    return formatter
}()

struct UserLocation: Identifiable {
    let id = UUID()
    let latitude: Double
    let longitude: Double
    let icon: String
    let label: String
}

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

extension ISSTracker: Identifiable {
    var id: UUID { UUID() }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
