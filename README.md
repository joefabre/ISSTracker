# ISS Tracker 🚀

![Version](https://img.shields.io/badge/Version-1.0.0-blue.svg)
![License](https://img.shields.io/badge/License-MIT-green.svg)
![Platform](https://img.shields.io/badge/Platform-iOS-orange.svg)
![Space](https://img.shields.io/badge/Space-ISS%20Tracking-purple.svg)

Know where the International Space Station (ISS) is at all times with this real-time tracking application. Follow the ISS as it orbits Earth, get notifications for visible passes, and explore detailed orbital information.

## 🌍 Live Demo

**Try it now**: [https://joefabre.github.io/ISSTracker/](https://joefabre.github.io/ISSTracker/)

## ✨ Features

### 🛰️ **Real-Time ISS Tracking**
- **Live Position**: Track the ISS current location over Earth
- **Orbital Path**: Visualize the complete orbital trajectory
- **Speed & Altitude**: Real-time telemetry data
- **Next Pass Predictions**: Know when ISS will be visible from your location

### 🌎 **Interactive World Map**
- **3D Earth Visualization**: Beautiful globe with ISS position overlay
- **Zoom & Pan**: Explore different regions of Earth
- **Day/Night Cycle**: See which parts of Earth are in daylight
- **Ground Track**: Historical and predicted ISS path

### 📍 **Location-Based Features**
- **Your Location**: Automatic detection of user location
- **Visibility Predictions**: When will ISS be visible overhead
- **Pass Alerts**: Notifications for upcoming visible passes
- **Elevation & Azimuth**: Precise viewing angles for optimal observation

### 📊 **Detailed Information**
- **Orbital Data**: Period, velocity, altitude, and inclination
- **Crew Information**: Current astronauts aboard the ISS
- **Mission Timeline**: Launch schedules and mission updates
- **Educational Content**: Learn about the ISS and space exploration

### 🔔 **Smart Notifications**
- **Pass Alerts**: Get notified before ISS becomes visible
- **Customizable Timing**: Set alerts 5, 10, or 30 minutes before passes
- **Weather Integration**: Check if viewing conditions are favorable
- **Timezone Support**: Accurate local time calculations

## 🛠️ Getting Started

### **Option 1: Online Web App (Recommended)**
Simply visit [https://joefabre.github.io/ISSTracker/](https://joefabre.github.io/ISSTracker/) in your web browser for instant access!

### **Option 2: iOS App Installation**
1. **Download from App Store** (if available)
2. **Or build from source**:
   ```bash
   git clone https://github.com/joefabre/ISSTracker.git
   cd ISSTracker
   # Open ISSTracker.xcodeproj in Xcode
   # Build and run on iOS device or simulator
   ```

## 📖 How to Use

### **Track the ISS**

1. **Open the Application**
   - Launch the ISS Tracker on your device
   - Allow location permissions for best experience

2. **View Current Position**
   - See the ISS location marked on the world map
   - Watch as it moves in real-time across Earth
   - Check current altitude, speed, and orbital data

3. **Find Visible Passes**
   - Navigate to the "Visible Passes" section
   - See upcoming opportunities to spot the ISS
   - Get detailed viewing instructions (direction, timing, brightness)

4. **Set Up Alerts**
   - Enable notifications for upcoming passes
   - Choose how far in advance you want to be notified
   - Never miss a spectacular ISS flyover again!

### **Understanding ISS Visibility**

#### **What Makes ISS Visible?**
- **Sunlight Reflection**: ISS must be in sunlight while you're in darkness
- **Altitude**: ISS passes high enough above the horizon
- **Duration**: Visible passes typically last 2-6 minutes
- **Brightness**: Can be as bright as Venus or even brighter

#### **Best Viewing Conditions**
- **Time**: 1-2 hours after sunset or before sunrise
- **Weather**: Clear skies with minimal cloud cover
- **Location**: Away from bright city lights for best visibility
- **Magnitude**: Brighter passes (lower magnitude numbers) are easier to see

## 🌟 ISS Facts & Information

### **About the International Space Station**
- **Altitude**: ~408 km (254 miles) above Earth
- **Speed**: ~27,600 km/h (17,150 mph)
- **Orbital Period**: ~93 minutes per orbit
- **Size**: About the size of a football field
- **Crew**: Typically 3-6 astronauts from multiple countries

### **Mission Highlights**
- **Continuous Habitation**: Occupied since November 2000
- **International Cooperation**: Partnership between NASA, Roscosmos, ESA, JAXA, and CSA
- **Scientific Research**: Hundreds of experiments conducted in microgravity
- **Educational Outreach**: Regular communication with schools and students

## 🔧 Technical Details

### **Data Sources**
- **NASA Open Data**: Real-time ISS telemetry
- **TLE Data**: Two-Line Element sets for orbital calculations
- **Weather APIs**: Viewing condition assessments
- **Timezone APIs**: Accurate local time calculations

### **Platform Compatibility**
- **iOS**: iPhone and iPad (iOS 12.0+)
- **Web Browser**: Chrome, Firefox, Safari, Edge
- **Mobile Responsive**: Optimized for mobile viewing
- **Offline Capability**: Basic tracking when offline

### **Technology Stack**
- **iOS**: Swift, UIKit, Core Location, MapKit
- **Web**: HTML5, CSS3, JavaScript ES6+
- **APIs**: NASA ISS API, Open Notify API
- **Mapping**: Interactive web maps with satellite overlays

## 📱 Features by Platform

### **iOS App Features**
- Native iOS interface with smooth animations
- Background app refresh for continuous tracking
- Push notifications for pass alerts
- Camera integration for ISS photography planning
- Apple Watch companion app (future feature)

### **Web App Features**
- Cross-platform compatibility
- No installation required
- Real-time updates via WebSocket
- Responsive design for all screen sizes
- PWA capabilities for offline use

## 🌌 Educational Resources

### **Learning About Space**
- **ISS Mission Overview**: Understanding the purpose and goals
- **Orbital Mechanics**: How and why the ISS stays in orbit
- **Life in Space**: Daily activities of astronauts
- **Space Photography**: Tips for capturing ISS images

### **Astronomy Integration**
- **Star Charts**: Constellation maps for better sky orientation
- **Planet Tracking**: See other planets during ISS passes
- **Satellite Identification**: Distinguish ISS from other satellites
- **Astrophotography**: Equipment and techniques for space imaging

## 🚀 Future Enhancements

### **Planned Features**
- **Crew Rotation Tracking**: Follow astronaut missions
- **Solar Panel Angle Visualization**: Detailed ISS orientation
- **Historical Pass Archive**: Review past ISS sightings
- **Social Sharing**: Share ISS photos and sightings
- **Augmented Reality**: Point phone at sky to locate ISS

### **Advanced Features**
- **Multiple Satellite Tracking**: Hubble, Dragon, Soyuz
- **Launch Notifications**: Upcoming missions to ISS
- **Weather Integration**: Cloud cover and visibility forecasts
- **Photography Mode**: Camera settings for ISS imaging
- **Community Features**: Connect with other ISS watchers

## 🤝 Contributing

Interested in space exploration and app development? Contribute to ISS Tracker:

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/space-enhancement`)
3. Commit your changes (`git commit -m 'Add stellar feature'`)
4. Push to the branch (`git push origin feature/space-enhancement`)
5. Open a Pull Request

### **Contribution Ideas**
- Additional satellite tracking capabilities
- Enhanced 3D visualization
- International space station facts and trivia
- Integration with telescope control software
- Amateur radio ISS communication features

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🙏 Acknowledgments

- **NASA**: For providing open access to ISS data and imagery
- **ISS Crew**: Astronauts who inspire us to look up
- **Space Community**: Amateur astronomers and space enthusiasts worldwide
- **Open Notify API**: For reliable ISS tracking data
- **International Partners**: ESA, Roscosmos, JAXA, CSA for ISS collaboration

## 🔗 Resources

### **Space Tracking Resources**
- [NASA ISS Tracker](https://spotthestation.nasa.gov/) - Official NASA ISS tracking
- [Heavens Above](https://www.heavens-above.com/) - Comprehensive satellite tracking
- [N2YO](https://www.n2yo.com/) - Real-time satellite tracking
- [ISS HD Earth Viewing](https://eol.jsc.nasa.gov/ESRS/HDEV/) - Live ISS camera feeds

### **Space Education**
- [NASA Education](https://www.nasa.gov/audience/foreducators/) - Educational resources
- [ESA Education](https://www.esa.int/Education) - European Space Agency learning materials
- [Space Station Research](https://www.nasa.gov/mission_pages/station/research/) - Current ISS experiments

---

**Look up and explore the cosmos! 🌌**

*Track the ISS and connect with space exploration at [https://joefabre.github.io/ISSTracker/](https://joefabre.github.io/ISSTracker/)*
