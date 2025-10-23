// ...existing code...

// Function to initialize the map and add the user's location marker
function initMap() {
    // ...existing code to initialize the map...

    // Check if geolocation is available
    if (navigator.geolocation) {
        navigator.geolocation.watchPosition(
            function (position) {
                const userLocation = {
                    lat: position.coords.latitude,
                    lng: position.coords.longitude
                };

                // Add a marker for the user's location
                if (!userLocationMarker) {
                    userLocationMarker = new google.maps.Marker({
                        position: userLocation,
                        map: map,
                        title: 'Your Location',
                        icon: 'path/to/location-icon.png' // Replace with the path to your location icon
                    });
                } else {
                    // Update the marker's position
                    userLocationMarker.setPosition(userLocation);
                }

                // Optionally, center the map on the user's location
                map.setCenter(userLocation);
            },
            function (error) {
                console.error('Error getting location: ', error);
            },
            {
                enableHighAccuracy: true,
                timeout: 5000,
                maximumAge: 0
            }
        );
    } else {
        console.error('Geolocation is not supported by this browser.');
    }
}

// Variable to hold the user's location marker
let userLocationMarker;

// ...existing code...
