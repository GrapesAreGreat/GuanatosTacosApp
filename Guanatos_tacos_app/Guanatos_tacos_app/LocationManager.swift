import Foundation
import CoreLocation

// Define the LocationManager class
class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
    private let locationManager = CLLocationManager()
    
    @Published var locationStatus: CLAuthorizationStatus? // The current authorization status.
    @Published var lastLocation: CLLocation? // The last location received.
    
    // Initialize the LocationManager
    override init() {
        super.init()
        locationManager.delegate = self // Set the delegate to self to receive location updates.
        locationManager.desiredAccuracy = kCLLocationAccuracyBest // Set the desired accuracy.
        self.locationManager.requestWhenInUseAuthorization()
        self.locationManager.startUpdatingLocation()
    }
    
    // Request location authorization from the user.
    func requestAuthorization() {
        locationManager.requestWhenInUseAuthorization() // Request "when in use" authorization.
        // Use locationManager.requestAlwaysAuthorization() if you need "always" authorization.
    }
    
    // Start receiving location updates.
    func startUpdatingLocation() {
        locationManager.startUpdatingLocation()
    }
    
    // Delegate method that receives updates when the user's location authorization status changes.
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        locationStatus = manager.authorizationStatus
        if manager.authorizationStatus == .authorizedWhenInUse || manager.authorizationStatus == .authorizedAlways {
            locationManager.startUpdatingLocation() // Start location updates if authorized.
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        lastLocation = locations.last // Save the last location.
        
    }
}
